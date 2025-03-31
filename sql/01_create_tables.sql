CREATE TABLE operadoras_ativas (
    registro_ans VARCHAR(10) PRIMARY KEY,
    cnpj VARCHAR(20),
    razao_social TEXT,
    nome_fantasia TEXT,
    modalidade TEXT,
    data_registro DATE,
    uf VARCHAR(2),
    municipio TEXT,
    logradouro TEXT,
    numero TEXT,
    complemento TEXT,
    bairro TEXT,
    cep VARCHAR(10),
    ddd TEXT,
    telefone TEXT,
    email TEXT
);

CREATE TABLE demonstracoes_contabeis (
    ano INT,
    trimestre INT,
    registro_ans VARCHAR(10),
    nome_operadora TEXT,
    grupo_conta TEXT,
    subgrupo_conta TEXT,
    descricao_conta TEXT,
    valor NUMERIC
);