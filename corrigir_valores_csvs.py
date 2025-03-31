import pandas as pd
import glob
import os

# Caminho completo da sua pasta com os arquivos CSV
CAMINHO = "C:/Users/caarl/Documents/Projetos/Testes-Vagas/testes-intuitiveCare/teste_banco_de_dados/dados/contabeis"

# Busca todos os arquivos .csv da pasta
arquivos = glob.glob(os.path.join(CAMINHO, "*.csv"))

for caminho_arquivo in arquivos:
    nome_arquivo = os.path.basename(caminho_arquivo)
    print(f"🔄 Corrigindo: {nome_arquivo}")

    # Lê o CSV com separador ; e encoding Latin1 (original da ANS)
    df = pd.read_csv(caminho_arquivo, sep=';', encoding='latin1', dtype=str)

    # Converte e limpa apenas as colunas numéricas
    for coluna in ['VL_SALDO_INICIAL', 'VL_SALDO_FINAL']:
        if coluna in df.columns:
            df[coluna] = df[coluna].str.replace('.', '', regex=False)     # remove separador de milhar
            df[coluna] = df[coluna].str.replace(',', '.', regex=False)    # troca vírgula por ponto
            df[coluna] = pd.to_numeric(df[coluna], errors='coerce')       # converte para float (com segurança)

    # Salva o arquivo corrigido no mesmo local, em UTF-8 (compatível com PostgreSQL)
    df.to_csv(caminho_arquivo, sep=';', index=False, encoding='utf-8')

    print(f"✅ {nome_arquivo} corrigido com sucesso.\n")

print("🎉 Todos os arquivos foram processados com sucesso!")