<%-- 
    Document   : index
    Created on : 07-mar-2014, 15:38:43
    Author     : Americo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    String info = "";
    try {
        info = (String) session.getAttribute("mensaje");
    } catch (Exception e) {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="css/singnin.css" rel="stylesheet" media="screen">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <title>SIALSS</title>
    </head>
    <body>
        <div class="container">
            <form class="form-signin" action="Login" method="POST">
                <div class="row">
                    <div class="col-lg-6">
                        <img src="imagenes/logo_salud_gob.jpg" width="100%" />
                    </div>
                    <div class="col-lg-6 text-right" style="padding-top: 43px;">
                        <img src="imagenes/Logo GNK claro2.jpg.png" height="70px" />
                    </div>
                </div>
                <div class="panel panel-body">
                    <h3>Módulo Intrahospitalaria</h3>
                    <h4 class="form-signin-heading">Ingrese sus Credenciales</h4>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <label class="glyphicon glyphicon-user"></label>
                        </span>
                        <input type="text" name="user" id="user" class="form-control" placeholder="Introduzca Nombre de Usuario">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <label class="glyphicon glyphicon-lock"></label>
                        </span>
                        <input type="password" name="pass" id="pass" class="form-control"  placeholder="Introduzca Contrase&ntilde;a V&aacute;lida">
                    </div>
                    <%
                        if (info != null) {
                    %>
                    <div class="input-group">
                        <div>Datos inv&aacute;lidos, intente otra vez...</div>
                    </div>
                    <%
                        }
                    %>
                    <button class="btn btn-lg btn-success btn-block" type="submit" name="accion" value="1">Entrar</button>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <img src="imagenes/logo_soriana2.jpg" />
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
<%
    sesion.invalidate();
%>