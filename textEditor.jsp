<!DOCTYPE html>
<html>
<head>
	<title>Client</title>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script src="http://10.21.0.50:1337/socket.io/socket.io.js"></script>
	<script type="text/javascript">
		function setCookie(cookieName,value,liveTime){
			var expire = new Date();
			expire.setDate(expire.getDate() + liveTime);
			var cookieValue=escape(value) + ((liveTime==null) ? "" : "; expires="+expire.toUTCString());
			document.cookie=cookieName + "=" + cookieValue;
		}
		
		function getCookie(cookieName)
		{
			var cookieValue = document.cookie;
			var cookieStart = cookieValue.indexOf(" " + cookieName + "=");
			if (cookieStart == -1)
			{
			  cookieStart = cookieValue.indexOf(cookieName + "=");
			}
			if (cookieStart == -1)
			{
			  cookieValue = null;
			}
			else
			{
			  cookieStart = cookieValue.indexOf("=", cookieStart) + 1;
			  var cookieEnd = cookieValue.indexOf(";", cookieStart);
			  if (cookieEnd == -1)
				{
					cookieEnd = cookieValue.length;
				}
				cookieValue = unescape(cookieValue.substring(cookieStart,cookieEnd));
			}
			return cookieValue;
		}
		
		$(document).ready(function(){
			$.fn.selectRange = function(start, end) {
				// var position = $("#txt_message").getCursorPosition();
				// setCookie("position", position);
				// console.log('ready - position: '+position);
				if(!end) end = start; 
				return this.each(function() {
					if (this.setSelectionRange) {
						this.focus();
						this.setSelectionRange(start, end);
					} else if (this.createTextRange) {
						var range = this.createTextRange();
						range.collapse(true);
						range.moveEnd('character', end);
						range.moveStart('character', start);
						range.select();
					}
				});
			};
			$.fn.getCursorPosition = function() {
				var el = $(this).get(0);
				var pos = 0;
				if('selectionStart' in el) {
					pos = el.selectionStart;
				} else if('selection' in document) {
					el.focus();
					var Sel = document.selection.createRange();
					var SelLength = document.selection.createRange().text.length;
					Sel.moveStart('character', -el.value.length);
					pos = Sel.text.length - SelLength;
				}
				return pos;
			};
			setCookie("currentValue", $("#txt_message").val());
			// setCookie("position", 0);
			// console.log('getCursorPosition - position: 0');
			$("#txt_message").keyup(editFile);
		});
		// some code
		var socketio = io.connect("10.21.0.50:1337");

		socketio.on("message_to_client", function(data) {
			// var str = "<hr>"+data["message"];
			var str = data["message"];
			var pos = parseInt(getCookie("position"));
			var oldValue = getCookie("currentValue");
			var newValue = str;

			if (oldValue == newValue) return;

			var editPosEnd = parseInt(data["pos"]);
			var changeCharLength = newValue.length - oldValue.length;
			var editPosStart = editPosEnd - changeCharLength;

			// document.getElementById("chat_log").innerHTML = (str + document.getElementById("chat_log").innerHTML);
			$("#txt_message").val(newValue);
			setCookie("currentValue", newValue);

			// console.log('oldPos: '+pos);
			
			// console.log('editPosStart: '+editPosStart);
			// console.log('changeCharLength: '+changeCharLength);
			// console.log('editPosEnd: '+editPosEnd);

			if (editPosStart <= pos) {
				pos += changeCharLength;
			}
			// pos += olValue.length - $("#txt_message").val().length;
			setCookie("position", pos);
			// console.log("newPos: "+pos);
			$("#txt_message").selectRange(pos);
		});
		
		function editFile(e) {
			var position = $("#txt_message").getCursorPosition();
			setCookie("position", position);
			// console.log('editfile - position: '+position);
			var oldValue = getCookie("currentValue");
			var newValue = $("#txt_message").val();
			if (oldValue == newValue) return;

			setCookie("currentValue", newValue);
			socketio.emit("message_to_server", {message: newValue, pos: position});
		}
	</script>
</head>
<body>
	<textarea id="txt_message" style="width:100%;height:400px"></textarea>
	<button id="savebtn">save</button>
	<div id="chat_log"></div>
</body>
</html>