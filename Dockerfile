FROM node:latest

# add "app" user to run app
RUN useradd --user-group --create-home --shell /bin/false app 

ENV HOME=/home/app
ENV SRC=/home/app/src

# copy install files to $HOME
COPY package.json npm-shrinkwrap.json $HOME/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME
RUN npm install

# copy src files to $SRC
USER root
COPY src/ $SRC/
RUN chown -R app:app $HOME/*
USER app

CMD ["node", "src/index.js"]