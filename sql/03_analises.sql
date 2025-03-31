-- Query 1: Top 10 operadoras com maiores despesas
SELECT 
    REG_ANS,
    EXTRACT(YEAR FROM DATA) AS ano,
    EXTRACT(QUARTER FROM DATA) AS trimestre,
    SUM(VL_SALDO_FINAL) AS total_despesas
FROM demonstracoes_contabeis
WHERE 
    DESCRICAO ILIKE '%sinistros%' AND
    DESCRICAO ILIKE '%médico%'
GROUP BY REG_ANS, ano, trimestre
HAVING EXTRACT(YEAR FROM DATA) = 2024 AND EXTRACT(QUARTER FROM DATA) = 4
ORDER BY total_despesas DESC
LIMIT 10;


-- Query 2: Top 10 operadoras com maiores despesas no último ANO (2024)
SELECT 
    REG_ANS,
    EXTRACT(YEAR FROM DATA) AS ano,
    SUM(VL_SALDO_FINAL) AS total_despesas
FROM demonstracoes_contabeis
WHERE 
    DESCRICAO ILIKE '%sinistros%' AND
    DESCRICAO ILIKE '%médico%'
GROUP BY REG_ANS, ano
HAVING EXTRACT(YEAR FROM DATA) = 2024
ORDER BY total_despesas DESC
LIMIT 10;


-- Query 3 (com JOIN): Top 10 operadoras com nome_fantasia no último ANO (2024)
SELECT 
    dc.REG_ANS,
    op.nome_fantasia,
    SUM(dc.VL_SALDO_FINAL) AS total_despesas
FROM demonstracoes_contabeis dc
JOIN operadoras_ativas op ON dc.REG_ANS = op.registro_ans
WHERE 
    dc.DESCRICAO ILIKE '%sinistros%' AND
    dc.DESCRICAO ILIKE '%médico%' AND
    EXTRACT(YEAR FROM dc.DATA) = 2024
GROUP BY dc.REG_ANS, op.nome_fantasia
ORDER BY total_despesas DESC
LIMIT 10;