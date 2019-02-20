<%
	sessionCookie = Request.Cookies("openSession")
	if not sessionCookie = "" then
		Session("sesion") = sessionCookie
	elseif Session("sesion") = "" then
		response.redirect("../login.asp")
	end if

%>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Listar reservas</title>
	<meta charset="utf-8">
</head>
<body>
	<h1><center>Listado de reservas</center></h1>
        <%
        if Session("sesion") = "admin" then
            response.write("<a href='crearReserva.asp'>Introducir reservas</a> ")
            response.write("<a href='listarReservas.asp'>Listar reservas</a> ")
            response.write("<a href='buscarReserva.asp'>Buscar reservas</a>")
            response.write("<a href='../index.asp'>Volver al inicio</a>")
        else
            response.write(" ")
            response.write("<a href='../index.asp'>Volver al inicio</a>")
        end if

        %>
        <br><br>
        <%
          Set Conn = Server.CreateObject("ADODB.Connection")
        Conn.Open("amigos")
        sSQL="SELECT cl.codigo, cl.nombre, ve.matricula, re.cliente, re.vehiculo, re.inicio, re.fin FROM cliente cl, vehiculo ve, reservas re WHERE re.cliente=cl.codigo and re.vehiculo=ve.matricula"
        borrar = request.form("Borrar")
        set RS = Conn.Execute(sSQL)
            response.write("<table border=1>")
                response.write("<tr>")
                    response.write("<td>Cliente</td>")
                    response.write("<td>Matricula</td>")
                    response.write("<td>Fecha Inicio</td>")
                    response.write("<td>Fecha Fin</td>")
                response.write("</tr>")
        Do While Not rs.Eof
                response.write("<tr>")
                    cliente = RS("nombre")
                    response.write("<td>"&cliente&"</td>")
                    vehiculo = RS("matricula")
                    response.write("<td>"&vehiculo&"</td>")
                    fechaI = RS("inicio")
                    response.write("<td>"&fechaI&"</td>")
                    fechaF = RS("fin")
                    response.write("<td>"&fechaF&"</td>")
                if Session("sesion") = "admin" then
                    response.write("<td><a href='borrarReserva.asp?cliente="&rs("cliente")&"&vehiculo="&vehiculo&"&inicio="&fechaI&"'>Borrar</a></td>")
                end if
                response.write("</tr>")
            rs.MoveNext
        Loop
            response.write("</table>")
        Conn.Close
    %>
</body>
</html>