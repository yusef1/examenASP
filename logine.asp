<html>
<head>
	<title>login</title>
	<meta charset="utf-8">
</head>
<body>
	
	<!-- Formulario de acceso -->
	<form action="logine.asp" method="POST">
		<center><h1>LOGIN</h1></center>
		Nombre: <input type="text" name="user" placeholder="introduce tu nombre">
		<br><br>
		Contraseña:<input type="password" name="pass" placeholder="introduce tu contraseña">
		<br><br>
		Recordar contraseña<input type="checkbox" name="sesionAbierta" value="si">
		<br><br>
		<input type="submit" name="Enviar">
	</form>
	<!-- Validacion de formularion en ASP -->
	<%
		user = request.form("user")
		pass = request.form("pass")
		sesionAbierta = request.form("sesionAbierta")

		' Comprobamos si el usuario es admin
		if user = "admin" and pass = "admin" then
			Session("sesion") = user
			if 	sesionAbierta="si" then
				response.Cookies("sesionAbierta")=user
			end if
			response.redirect("index.asp")
		end if

		' Comprobamos si el usuario es otro
		Set Conn = Server.CreateObject("ADODB.Connection") 'Esto siempre se pone así cada vez qu inicialices una conexion con la bd
		Conn.Open("amigos")
		sSQL="select * from usuarios where nombre='"&user&"' and pass='"&pass&"'"
		set RS = Conn.Execute(sSQL)'Todo esto anterior va junto siempre
		if Not rs.eof then 'esto es si no está vacío'
			Session("sesion") = user
			if 	sesionAbierta="si" then
				response.Cookies("sesionAbierta")=user
			end if
			response.redirect("index.asp")
		end if

		Conn.Close
	%>
</body>
</html>