var http = require('http'),
    fs = require('fs'),
    sanitize = require('validator').sanitize;

var app = http.createServer(function (request, response) {
}).listen(1337);

var io = require('socket.io').listen(app);

io.sockets.on('connection', function(socket) {
    socket.on('message_to_server', function(data) {
        var escaped_message = sanitize(data["message"]).escape();
        socket.broadcast.to(data["room"]).emit('message_to_client', {message:escaped_message, pos:data["pos"],d:data});
    });
    
    socket.on('join_room', function(data) {
        socket.join(data["room"]);
    });

    socket.on('init', function(data) {
        console.log("someone init : ")
        console.log(data);
        socket.join(data["room"]);
        socket.username = data["username"];
        socket.room = data["room"];

        console.log("send user_connected");
        console.log({username : socket.username});
        socket.broadcast.to(socket.room).emit('user_connected', {username : socket.username});
        socket.emit('users_in_room', {users : getUsersInRoom()});
    });

    socket.on('send_chat_to_current_room', function(data) {
        console.log("Event : send_chat_to_current_room");
        console.log(socket.username);
        console.log(socket.room);
        console.log(data);
        var escaped_message = sanitize(data["message"]).escape();
        if (socket.username && socket.room) {

            io.sockets.in(socket.room).emit('new_chat', {message:escaped_message, from:socket.username});
        }
    });

    socket.on('disconnect', function() {
        console.log(socket);
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