# CloudMart E-Commerce Platform - Multi-Cloud, DevOps & AI Challenge

Bem-vindo ao desafio de 5 dias! Neste bootcamp, você será desafiado a construir uma plataforma de e-commerce de ponta, chamada **CloudMart**, utilizando uma variedade de tecnologias avançadas. A cada dia, você vai colocar em prática conceitos de **DevOps**, **Multi-Cloud**, **Docker**, **Kubernetes**, **IA**, e **CI/CD**, além de explorar a automação do provisionamento de infraestrutura, criação de agentes de IA e integração entre várias nuvens (AWS, Google Cloud, Microsoft Azure).

## Objetivo

Em apenas **5 dias**, você irá construir e implantar a plataforma **CloudMart**, um e-commerce totalmente funcional, substituindo tarefas manuais com Agentes de IA, integrando soluções de **Multi-Cloud** para melhorar a escalabilidade, performance e automação. Durante este processo, você usará tecnologias de ponta como **AWS**, **Terraform**, **Docker**, **Kubernetes**, **Claude**, **OpenAI GPT**, **Amazon Bedrock**, **Google Cloud** e **Microsoft Azure AI**.

## Tecnologias Utilizadas
- **AWS** (Amazon Web Services)
- **Terraform**
- **Docker**
- **Kubernetes**
- **Claude** (Agentes de IA)
- **OpenAI GPT**
- **Amazon Bedrock**
- **Google Cloud**
- **Microsoft Azure AI**
- **CI/CD** (Integração Contínua e Entrega Contínua)

---

## Descrição do Projeto

**CloudMart** é uma plataforma de e-commerce que simula um cenário real de como as empresas estão utilizando a automação para substituir centenas de profissionais com Agentes de IA. A plataforma será construída em uma **infraestrutura Multi-Cloud**, aproveitando os recursos das principais nuvens públicas. O objetivo é fornecer uma experiência prática que simula os desafios e a inovação que as empresas estão implementando no mercado.

### O que você vai aprender
- **Provisionamento de Infraestrutura** com **Terraform** na **AWS**.
- **Implantação de Contêineres** com **Docker** e **Kubernetes** na **AWS**.
- **Automatização de Pipelines CI/CD** para facilitar o processo de deploy contínuo.
- **Criação de Agentes de IA** para automatizar tarefas e substituir a necessidade de 200 profissionais.
- **Integração Multi-Cloud** utilizando **Google Cloud** para **Data Warehousing** e **Microsoft Azure AI** para **Análise de Sentimentos**.

---

## Conteúdo do Bootcamp

### **Dia 1 - Automatizando o provisionamento AWS com Terraform usando Claude**
Neste primeiro dia, você aprenderá a automatizar o provisionamento da infraestrutura da **AWS** com **Terraform**. Utilizando **Claude**, um agente de IA, você irá acelerar o processo de criação de recursos na nuvem. A ideia é aprender a criar uma infraestrutura escalável e segura, com pouco esforço manual.

**Tarefas:**
- Configuração do Terraform.
- Provisionamento da infraestrutura na **AWS**.
- Utilização do **Claude** para otimizar a criação de recursos na nuvem.

### **Dia 2 - Implantando a aplicação com Docker & Kubernetes na AWS**
Hoje, você irá aprender a **containerizar** sua aplicação de e-commerce utilizando **Docker** e **Kubernetes**. Com isso, a aplicação será escalável e mais fácil de gerenciar. A implantação será feita diretamente na **AWS** para garantir alta disponibilidade e resiliência.

**Tarefas:**
- Criação de imagens Docker.
- Configuração e deploy da aplicação no **Kubernetes**.
- Gerenciamento de clusters Kubernetes na **AWS**.

### **Dia 3 - Colocando a aplicação Cloud no piloto automático com pipelines DevOps CI/CD na AWS**
No terceiro dia, você vai criar **pipelines CI/CD** para automatizar o processo de integração e entrega contínua da sua aplicação. Isso garante que as mudanças no código sejam testadas e implantadas automaticamente, tornando a plataforma de e-commerce mais ágil.

**Tarefas:**
- Criação de pipelines CI/CD utilizando **AWS CodePipeline**.
- Configuração de **testes automáticos**.
- Implementação de automações para deploy contínuo.

### **Dia 4 - Criando Agentes de IA com OpenAI e Amazon Bedrock**
Agora é hora de adicionar inteligência à **CloudMart**! Com **OpenAI GPT** e **Amazon Bedrock**, você criará **Agentes de IA** capazes de substituir funções humanas, como atendimento ao cliente, análise de dados e recomendações de produtos.

**Tarefas:**
- Implementação de **Agentes de IA** para realizar tarefas específicas.
- Utilização de **Amazon Bedrock** para personalizar os modelos de IA.
- Integração de **OpenAI GPT** para interações de chat com os usuários.

### **Dia 5 - Indo para MultiCloud: DW/BI no Google Cloud & Análise de Sentimentos com Microsoft Azure AI**
No último dia, você aprenderá a integrar múltiplas nuvens para **análise de dados** e **análise de sentimentos**. Utilizando **Google Cloud** para **Data Warehousing** e **Microsoft Azure AI** para análise de sentimentos, a plataforma se tornará mais inteligente e orientada por dados.

**Tarefas:**
- Criação de **Data Warehouse** no **Google Cloud** para armazenar dados da plataforma.
- Análise de **sentimentos** usando **Microsoft Azure AI** para avaliar feedback dos clientes.
- Integração de soluções Multi-Cloud para garantir a eficiência e escalabilidade.

---

## Como rodar o projeto localmente

### 1. **Pré-requisitos**

Antes de começar, você precisará das seguintes ferramentas instaladas em sua máquina:
- **Docker**: para containerizar a aplicação.
- **Kubernetes**: para gerenciar os containers.
- **Terraform**: para provisionamento de infraestrutura.
- **AWS CLI**: para interagir com os serviços AWS.
- **Node.js**: para rodar a aplicação localmente.

### 2. **Instruções de instalação**

1. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/cloudmart.git
   cd cloudmart
   ```

2. **Docker**:
   Construa a imagem Docker da aplicação:

   ```bash
   docker build -t cloudmart .
   ```

3. **Kubernetes**:
   Suba os pods no Kubernetes localmente com:

   ```bash
   kubectl apply -f kubernetes/
   ```

4. **Terraform**:
   Configure o Terraform para provisionar a infraestrutura AWS:

   ```bash
   terraform init
   terraform apply
   ```

5. **CI/CD**:
   Configure os pipelines de integração contínua no **AWS CodePipeline** para deploy automático.

---

## Contribuições

Se você tiver ideias para melhorias ou se deparar com algum problema, fique à vontade para abrir um **issue** ou enviar um **pull request**.

---

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

Boa sorte no desafio e aproveite a experiência!