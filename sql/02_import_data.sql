-- Importando dados das operadoras
COPY operadoras_ativas
FROM 'C:/Users/caarl/Documents/Projetos/Testes-Vagas/testes-intuitiveCare/dados/operadoras/operadoras_ativas.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

-- dados contábeis de 2023
COPY demonstracoes_contabeis
FROM 'C:/Users/caarl/Documents/Projetos/Testes-Vagas/testes-intuitiveCare/dados/contabeis/demonstracoes_2023.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

-- dados contábeis de 2024
COPY demonstracoes_contabeis
FROM 'C:/Users/caarl/Documents/Projetos/Testes-Vagas/testes-intuitiveCare/dados/contabeis/demonstracoes_2024.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';
