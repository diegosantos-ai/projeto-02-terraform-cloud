# Projeto 02 — AWS Web Infrastructure with Terraform

Provisionamento de infraestrutura básica na AWS com Terraform para hospedagem de serviço web simples, aplicando práticas de IaC, organização progressiva, validação e rastreabilidade.

![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-Cloud-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)
![EC2](https://img.shields.io/badge/Amazon_EC2-Compute-FF9900?style=for-the-badge&logo=amazon-ec2&logoColor=white)
![VPC](https://img.shields.io/badge/Amazon_VPC-Networking-146EB4?style=for-the-badge&logo=amazonaws&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-Server-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Git](https://img.shields.io/badge/Git-Versionamento-F05032?style=for-the-badge&logo=git&logoColor=white)
![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow?style=for-the-badge)

## Visão geral

Este projeto tem como objetivo provisionar, via Terraform, uma infraestrutura básica na AWS para hospedar um serviço web simples, aplicando práticas de Infraestrutura como Código (IaC), organização progressiva, versionamento, validação e documentação técnica.

A proposta é simular um cenário real em que uma equipe precisa publicar rapidamente um serviço web institucional de forma padronizada, reproduzível e rastreável, evitando a criação manual de recursos no console da AWS.

---

## Objetivo principal

Provisionar via Terraform uma infraestrutura básica na AWS para hospedar um serviço web simples, aplicando práticas de Infraestrutura como Código, organização modular progressiva, gerenciamento de estado e automação de validação.

---

## Case do projeto

Uma equipe precisa publicar um serviço web institucional simples na AWS de forma rápida, padronizada e reproduzível.

Em vez de criar manualmente VPC, subnets, regras de firewall e instâncias EC2 no console, a infraestrutura é provisionada integralmente com Terraform, permitindo versionamento, revisão, reaplicação e maior previsibilidade operacional.

---

## Escopo do projeto

A infraestrutura contempla:

- VPC customizada
- subnet pública
- Internet Gateway
- route table pública
- rota default para internet
- associação da route table à subnet pública
- security group para serviço web
- acesso HTTP público
- acesso SSH restrito por IP
- instância EC2 com IP público
- `user_data` para publicação automática de serviço web simples
- outputs para consulta e validação da infraestrutura

---

## Tecnologias utilizadas

- Terraform
- AWS
- Amazon VPC
- Amazon EC2
- Subnet
- Internet Gateway
- Route Table
- Security Groups
- Linux
- HTTP
- Git
- GitHub

---

## Região e convenções do projeto

### Região AWS
- `us-east-1`

### Convenção de nomes
- `p02-dev-<recurso>`

### Tags padrão
- `Project = projeto-02`
- `Name = nome-do-recurso`
- `Environment = dev`
- `ManagedBy = Terraform`
- `Owner = DiegoSantos`

---

## Estrutura atual do projeto

```text
.
├── contexto.md
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── terraform.tfvars.example
├── network.tf
├── security.tf
├── ec2.tf
├── outputs.tf
├── README.md
└── .gitignore
````

### Responsabilidade dos arquivos

* `provider.tf`
  Configuração do provider AWS.

* `variables.tf`
  Declaração das variáveis de entrada do projeto.

* `terraform.tfvars`
  Valores reais locais utilizados na execução.

* `terraform.tfvars.example`
  Exemplo de preenchimento das variáveis.

* `network.tf`
  Recursos de rede, como VPC, subnet, Internet Gateway, route table e associação.

* `security.tf`
  Recursos de segurança, como security group e regras de entrada e saída.

* `ec2.tf`
  Provisionamento da instância EC2 e configuração de `user_data`.

* `outputs.tf`
  Saídas da infraestrutura para consulta e validação.

* `README.md`
  Documentação principal do projeto.

---

## Status do projeto

### Fases concluídas

* Fase 1 — Definição e base do projeto
* Fase 2 — Estruturação base do Terraform
* Fase 3 — Provisionamento da rede
* Fase 4 — Segurança de acesso
* Fase 5 — Provisionamento da EC2
* Fase 6 — Refino do projeto

### Fase atual

Fase 7 — Modularização

### Próximas fases

* Fase 8 — Estado remoto
* Fase 9 — CI/CD com GitHub Actions
* Fase 10 — Fechamento de portfólio

---

## Infraestrutura provisionada até o momento

### Rede

* `aws_vpc.main`
* `aws_subnet.public`
* `aws_internet_gateway.main`
* `aws_route_table.public`
* `aws_route.public_internet_access`
* `aws_route_table_association.public`

### Segurança

* `aws_security_group.web`
* `aws_vpc_security_group_ingress_rule.web_http`
* `aws_vpc_security_group_ingress_rule.web_ssh`
* `aws_vpc_security_group_egress_rule.web_all_outbound`

### Computação

* `aws_instance.web`

---

## Outputs disponíveis

* `aws_region`
* `environment`
* `project_name`
* `owner`
* `vpc_id`
* `public_subnet_id`
* `internet_gateway_id`
* `public_route_table_id`
* `web_security_group_id`
* `web_instance_id`
* `web_instance_public_ip`
* `web_instance_public_dns`

---

## Pré-requisitos

Antes de executar o projeto, é necessário ter:

* Terraform instalado
* AWS CLI instalada e configurada
* credenciais AWS válidas no ambiente local
* um Key Pair já existente na AWS na região `us-east-1`
* permissões suficientes para criar recursos de rede, segurança e EC2

---

## Configuração do projeto

### 1. Clonar o repositório

```bash
git clone <url-do-repositorio>
cd projeto-02-terraform-cloud
```

### 2. Revisar o arquivo de exemplo

Use o arquivo `terraform.tfvars.example` como referência para preencher o `terraform.tfvars`.

### 3. Criar ou ajustar o `terraform.tfvars`

Exemplo:

```hcl
aws_region        = "us-east-1"
project_name      = "projeto-02"
environment       = "dev"
owner             = "DiegoSantos"

vpc_cidr_block    = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
availability_zone = "us-east-1a"

ssh_allowed_cidr  = "SEU_IP_PUBLICO/32"

instance_type     = "t3.micro"
key_pair_name     = "diego-key"
```

> O valor de `key_pair_name` deve ser o nome exato de um Key Pair já existente na AWS na região `us-east-1`.

---

## Fluxo de execução

A execução padrão do projeto segue esta ordem:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
terraform state list
```

---

## Fluxo operacional recomendado

### Antes de alterar

* revisar contexto atual do projeto
* confirmar branch correta
* verificar `git status`
* validar estado atual da infraestrutura
* revisar impacto antes de aplicar mudanças

### Durante a execução

* rodar `terraform fmt`
* rodar `terraform validate`
* ler o `terraform plan`
* aplicar somente após validação do comportamento esperado

### Após a execução

* revisar `terraform output`
* revisar `terraform state list`
* validar recursos no console AWS
* validar entrega funcional do serviço

---

## Critérios de validação do projeto

A validação do projeto não termina no `terraform apply`.

Cada fase deve ser considerada concluída apenas quando houver evidência técnica e funcional da entrega.

### Validações padrão

* `terraform fmt`
* `terraform validate`
* `terraform plan`
* `terraform apply`
* `terraform output`
* `terraform state list`
* validação no console AWS

### Validação funcional da EC2

* instância criada com sucesso
* subnet correta
* security group correto
* IP público atribuído
* serviço web respondendo externamente

### Exemplo de validação HTTP

```bash
curl http://IP_PUBLICO
```

---

## Exemplo de resultado esperado

Após o provisionamento da EC2, espera-se que o serviço responda algo semelhante a:

```html
<html>
  <head>
    <title>Projeto 02</title>
  </head>
  <body>
    <h1>Projeto 02 - AWS Web Infrastructure with Terraform</h1>
    <p>Servico web publicado com sucesso via Terraform.</p>
    <p>Environment: dev</p>
    <p>Owner: DiegoSantos</p>
  </body>
</html>
```

---

## Decisão de arquitetura

Nesta etapa do projeto, a infraestrutura permanece organizada por responsabilidade de arquivo no root module, evitando modularização prematura.

A adoção de módulos será considerada em fases futuras, quando houver repetição real de componentes, aumento de complexidade ou necessidade concreta de reutilização.

Essa abordagem mantém o projeto simples, legível e alinhado ao estágio atual da solução, sem perder a possibilidade de evolução posterior.

---

## Boas práticas aplicadas

* provisionamento via Infraestrutura como Código
* separação de responsabilidades por arquivo
* leitura de `terraform plan` antes de `apply`
* uso de variáveis e outputs para legibilidade e reuso
* controle de acesso SSH com restrição por IP
* validação terminal + console AWS
* versionamento por branch e fase
* rastreabilidade de entregas com Git e Trello
* documentação contínua do projeto

---

## Cuidados importantes

* não versionar `terraform.tfvars`
* não versionar arquivos de state
* não armazenar credenciais AWS em arquivos do projeto
* validar mudanças antes de aplicar em ambiente
* tratar recursos de segurança com cuidado, especialmente SSH
* destruir recursos ao final do uso se o objetivo for apenas laboratório, evitando custos desnecessários

---

## Limpeza do ambiente

Caso seja necessário remover os recursos provisionados:

```bash
terraform destroy
```

> Execute com atenção e somente quando tiver certeza de que o ambiente pode ser removido.

---

## Próximos passos

A próxima etapa do projeto é a **Fase 6 — Refino do projeto**, com foco em:

* revisão de nomes dos recursos
* revisão de variáveis e defaults
* revisão de outputs
* redução de hard-codes
* melhoria de legibilidade
* melhoria de documentação
* refinamento da reprodutibilidade

---

## Autor

**Diego Santos**

Projeto desenvolvido como prática de portfólio com foco em evolução técnica em DevOps, Cloud e Infraestrutura como Código.

```


