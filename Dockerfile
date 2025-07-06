# 1. Usar uma imagem base de Python estável e leve
FROM python:3.14.0b3-alpine3.22

# 2. Definir diretório de trabalho para dentro do contêiner.

WORKDIR / app

# 3. Copia o arquivo de requisistos e instala as dependências

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt


# 4. Copiar o restante do código da aplicação
COPY . .

# 5. Expor a porta em que a aplicação será executada
EXPOSE 8000

# 6. Comando para iniciar a aplicação com Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]