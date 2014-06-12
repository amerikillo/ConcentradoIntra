<%-- 
    Document   : verSolicitudIntra
    Created on : 04-jun-2014, 9:26:52
    Author     : Amerikillo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Clases.ConectionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ConectionDB con = new ConectionDB();
    HttpSession sesion = request.getSession();
    String user = "";
    try {
        user = (String) sesion.getAttribute("usuario");
    } catch (Exception e) {

    }
    if (user == null) {
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
            <%
                try {
                    con.conectar();
                    ResultSet rset = con.consulta("select folio from recibe_intra where surtido = '0' group by folio, surtido");
                    while (rset.next()) {
            %>
            <form action="SurteFolioIntra?folio=<%=rset.getString(1)%>" method="Post">
                <div class="panel panel-success">

                    <div class="panel-heading">
                        <div class="col-lg-2">
                            <h4>Folio:<%=rset.getString(1)%></h4>
                        </div>
                        <div class="text-right">
                            <button type="submit" name="accion" value="cancelar" onclick="return confirm('¿Seguro que desea ELIMINARLO?')" class="btn btn-danger">Cancelar</button>
                            <button type="submit" name="accion" value="surtir" onclick="return confirm('¿Seguro que desea SURTIRLO?')" class="btn btn-default">Surtir</button>
                        </div>
                    </div>
                    <div>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <td>Médico</td>
                                <td>Num. Afi.</td>
                                <td>Paciente</td>
                                <td>Cama</td>
                                <td>Piso</td>
                                <td>Causes</td>
                                <td>Sustancia</td>
                                <td>Cant</td>
                            </tr>

                            <%
                                ResultSet rset2 = con.consulta("select medico, fol_sp, nom_pac, cama, piso, causes, sustancia, cant from recibe_intra where folio = '" + rset.getString(1) + "' ");
                                while (rset2.next()) {
                                    String clave = "";
                                    ResultSet rset3 = con.consulta("select clave from claves_licitadas where clave_larga = '" + rset2.getString(6) + "' ");
                                    while (rset3.next()) {
                                        clave = rset3.getString(1);
                                    }
                            %>
                            <tr>
                                <td><%=rset2.getString(1)%></td>
                                <td><%=rset2.getString(2)%></td>
                                <td><%=rset2.getString(3)%></td>
                                <td><%=rset2.getString(4)%></td>
                                <td><%=rset2.getString(5)%></td>
                                <td><%=clave%></td>
                                <td><%=rset2.getString(7)%></td>
                                <td><%=rset2.getString(8)%></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </form>
            <%
                    }
                    con.cierraConexion();
                } catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
        </div>

    </body>
</html>
