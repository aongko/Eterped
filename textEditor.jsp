<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@page import = "java.io.*" %>
<!DOCTYPE html>
<html>
	<%@ include file = "template-page/tempHeader.jsp" %>
<body>
	<script src="http://10.21.0.46:1337/socket.io/socket.io.js"></script>
	<script type="text/javascript">
		var fileName,fileValue = "";
		function getXMLHttpRequest() {
		  var xmlHttpReq = false;
		  // to create XMLHttpRequest object in non-Microsoft browsers
		  if (window.XMLHttpRequest) {
			xmlHttpReq = new XMLHttpRequest();
		  } else if (window.ActiveXObject) {
			try {
			  // to create XMLHttpRequest object in later versions
			  // of Internet Explorer
			  xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (exp1) {
			  try {
				// to create XMLHttpRequest object in older versions
				// of Internet Explorer
				xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			  } catch (exp2) {
				xmlHttpReq = false;
			  }
			}
		  }
		  return xmlHttpReq;
		}
		/*
		 * AJAX call starts with this function
		 */
		function makeRequest() {
			var xmlHttpRequest = getXMLHttpRequest();
			xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
			xmlHttpRequest.open("GET", "LoadFile?fileName="+fileName, true);
			xmlHttpRequest.setRequestHeader("Content-Type",
			  "application/x-www-form-urlencoded");
			xmlHttpRequest.send(null);
		}
		 
		/*
		 * Returns a function that waits for the state change in XMLHttpRequest
		 */
		function getReadyStateHandler(xmlHttpRequest) {
		 
		  // an anonymous function returned
		  // it listens to the XMLHttpRequest instance
		  return function() {
			if (xmlHttpRequest.readyState == 4) {
			  if (xmlHttpRequest.status == 200) {
				fileValue = xmlHttpRequest.responseText;
				$("#textValue").val(fileValue);
			  } else {
				alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);
			  }
			}
		  };
		}
		
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
		
		function init(){
			console.log(fileValue);
			$.fn.selectRange = function(start, end) {
				// var position = $("#textValue").getCursorPosition();
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
			setCookie("currentValue", $("#textValue").val());
			// setCookie("position", 0);
			// console.log('getCursorPosition - position: 0');
			$("#textValue").keyup(editFile);
			fileName = location.hash.substr(1);
			makeRequest();
		}
		
		$(document).ready(function(){
			init();
		});
		// some code
		var socketio = io.connect("10.21.0.46:1337");

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
			$("#textValue").val(newValue);
			setCookie("currentValue", newValue);

			// console.log('oldPos: '+pos);
			
			// console.log('editPosStart: '+editPosStart);
			// console.log('changeCharLength: '+changeCharLength);
			// console.log('editPosEnd: '+editPosEnd);

			if (editPosStart <= pos) {
				pos += changeCharLength;
			}
			// pos += olValue.length - $("#textValue").val().length;
			setCookie("position", pos);
			// console.log("newPos: "+pos);
			$("#textValue").selectRange(pos);
		});
		
		function editFile(e) {
			console.log('asd');
			var position = $("#textValue").getCursorPosition();
			setCookie("position", position);
			// console.log('editfile - position: '+position);
			var oldValue = getCookie("currentValue");
			var newValue = $("#textValue").val();
			if (oldValue == newValue) return;

			setCookie("currentValue", newValue);
			socketio.emit("message_to_server", {message: newValue, pos: position});
		}
	</script>
	<%@ include file = "template-page/tempNavLogin.jsp" %>
  <form method="POST" action="tulis.jsp" style="width:80%">
	<textarea id="textValue" name="textValue" style="width:100%;height:400px;float:left"><% //out.print(textValue);%></textarea>
	<input type="hidden" name="textId" value="<%//out.print(textId);%>">
	<input type="submit">
  </form>
	<!--textarea id="textValue" style="width:100%;height:400px"></textarea>
	<button id="savebtn">save</button>
	<div id="chat_log"></div-->
</body>
</html>