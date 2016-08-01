process.env.NODE_ENV = 'production';
var restify = require('restify');


function fib (n) {
 if (n === 0) {
   return 0;
 } else if (n == 1) {
   return 1;
 } else {
   return fib(n - 1) + fib(n - 2);
 }
}


function respond(req, res, next) {
  var result = fib(req.params.num);
  res.send("Node + Restify<hr> fib("+req.params.num+"): "+result); 
  next();
}

var server = restify.createServer();
server.get('/:num', respond);

server.listen(3000, function() {
  console.log('%s listening at %s', server.name, server.url);
});