<%
    Session.Abandon
    response.Cookies("sesionAbierta") = ""
    Session("sesion") = ""
    response.redirect("index.asp")
%>