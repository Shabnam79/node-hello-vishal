const http = require('http');
const port = process.env.PORT || 5006;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  const msg = 'Hello Node!\n'
  const nsg = 'fffhghgfdygkkdjkkh'
  res.end(msg);
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});
