<%-- 
    Document   : cargaExcel
    Created on : 04-jun-2014, 8:30:07
    Author     : Amerikillo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String user="";
    try{
        user =(String) sesion.getAttribute("usuario");
    }catch (Exception e){
        
    }
    if (user==null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css"> 
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h2>Folios por Surtir</h2>
                    <a href="cargaExcel.jsp" class="btn btn-default">Módulo para Cargar Solicitud</a>
                    <a href="verSolicitudIntra.jsp" class="btn btn-default">Ver Folios</a>
                    <a href="http://localhost:8080/r_du1_v1/index.jsp" class="btn btn-default">Sistema de Captura</a>
                </div>
                <div class="col-lg-6 text-right">
                    <img src="imagenes/logo_salud_gob.jpg" height="100px" />
                </div>
            </div>
            <br/>
            <form method="post" class="jumbotron"  action="FileUploadServlet" enctype="multipart/form-data" name="form1">
                <div class="row">
                    <div class="col-lg-4 text-success">
                        <h4>Seleccione el Excel a Cargar</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <input class="form-control" type="file" name="file1" accept=".xlsx"/>
                    </div>
                    <div class="col-lg-4">
                        <button class="btn btn-block btn-success" type="submit">Enviar</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
