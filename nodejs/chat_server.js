var http = require('http'),
    fs = require('fs'),
    sanitize = require('validator').sanitize;

var app = http.createServer(function (request, response) {
}).listen(1337);

var io = require('socket.io').listen(app);

io.sockets.on('connection', function(socket) {
    socket.on('init', function(data) {
        socket.join(data["room"]);
        socket.username = sanitize(data["username"]).escape();
        socket.room = sanitize(data["room"]).escape();

        socket.broadcast.to(socket.room).emit('user_connected', {username : socket.username});
        socket.emit('users_in_room', {users : getUsersInRoom()});
    });

    socket.on('send_chat_to_current_room', function(data) {
        var escaped_message = sanitize(data["message"]).escape();
        if (socket.username && socket.room) {

            io.sockets.in(socket.room).emit('new_chat', {message:escaped_message, from:socket.username});
        }
    });

    socket.on('disconnect', function() {
        socket.broadcast.to(socket.room).emit('user_disconnected', {username : socket.username});
    });

    socket.on('request_users_in_room', function() {
        socket.emit('users_in_room', {users : getUsersInRoom()});
    });

    function getUsersInRoom() {
        var socketsInRoom = io.sockets.clients(socket.room);
        var users = [];
        for (var i = 0; i < socketsInRoom.length; i++) {
            users.push(socketsInRoom[i].username);
        }
        return users;
    }
});