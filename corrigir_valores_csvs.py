import pandas as pd
import glob
import os

CAMINHO = "C:/Users/caarl/Documents/Projetos/Testes-Vagas/testes-intuitiveCare/teste_banco_de_dados/dados/contabeis"

arquivos = glob.glob(os.path.join(CAMINHO, "*.csv"))

for caminho_arquivo in arquivos:
    nome_arquivo = os.path.basename(caminho_arquivo)
    print(f"🔄 Corrigindo: {nome_arquivo}")

    df = pd.read_csv(caminho_arquivo, sep=';', encoding='latin1', dtype=str)

    for coluna in ['VL_SALDO_INICIAL', 'VL_SALDO_FINAL']:
        if coluna in df.columns:
            df[coluna] = df[coluna].str.replace('.', '', regex=False)
            df[coluna] = df[coluna].str.replace(',', '.', regex=False)
            df[coluna] = pd.to_numeric(df[coluna], errors='coerce')

    df.to_csv(caminho_arquivo, sep=';', index=False, encoding='utf-8')

    print(f"✅ {nome_arquivo} corrigido com sucesso.\n")

print("🎉 Todos os arquivos foram processados com sucesso!")