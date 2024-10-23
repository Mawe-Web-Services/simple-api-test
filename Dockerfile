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

# Copia o script entrypoint para o container
# Extremamente necessário para aumentar a seguraça de dados da sua aplicação
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Define o comando padrão de inicialização da aplicação
CMD ["node", "server.js"]
