import { Hono } from 'hono';
import { serve } from '@hono/node-server';

const app = new Hono();

app.get('/', (c) => c.text('Hello, world!'));

// サーバーを起動（ポート指定）
serve({
  fetch: app.fetch,
  port: 3000,
});