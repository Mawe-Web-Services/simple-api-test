FROM node

# Define o diretório de trabalho dentro do container
WORKDIR /usr/src/app

# Cria um usuário não-root para rodar a aplicação
RUN useradd -ms /bin/bash appuser

# Copia os arquivos necessários para instalar as dependências
COPY package.json .

# Copia o arquivo .env e ajusta suas permissões para o root apenas
COPY .env /etc/secrets/.env
RUN chmod 600 /etc/secrets/.env

# Instala as dependências
RUN npm install

# Copia o restante do código da aplicação
COPY . .

# Ajusta permissões do diretório de trabalho
RUN chown -R appuser /usr/src/app

# Muda para o novo usuário
USER appuser

# Expõe a porta que a aplicação usará
EXPOSE 3003

# Define o comando padrão de inicialização da aplicação
CMD ["node", "server.js"]
