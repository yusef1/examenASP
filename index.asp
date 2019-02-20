<%
	sessionCookie = Request.Cookies("sesionAbierta")
	if not sessionCookie = "" then
		Session("sesion") = sessionCookie
	elseif Session("sesion")="" then
		response.redirect("logine.asp")
	end if
%>

<!DOCTYPE html>
<html>
<head>
	<title>INDEX</title>
	<meta charset="utf-8">
</head>
<body>
	<CENTER><h1>INDEX</h1></CENTER>
	<NAV>
		<a href="Clientes/clientes.asp">esto es un enlace</a>
		<a href="Usuarios/citas.asp">Citas</a>
		<%
			response.write("<a style='color: red' href=cerrarSesion.asp>Cerrar sesión de "&Session("sesion")&"</a>")
		%>
	</NAV>
</body>
</html>