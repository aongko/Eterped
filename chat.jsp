<html>
    <head>
        <script src="http://localhost:1337/socket.io/socket.io.js"></script>
        <script type="text/javascript">
            function refreshUsersListView() {
                users.sort();
                usersListView.innerHTML = "";
                for (var i = 0; i < users.length; i++) {
                    usersListView.innerHTML += users[i] + "<br>";
                }
            }

            function addToChat(from, msg) {
                chatArea.innerHTML += from + ": " + msg + "</br>";
            }

            function init() {
                systemUsername = "System";
                users = [];

                socketio = io.connect("http://localhost:1337");
            
                chatArea = document.getElementById("chatArea");
                chatTypeArea = document.getElementById("chatTypeArea");
                roomTitle = document.getElementById("roomTitle");
                usersListView = document.getElementById("usersList");

                // replace prompt to get username and txt link!
                // assign username and room in javascript? not safe in real world applications
                var username = prompt("insert your name");
                var room = prompt("insert room");
                
                socketio.emit('init', {username : username, room : room});
                roomTitle.innerHTML = room;

                chatTypeArea.focus();

                socketio.on('new_chat', function(data) {
                    addToChat(data["from"], data["message"]);
                });

                socketio.on('user_disconnected', function(data) {
                    for (var i = 0; i < users.length; i++)
                        if (users[i] == data["username"])
                            users.splice(i, 1);
                    refreshUsersListView()
                    addToChat(systemUsername, data["username"] + " left the room.");
                });

                socketio.on('user_connected', function(data) {
                    users.push(data["username"]);
                    refreshUsersListView()
                    addToChat(systemUsername, data["username"] + " joined the room.");
                });

                socketio.on('users_in_room', function(data) {
                    users = data["users"];
                    refreshUsersListView();
                });
            }

            function sendChat() {

                socketio.emit('send_chat_to_current_room', {message : chatTypeArea.value});
                chatTypeArea.value = "";
            }
        </script>
    </head>
    <body onLoad="init()">
        <h1 id="roomTitle">&nbsp;</h1>
        <div id="chatArea" style="height:500px; width:1000px; background-color:#00A0B1; float:left;"></div>
        <div id="usersList" style="height:500px; width:200px; background-color:grey; float:right;"></div>
        <input id="chatTypeArea" type="text" onKeyDown="if (event.keyCode == 13) sendChat();">
        <button id="chat" onClick="sendChat()">submit</button>
    </body>
</html>