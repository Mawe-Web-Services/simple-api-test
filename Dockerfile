FROM node

# Define o diretório de trabalho dentro do container
WORKDIR /usr/src/app

# Copia os arquivos necessários para instalar as dependências
COPY package.json . 
COPY .env .env

# Instala as dependências
RUN npm install

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta que a aplicação usará
EXPOSE 3003

# Define o comando padrão de inicialização da aplicação
CMD ["node", "server.js"]
