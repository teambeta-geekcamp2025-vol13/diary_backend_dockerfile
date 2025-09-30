FROM node:22

# 作業ディレクトリ
WORKDIR /app

# 依存関係をコピーしてインストール
COPY package*.json ./

RUN npm install -g npm@11.6.1
RUN npm install -g deno && deno upgrade
RUN deno add npm:@google/genai
RUN deno add npm:@google-cloud/vision
RUN npm install  

# ソースコードをコピー
COPY . .
RUN apt update
RUN apt install -y docker.io
#systemctl start docker

RUN npm create hono@latest src -- --template=deno
RUN npx tsc --init
CMD ["npx", "nodemon", "--watch", "src", "--exec", "ts-node", "src/index.ts"]
