var http = require('http'),
	fs = require('fs'),
	sanitize = require('validator').sanitize;

var app = http.createServer(function (request, response) {
	fs.readFile("client.html", 'utf-8', function(error, data) {
		response.writeHead(200, {'Content-Type':'text/html'});
		response.write(data);
		response.end();
	});
}).listen(1337);

var io = require('socket.io').listen(app);

io.sockets.on('connection', function(socket) {
	//socket.broadcast.to('room').emit('message_to_server', data);
	socket.on('message_to_server', function(data) {
		var escaped_message = sanitize(data["message"]).escape();
		socket.broadcast.to(data["room"]).emit('message_to_client', {message:escaped_message, pos:data["pos"],d:data});
	});
	socket.on('get_client', function(data) {
		var clientsObject = io.sockets.clients(data["room"]);
		var clientsName = [];
		//console.log(clients);
		clientsObject.forEach(function(client) {
			clientsName.push(client.username);
		});
		io.sockets.in(data["room"]).emit("list_client",{client:clientsName});
	});
    socket.on('send_chat_to_current_room', function(data) {
        var escaped_message = sanitize(data["message"]).escape();
		
        if (socket.username && socket.room) {
            io.sockets.in(socket.room).emit('new_chat', {message:escaped_message, from:socket.username});
        }
    });
	socket.on('join_room', function(data) {
		socket.username = data["username"];
		socket.room = data["room"];
		socket.join(data["room"]);
	});
});