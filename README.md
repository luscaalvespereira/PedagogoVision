<div align="center">

# 🎓 PedagogoVision Studio

**Estúdio Multimodal de Transmutação de Fotos de Tarefas em Documentos Didáticos de Leitura**

[![Python 3.10+](https://img.shields.io/badge/Python-3.10%2B-blue.svg?logo=python&logoColor=white)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.115%2B-009688.svg?logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Metodologia I.D.E.A.L.](https://img.shields.io/badge/Metodologia-I.D.E.A.L.-indigo.svg)](#)
[![Blindagem Anti-Gabarito](https://img.shields.io/badge/Protocolo-Anti--Gabarito-emerald.svg)](#)

<p align="center">
  <em>Transforme fotografias de cadernos escolares, folhas de exercícios xerocadas e avaliações em apostilas completas de estudo autônomo com 11 seções didáticas, exemplos isomórficos e adaptação neuroinclusiva para TEA, TDAH e Dislexia.</em>
</p>

</div>

---

## 📌 O Problema e a Solução

A prática pedagógica tradicional defronta-se diariamente com um obstáculo estrutural: o professor passa tarefas no quadro ou entrega folhas de atividades; ao chegar em casa, o estudante em situação de vulnerabilidade ou sem auxílio familiar defronta-se com o exercício **sem o contexto teórico fundante**, entrando em desamparo cognitivo e recorrendo a cópias mecânicas da internet.

O **PedagogoVision Studio** rejeita atalhos predatórios. Ele opera uma **engenharia reversa do conhecimento**:
1. Lê a fotografia da tarefa do aluno via Visão Computacional Multimodal;
2. Identifica o currículo implícito (habilidades BNCC) e a Zona de Desenvolvimento Proximal (Lev Vygotsky);
3. Aplica a **Taxonomia de Bloom Reversa**;
4. **BLINDAGEM ANTI-GABARITO:** Proíbe terminantemente a entrega das respostas dos exercícios originais;
5. Reconstrói a apostila sob medida que faltou à tarefa, com **exemplos isomórficos resolvidos** (mesma estrutura, dados diferentes) e roteiros reflexivos guiados.

---

## 🏗️ Arquitetura do Sistema

```
                         [ FOTOGRAFIA DA TAREFA ]
                                    │
                       (Upload / Drag & Drop / Ctrl+V)
                                    ▼
       ┌─────────────────────────────────────────────────────────┐
       │                PEDAGOGOVISION STUDIO ENGINE             │
       ├─────────────────────────────────────────────────────────┤
       │  1. Ingestão Multimodal: Base64 / Multipart             │
       │  2. Pipeline de Visão: Gemini Pro/Flash | Ollama Local  │
       │  3. Motor de Prompt I.D.E.A.L. (11 Seções Fixas)        │
       │  4. Filtro de Inclusão: Padrão | TEA | TDAH | Dislexia   │
       │  5. Persistência Local: SQLite no Disco Local D:        │
       └────────────────────────────┬────────────────────────────┘
                                    │
                                    ▼
       ┌─────────────────────────────────────────────────────────┐
       │                 QUÁDRUPLO ENTREGÁVEL A4                 │
       ├─────────────────────────────────────────────────────────┤
       │  • Visualização Split-View (Foto Original vs Apostila)  │
       │  • Impressão A4 formatada com cabeçalho escolar oficial │
       │  • Exportação instantânea em Markdown (.md)             │
       │  • Histórico auditável de documentos gerados            │
       └─────────────────────────────────────────────────────────┘
```

---

## ⚡ As 11 Seções Didáticas Obrigatórias

Cada documento gerado pelo sistema obedece rigorosamente ao padrão:

| Módulo | Nome da Seção | Objetivo Pedagógico |
| :--- | :--- | :--- |
| **01** | **Identificação Curricular** | Disciplina, ano inferido, tema central e código BNCC associado. |
| **02** | **Objetivo da Aprendizagem** | Declaração clara do que o estudante dominará ao término da leitura. |
| **03** | **Pré-Requisitos Fundamentais** | Revisão rápida de regras e conceitos prévios (*O que saber antes*). |
| **04** | **Explicação Passo a Passo** | Didatização do conceito com analogias práticas do cotidiano. |
| **05** | **Exemplos Isomórficos** | **Zero Gabarito:** Exercícios idênticos em lógica, mas com outros dados, resolvidos detalhadamente. |
| **06** | **Erros Comuns e Pegadinhas** | Mapeamento dos tropeços mais frequentes e como desarmá-los. |
| **07** | **Dicas e Mnemônicos** | Esquemas mentais e frases mnemônicas para retenção ativa. |
| **08** | **Roteiro de Resolução Guiada** | Perguntas norteadoras para o aluno resolver a tarefa do caderno sozinho. |
| **09** | **Glossário de Palavras-Chave** | Tabela lexical traduzindo termos técnicos em linguagem direta. |
| **10** | **Desafio Autônomo Inédito** | Questão extra inédita para testar a consolidação do esquema neural. |
| **11** | **Rúbrica de Autoavaliação** | Checklist de critérios para o próprio aluno marcar seu progresso. |

---

## 🧩 Perfis de Acessibilidade e Neuroinclusão

* ⚖️ **Padrão:** Didática equilibrada, acolhedora e com profundidade curricular.
* 🧩 **TEA (Autismo):** Linguagem estritamente literal (sem metáforas ambíguas ou duplos sentidos), instruções fracionadas em passos lineares (1, 2, 3) e tabelas visuais estruturadas.
* ⚡ **TDAH:** Micro-blocos textuais concisos, termos essenciais destacados em alto relevo visual, mnemônicos rápidos e quebras dinâmicas de ritmo para retenção de foco.
* 📖 **Dislexia:** Sintaxe estritamente direta (Sujeito + Verbo + Objeto), frases curtas e espaçamento visual calibrado.

---

## 🚀 Como Executar Localmente

### Opção 1: No Windows (Launcher de 1 Clique)
1. Clone o repositório ou descompacte a pasta:
   ```bash
   git clone https://github.com/SEU_USUARIO/PedagogoVision.git
   cd PedagogoVision
   ```
2. Dê um **duplo clique** em `Iniciar_PedagogoVision.bat`.
3. O script detecta automaticamente o interpretador Python (mesmo instalado via Microsoft Store), valida as dependências e abre o estúdio em seu navegador padrão em:
   ```
   http://localhost:5050
   ```

### Opção 2: Via PowerShell
```powershell
Set-Location .\PedagogoVision
.\Iniciar_PedagogoVision.ps1
```

### Opção 3: Manual (Linux / macOS / Windows)
```bash
cd PedagogoVision
pip install -r backend/requirements.txt
python backend/server.py
```

---

## 🗂️ Estrutura de Arquivos do Repositório

```
PedagogoVision/
├── backend/
│   ├── server.py              # API FastAPI assíncrona e servidor de arquivos estáticos
│   ├── prompt_engine.py       # Motor algorítmico do Meta-Prompt I.D.E.A.L. (11 seções)
│   ├── vision_processor.py    # Pipeline multimodal (Gemini / Ollama / Mock Didático)
│   ├── database.py            # Persistência SQLite local (com histórico e auditoria)
│   └── requirements.txt       # Dependências mínimas de backend
├── frontend/
│   ├── index.html             # Interface Web moderna com layout split-view responsivo
│   ├── style.css              # Design system glassmorphic e regras de impressão A4
│   ├── app.js                 # Controlador reativo (drag & drop, Ctrl+V, exportadores)
│   └── favicon.svg            # Ícone vetorial oficial
├── Iniciar_PedagogoVision.bat # Launcher de duplo clique para Windows
├── Iniciar_PedagogoVision.ps1 # Launcher PowerShell (UTF-8 com BOM e CRLF)
├── Copiar_Para_Desktop.bat    # Script de espelhamento e criação de atalho na Área de Trabalho
├── .gitignore                 # Arquivo de exclusão de binários, logs e bancos locais
├── LICENSE                    # Licença MIT
└── README.md                  # Documentação completa
```

---

## 📄 Licença

Distribuído sob a Licença **MIT**. Consulte o arquivo [`LICENSE`](LICENSE) para mais detalhes.
