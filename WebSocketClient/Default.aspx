<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSocketClient.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>WebSocketClient</title>
</head>
<body>
    <button type="button" onclick="connectionServer()">连接服务器</button><br/><br/>
    <button type="button" onclick="sendData()">发送数据</button><br/><br/>
    <button type="button" onclick="viewStatus()">查看状态</button><br/><br/>
    <script src="./Scripts/jquery-1.10.2.min.js"></script>
    <script>
        var ws;
        function connectionServer() {
            try {
                ws = new WebSocket("ws://127.0.0.1:9002/chat");
                ws.onopen = function(event){
                    alert("已经与服务器建立了连接，当前连接状态：" + this.readyState)
                };
                ws.onmessage = function(event){
                    alert("接收到服务器发送的数据：" + event.data)
                };
                ws.onclose = function(event){
                    alert("已经与服务器断开连接，当前连接状态："+ this.readyState)
                };
                ws.onerror = function(event){
                    alert("WebSocket异常")
                };
            } catch (ex) {
                alert(ex.message)
            }
        }
		
		//发送数据
        function sendData() {
            try{
                ws.send("哈哈哈，服务器我要跟你说话呢")
            } catch (ex){
                alert(ex.message)
            }
        }
		
		//查看状态
        function viewStatus() {
            alert("当前WebSocket状态：" + ws.readyState);
        }
    </script>
</body>
</html>
