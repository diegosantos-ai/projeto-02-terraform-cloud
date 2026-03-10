# Projeto 02 — AWS Web Infrastructure with Terraform

## Visão Geral

Este projeto tem como objetivo provisionar, via Terraform, uma infraestrutura web básica na AWS para hospedar um serviço web simples.

A proposta simula um cenário real em que uma equipe precisa publicar um ambiente de forma padronizada, reproduzível e sem depender da criação manual de recursos no console da cloud.

O foco do projeto é demonstrar práticas de **Infraestrutura como Código (IaC)**, organização técnica, versionamento, gerenciamento de estado e evolução para automação com pipeline.

---

## Problema que o projeto resolve

Em muitos cenários reais, ambientes de nuvem são criados manualmente no console da AWS, o que gera problemas como:

- falta de padronização
- dificuldade de reproduzir ambientes
- baixa rastreabilidade de mudanças
- dependência de conhecimento informal
- maior risco de erro operacional

Este projeto resolve esse problema ao definir a infraestrutura por código, permitindo criar, alterar e destruir recursos de forma previsível, auditável e reutilizável.

---

## Objetivo Principal

Provisionar via Terraform uma infraestrutura básica na AWS para hospedar um serviço web simples, aplicando práticas de Infraestrutura como Código, organização modular progressiva, gerenciamento de estado e automação de validação.

---

## Objetivos Técnicos

- automatizar a criação da infraestrutura sem uso manual do console AWS
- demonstrar uso de Terraform com organização e legibilidade
- provisionar rede, regras de acesso e instância EC2 via código
- utilizar variáveis e outputs para melhorar manutenção e reuso
- preparar o projeto para evolução com módulos
- demonstrar entendimento de state local e backend remoto
- evoluir o fluxo para validação automatizada com GitHub Actions

---

## Case do Projeto

Uma equipe precisa publicar um serviço web institucional simples na AWS de forma rápida, padronizada e reproduzível.

Em vez de criar manualmente VPC, subnets, regras de firewall e instâncias EC2 no console, a infraestrutura é provisionada integralmente com Terraform, permitindo versionamento, revisão e reaplicação do ambiente.

---

## Escopo do MVP

O MVP deste projeto contempla:

- configuração do provider AWS
- criação de uma VPC
- criação de uma subnet pública
- criação de Internet Gateway
- criação de Route Table pública
- associação da Route Table à subnet
- criação de Security Group para acesso ao serviço web
- provisionamento de uma instância EC2
- execução de servidor web simples via `user_data`
- exposição de outputs relevantes da infraestrutura
- fluxo funcional de `init`, `fmt`, `validate`, `plan`, `apply` e `destroy`

---

## Evoluções Planejadas

Após o MVP, o projeto poderá evoluir com:

- separação dos recursos por responsabilidade
- modularização da infraestrutura
- backend remoto com S3
- lock de state com DynamoDB
- validação automatizada com GitHub Actions
- melhoria de documentação e arquitetura
- execução opcional de serviço web em container Docker

---

## Arquitetura Esperada

A infraestrutura provisionada deverá conter:

- **VPC** para isolamento da rede
- **subnet pública** para hospedagem da instância
- **Internet Gateway** para acesso externo
- **Route Table** com rota para internet
- **Security Group** controlando acesso HTTP e SSH
- **EC2** executando um servidor web simples

Fluxo lógico:

`Terraform -> AWS VPC/Subnet/IGW/Route Table/Security Group -> EC2 -> Serviço Web`

---

## Estrutura Inicial do Projeto

```bash
.
├── contexto.md
├── main.tf
├── outputs.tf
├── provider.tf
├── README.md
├── terraform.tfvars
└── variables.tf
````

> Observação: a estrutura será evoluída ao longo do projeto conforme a necessidade de organização, separação de responsabilidades e modularização.

---

## Tecnologias Utilizadas

* Terraform
* AWS
* Amazon VPC
* Amazon EC2
* Security Groups
* Git
* GitHub Actions (evolução planejada)

---

## Requisitos Funcionais

O projeto deve ser capaz de:

* criar uma VPC na AWS
* criar uma subnet pública
* permitir saída para internet
* criar regras de acesso adequadas
* provisionar uma instância EC2
* disponibilizar um serviço web simples
* exibir informações úteis via outputs
* destruir a infraestrutura de forma controlada

---

## Requisitos Não Funcionais

O projeto deve:

* ser legível e organizado
* evitar hard-coding desnecessário
* permitir manutenção e evolução
* não expor credenciais no repositório
* ser validável com comandos do Terraform
* ser reproduzível por outra pessoa
* refletir boas práticas de organização de IaC

---

## Fluxo Operacional Esperado

O fluxo básico de operação do projeto será:

1. inicializar o Terraform
2. formatar o código
3. validar a configuração
4. revisar o plano de execução
5. aplicar a infraestrutura
6. validar os recursos criados
7. destruir a infraestrutura quando necessário

Comandos esperados:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## Boas Práticas Consideradas

* infraestrutura definida como código
* mudanças revisadas antes do `apply`
* uso de variáveis para valores configuráveis
* uso de outputs para inspeção dos recursos criados
* evolução progressiva da estrutura
* separação entre laboratório e prática recomendada de produção
* documentação como parte da entrega

---

## Riscos e Cuidados Operacionais

Durante o desenvolvimento deste projeto, alguns pontos exigem atenção:

* nunca versionar credenciais AWS
* revisar cuidadosamente o `terraform plan` antes do `apply`
* documentar simplificações de laboratório
* evitar exposição excessiva de portas no Security Group
* tratar o arquivo de state com atenção
* destruir recursos ao final dos testes para evitar custo desnecessário

---

## Status do Projeto

Projeto em fase de construção.

Etapas previstas:

* definição e organização inicial
* provisionamento da rede
* provisionamento da EC2
* refino e documentação
* modularização
* backend remoto
* CI/CD com GitHub Actions

---

## Aprendizados Esperados

Este projeto foi desenhado para demonstrar e consolidar conhecimentos em:

* Terraform
* AWS
* Infraestrutura como Código
* organização de projeto DevOps
* pensamento declarativo
* operação segura com validação prévia
* evolução de ambiente local para fluxo mais próximo do mundo real

---

## Autor

**Diego Santos**
Projeto desenvolvido como parte de uma trilha prática de evolução em DevOps e Cloud.

```

