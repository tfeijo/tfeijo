#!/usr/bin/env bash
set -eu

# ── Colors ───────────────────────────────────────────────────────────────────
BOLD='\033[1m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
DIM='\033[2m'
RESET='\033[0m'

# ── Ensure we're in a git repo ───────────────────────────────────────────────
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo -e "${RED}Error: not inside a git repository.${RESET}"
  exit 1
fi

# Prefer remote repo name (owner/repo), fallback to local directory name
REMOTE_URL=$(git remote get-url origin 2>/dev/null || true)
if [ -n "$REMOTE_URL" ]; then
  # Strip .git suffix, then extract owner/repo from the URL
  clean=${REMOTE_URL%.git}
  REPO_NAME=$(echo "$clean" | sed -E 's#^.+[:/]([^/]+/[^/]+)$#\1#')
else
  REPO_NAME=$(basename "$(git rev-parse --show-toplevel)")
fi
BRANCH=$(git branch --show-current 2>/dev/null || echo "detached")
TOTAL_COMMITS=$(git rev-list --all --count)

# Collect unique authors once
AUTHORS=()
while IFS= read -r author; do
  AUTHORS+=("$author")
done < <(git log --all --no-merges --format='%aN' | sort -u)

echo ""
echo -e "${BOLD}══════════════════════════════════════════════════════════${RESET}"
echo -e "${BOLD}  Contribution Stats — ${CYAN}${REPO_NAME}${RESET} ${DIM}(${BRANCH})${RESET}"
echo -e "${BOLD}══════════════════════════════════════════════════════════${RESET}"
echo -e "  Total commits: ${BOLD}${TOTAL_COMMITS}${RESET}"
echo ""

# ── 1. Commits per author ────────────────────────────────────────────────────
echo -e "${BOLD}${GREEN}▸ Commits por autor${RESET}"
echo -e "${DIM}──────────────────────────────────────────────────────────${RESET}"
git shortlog -sn --all --no-merges | while IFS=$'\t' read -r count name; do
  count=$(echo "$count" | xargs)
  pct=$(awk "BEGIN { printf \"%.1f\", ($count / $TOTAL_COMMITS) * 100 }")
  printf "  ${BOLD}%6d${RESET}  %-30s ${DIM}(%s%%)${RESET}\n" "$count" "$name" "$pct"
done
echo ""

# ── 2. Lines added / removed per author ──────────────────────────────────────
echo -e "${BOLD}${YELLOW}▸ Linhas adicionadas / removidas por autor${RESET}"
echo -e "${DIM}──────────────────────────────────────────────────────────${RESET}"
for author in "${AUTHORS[@]}"; do
  stats=$(git log --all --no-merges --author="$author" --pretty=tformat: --numstat 2>/dev/null \
    | awk '{ add += $1; del += $2 } END { printf "%d %d", add+0, del+0 }')
  added=$(echo "$stats" | cut -d' ' -f1)
  removed=$(echo "$stats" | cut -d' ' -f2)
  printf "  ${GREEN}+%-8d${RESET} ${RED}-%-8d${RESET}  %s\n" "$added" "$removed" "$author"
done
echo ""

# ── 3. Files touched per author ──────────────────────────────────────────────
echo -e "${BOLD}${CYAN}▸ Arquivos modificados por autor${RESET}"
echo -e "${DIM}──────────────────────────────────────────────────────────${RESET}"
for author in "${AUTHORS[@]}"; do
  file_count=$(git log --all --no-merges --author="$author" --name-only --pretty=format: \
    | sort -u | grep -c . || true)
  printf "  ${BOLD}%6d${RESET}  %s\n" "$file_count" "$author"
done
echo ""

# ── 4. Recent activity (last 30 days) ────────────────────────────────────────
echo -e "${BOLD}${YELLOW}▸ Atividade recente (últimos 30 dias)${RESET}"
echo -e "${DIM}──────────────────────────────────────────────────────────${RESET}"
recent=$(git shortlog -sn --all --no-merges --since="30 days ago")
if [ -z "$recent" ]; then
  echo -e "  ${DIM}Nenhum commit nos últimos 30 dias.${RESET}"
else
  echo "$recent" | while IFS=$'\t' read -r count name; do
    count=$(echo "$count" | xargs)
    printf "  ${BOLD}%6d${RESET}  %s\n" "$count" "$name"
  done
fi
echo ""

# ── 5. First and last commit per author ──────────────────────────────────────
echo -e "${BOLD}${GREEN}▸ Primeiro e último commit por autor${RESET}"
echo -e "${DIM}──────────────────────────────────────────────────────────${RESET}"
for author in "${AUTHORS[@]}"; do
  last=$(git log --all --no-merges --author="$author" --format='%as' --max-count=1 2>/dev/null)
  first=$(git log --all --no-merges --author="$author" --format='%as' --diff-filter=A 2>/dev/null | tail -1)
  if [ -z "$first" ]; then
    first=$(git log --all --no-merges --author="$author" --format='%as' 2>/dev/null | tail -1)
  fi
  printf "  %-30s ${DIM}%s → %s${RESET}\n" "$author" "$first" "$last"
done
echo ""
echo -e "${DIM}══════════════════════════════════════════════════════════${RESET}"
