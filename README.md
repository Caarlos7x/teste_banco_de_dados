# Desafio de Banco de Dados - Intuitive Care

Este repositório contém a solução para o desafio de banco de dados proposto no processo seletivo da Intuitive Care, focando na ingestão e análise de dados públicos da ANS (Agência Nacional de Saúde Suplementar).

#

### 📄 Descrição do Desafio

O desafio consiste em:

1. Baixar os dados públicos da ANS:

    - Demonstrativos contábeis dos últimos 2 anos

    - Cadastro de operadoras ativas

2. Criar a estrutura de banco de dados para armazenar essas informações.

3. Importar os dados de forma eficiente e segura.

4. Desenvolver queries analíticas para responder a perguntas específicas de negócio.

#

### 📁 Estrutura do Projeto
```
/teste_banco_de_dados
├── dados/
│   ├── contabeis/            # CSVs corrigidos com dados contábeis
│   └── operadoras/           # CSV com operadoras ativas
├── sql/                      # Scripts SQL para estrutura, importação e análises
│   ├── 01_create_tables.sql
│   ├── 02_import_data.sql (ou comandos via \copy)
│   └── 03_analises.sql
```

#

`01_create_tables.sql`

Cria as tabelas `demonstracoes_contabeis` e `operadoras_ativas` de acordo com a estrutura dos arquivos CSV.

`02_import_data.sql`

Importa os dados corrigidos usando o comando `\copy` (executado via psql com o usuário `ans_user`).

`03_analises.sql`

Contém 3 queries analíticas:

1. Top 10 operadoras com maiores despesas em **"sinistros conhecidos médico-hospitalares" no último trimestre de 2024**

2. Top 10 operadoras com maiores despesas no ano de 2024

3. A mesma análise acima com `JOIN` na tabela de operadoras para mostrar o `nome_fantasia`

#

### Como Executar

#### Requisitos:

- PostgreSQL 10 ou superior

- Python 3 (para tratamento dos CSVs)

- Biblioteca pandas

#### Passos:

1. Criar banco e usuário:
```
CREATE DATABASE ans_dados;
CREATE USER ans_user WITH PASSWORD '123456';
GRANT ALL PRIVILEGES ON DATABASE ans_dados TO ans_user;
```

2. Rodar script de criação:
```
psql -U ans_user -d ans_dados -h localhost -p 5432
\i '.../sql/01_create_tables.sql'
```
3. Corrigir arquivos CSV com script Python (conversão de vírgula para ponto):
```bash
python corrigir_valores_csvs.py
```

4. Importar dados:
```bash
\copy demonstracoes_contabeis FROM 'caminho/arquivo.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';
```

5. Rodar análises:
```
\i '.../sql/03_analises.sql'
```

#

### Destaques Técnicos

- Uso de Python para limpeza segura dos dados numéricos
- Importação performática com `\copy`
- Uso de `ILIKE`, `EXTRACT(YEAR)`, `EXTRACT(QUARTER)` e `GROUP BY` para análises
- Otimização das queries com filtros diretos e `LIMIT`

#

