# 👋 Olá, eu sou o Thiago Feijó!

**Tech Lead | Senior Software Engineer**

[![LinkedIn](https://img.shields.io/badge/-Thiago%20Feijó-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/tfeijo/)](https://www.linkedin.com/in/tfeijo/)
📧 tfeijo@gmail.com • 📞 +55 (24) 99219-0636

---

## Sobre Mim
_"Transformar equipes, arquitetar soluções, construir futuro."_ 🚀

Atuo como **Tech Lead** com foco em **engenharia de software**, **bancos de dados**, **microsserviços** e **desenvolvimento de times**. Minha experiência inclui:

- **Liderança técnica** de time com 9+ desenvolvedores, com code review ativo, mentoring e decisões arquiteturais.
- Liderança de projetos críticos de **migração de sistemas legados** para arquiteturas modernas (Rails monolith V3 → V4, APIs RESTful versionadas).
- Evolução de **plataformas de crédito consignado**, alinhando tecnologia ao crescimento de negócio.
- **Debugging e otimização de performance em produção** (memory leaks, query optimization, CI/CD pipelines).
- Participação ativa em projetos de **pesquisa aplicada** envolvendo **sustentabilidade no agronegócio**.

Valorizo a **escuta ativa**, **decisões técnicas baseadas em entendimento profundo do problema** e **crescimento coletivo**.

---

## 🛠️ Tech Stack

### Backend
![Ruby](https://img.shields.io/badge/Ruby-CC342D?logo=ruby&logoColor=white)
![Ruby on Rails](https://img.shields.io/badge/Rails-CC0000?logo=rubyonrails&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?logo=nodedotjs&logoColor=white)
![NestJS](https://img.shields.io/badge/NestJS-E0234E?logo=nestjs&logoColor=white)

### Frontend
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?logo=typescript&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)
![React](https://img.shields.io/badge/React-20232A?logo=react&logoColor=61DAFB)
![Next.js](https://img.shields.io/badge/Next.js-000000?logo=nextdotjs&logoColor=white)
![Hotwire](https://img.shields.io/badge/Hotwire-FFE801?logo=stimulus&logoColor=black)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-06B6D4?logo=tailwindcss&logoColor=white)

### Testing
![Minitest](https://img.shields.io/badge/Minitest-CC342D?logo=ruby&logoColor=white)
![Jest](https://img.shields.io/badge/Jest-C21325?logo=jest&logoColor=white)

### DevOps & Infra
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?logo=githubactions&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)
![Redis](https://img.shields.io/badge/Redis-DC382D?logo=redis&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?logo=amazonwebservices&logoColor=white)

---

## 📈 Contribuições Open Source

- 🔹 [primer/primitives - PR #1289](https://github.com/primer/primitives/pull/1289) _(merged)_
  _Correção de sintaxe `@custom-media` no GitHub Design System (Primer). Fix aceito e mergeado no repositório oficial._

- 🔹 [codecon-dev/code-kata-timer - PR #27](https://github.com/codecon-dev/code-kata-timer/pull/27)
  _Melhorias no TimerController: Implementação correta de FullScreen API, separação entre ações e reações, ajuste automático de botões._

- 🔹 [codecon-dev/code-kata-timer - PR #28](https://github.com/codecon-dev/code-kata-timer/pull/28)
  _Estruturação de testes automatizados com Jest, criação de mocks (`__mocks__`) e testes unitários/integrados (`__tests__`).
  Integração com **GitHub Actions** para validar PRs com testes automatizados._

---

### 📦 Projeto: Plataforma de Gestão de Contratos

Este projeto faz parte de uma solução distribuída desenvolvida para o desafio técnico. Ele representa o backend de contratos, com arquitetura moderna, foco em desacoplamento e execução escalável.

#### 🧰 Stack
- Node.js
- PostgreSQL (Neon)
- Prisma ORM
- Redis (Upstash)
- Worker assíncrono (Railway)
- Docker / Docker Compose

#### 🔗 Repositórios:
- [github.com/tfeijo/contatos-api-node](https://github.com/tfeijo/contatos-api-node)
- [github.com/tfeijo/frontend-redix](https://github.com/tfeijo/frontend-redix)
- [github.com/tfeijo/contratos-redix](https://github.com/tfeijo/contratos-redix)

#### 🧱 Arquitetura - [link](https://drive.google.com/file/d/16ESgt71Q48slQeRHPZLqmPDeg5n5B_oQ/view?usp=sharing)
- Microsserviço `contratos-api` com banco independente (`contratos-db`);
- Worker desacoplado via Redis, processando tarefas assíncronas;
- Totalmente conteinerizado e pronto para deploy em múltiplas clouds;
- Comunica-se com o frontend via API REST hospedada em Render.

---

### 🚀 Projeto: Relay Intelligence Platform

Plataforma de inteligência em construção com arquitetura moderna e foco em escalabilidade.

#### 🧰 Stack
- NestJS 11 + Fastify 5
- TypeScript com SWC
- Monorepo com npm workspaces + Turborepo
- Biome (linting/formatting)

#### 🔗 Repositório:
- [github.com/tfeijo/relay-AI-platform](https://github.com/tfeijo/relay-AI-platform)
