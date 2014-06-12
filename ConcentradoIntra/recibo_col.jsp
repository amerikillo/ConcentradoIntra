
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
    String folio = (String) sesion.getAttribute("folio");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Untitled Document</title>
        <style type="text/css">
            <!--
            .style5 {font-family: Arial, Helvetica, sans-serif; font-size: 12; }
            .style6 {font-size: 12}
            .style7 {	font-size: 12px;
                      font-weight: bold;
            }
            .style8 {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 10px;
            }
            -->
        </style>
    </head>

    <body>
        <table width="384" height="404"  border="3" align="left" cellpadding="2">
            <tr>
                <td width="372" height="92">
                    <table width="370" border="0" cellpadding="2">
                        <tr>
                            <td width="362" class="style7">
                                <div align="center">
                                    <strong>
                                        <span class="style5">TIENDAS SORIANA  S.A DE C.V. </span>
                                    </strong>
                                    <a href="verSolicitudIntra.jsp">*</a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                <div align="center">
                                    <strong>
                                        <span class="style5">AV. HEROICO COLEGIO MILITAR Y AV. 20 DE NOVIEMBRE #109 COL. NUEVA VIZCAYA</span>
                                    </strong>
                                    <strong>
                                        <span class="style5"></span>
                                    </strong>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                <div align="center">DURANGO, DGO C.P. 34080  </div>
                            </td>
                        </tr>

                        <tr>
                            <td class="style7">
                                <div align="center">
                                    <%                                        try {
                                            con.conectar();
                                            ResultSet rset = con.consulta("select unidad from receta_colectiva where folio_re = '" + folio + "' limit 0,1");
                                            while (rset.next()) {
                                                out.println(rset.getString(1));
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {

                                        }
                                    %>
                                    <br/>
                                    PACIENTE EN CAMA
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="158">
                    <table width="370" border="0" cellpadding="2">
                        <tr>
                            <td width="364">
                                <div align="right" class="style6 style8">FECHA DE RECETA COLECTIVA:&nbsp;&nbsp;<%
                                    try {
                                        con.conectar();
                                        ResultSet rset = con.consulta("select fecha_re from receta_colectiva where folio_re = '" + folio + "' limit 0,1");
                                        while (rset.next()) {
                                            out.println(rset.getString(1));
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {

                                    }
                                    %> &nbsp;  <%
                                        try {
                                            con.conectar();
                                            ResultSet rset = con.consulta("select hora from receta_colectiva where folio_re = '" + folio + "' limit 0,1");
                                            while (rset.next()) {
                                                out.println(rset.getString(1));
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {

                                        }
                                    %></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="364" border="0" cellpadding="2">
                                    <tr>
                                        <td width="196" class="style8">
                                            FOLIO:RC-
                                            <%
                                                try {
                                                    con.conectar();
                                                    ResultSet rset = con.consulta("select clave_uni from receta_colectiva where folio_re = '" + folio + "' limit 0,1");
                                                    while (rset.next()) {
                                                        out.println(rset.getString(1));
                                                    }
                                                    con.cierraConexion();
                                                } catch (Exception e) {

                                                }
                                            %>
                                            -<%=folio%>
                                        </td>
                                        <td width="77" class="style8"></td>
                                        <td width="71" class="style8">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="style8">
                                    CLIENTE:
                                    <%                                        try {
                                            con.conectar();
                                            ResultSet rset = con.consulta("select unidad from receta_colectiva where folio_re = '" + folio + "' limit 0,1");
                                            while (rset.next()) {
                                                out.println(rset.getString(1));
                                            }
                                            con.cierraConexion();
                                        } catch (Exception e) {

                                        }
                                    %>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                SUB-CLIENTE: 
                                SERVICIOS DE SALUD DE DURANGO
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">SERVICIO:  <%                                        try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select servicio from receta_colectiva where folio_re = '" + folio + "' limit 0,1");
                                    while (rset.next()) {
                                        out.println(rset.getString(1));
                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {

                                }
                                %></td>
                        </tr>
                        <tr>
                            <td class="style8">ENCARGADO DEL SERVICIO: <%                                        try {
                                    con.conectar();
                                    ResultSet rset = con.consulta("select encargado from receta_colectiva where folio_re = '" + folio + "' limit 0,1");
                                    while (rset.next()) {
                                        out.println(rset.getString(1));
                                    }
                                    con.cierraConexion();
                                } catch (Exception e) {

                                }
                                %></td>
                        </tr>

                        <tr>
                            <td class="style8">
                                <table width="352" border="0" cellpadding="2">

                                </table>
                            </td>
                        </tr>
                        <%
                            String fuente1 = "", fuente2 = "";
                            try {
                                ResultSet rset = con.consulta("select * from receta_colectiva where folio_re='" + folio + "' group by fuente");

                                while (rset.next()) {

                                    fuente1 = rset.getString("fuente");
                                    if (fuente1.equals("SEGURO POPULAR")) {
                                        fuente2 = "1";
                                        //out.print(fuente2);
                                    }
                                    if (fuente1.equals("OPORTUNIDADES")) {
                                        fuente2 = "2";
                                        //out.print(fuente2);
                                    }
                                    if (fuente1.equals("GASTOS CATASTROFICOS")) {
                                        fuente2 = "3";
                                        //out.print(fuente2);
                                    }
                                    if (fuente1.equals("ASE")) {
                                        fuente2 = "4";
                                        //out.print(fuente2);
                                    }
                                    if (fuente1.equals("SMNG")) {
                                        fuente2 = "5";
                                        //out.print(fuente2);
                                    }
                                    if (fuente1.equals("FASSA")) {
                                        fuente2 = "6";
                                        //out.print(fuente2);
                                    }


                        %>


                        <!--tr>
                          <td width="94" class="style8">PROGRAMA:</td>
                          <td width="244" class="style8"><%=rset.getString("fuente")%></td>
                        </tr>
                        <tr>
                          <td class="style8">SUB-PROGRAMA:</td>
                          <td class="style8"><%=rset.getString("fuente")%></td>
                        </tr-->
                        <%}
                            } catch (Exception e) {

                            }
                        %>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="25">
                    <table width="373" border="0" cellpadding="2">
                        <tr>
                            <td width="258" class="style8">DESCRIPCION</td>
                            <td width="52" class="style8"><div align="center">CANTIDAD</div></td>
                            <td width="42" class="style8"><div align="center">ORIGEN</div></td>
                        </tr>
                        <%
                            try {
                                con.conectar();
                                ResultSet rset = con.consulta("select * from receta_colectiva where folio_re='" + folio + "' and cant_sur != 0");
                                while (rset.next()) {
                                    String clave_larga = "";
                                    ResultSet rset2 = con.consulta("select clave_larga from claves_licitadas where clave='" + rset.getString("clave") + "' ");

                                    while (rset2.next()) {
                                        clave_larga = rset2.getString(1);
                                    }

                        %>
                        <tr>
                            <td height="21" class="style8"><%=clave_larga%> - <%=rset.getString("descrip")%> --- (<%=fuente2%>)</td>
                            <td class="style8" align="center"><%=rset.getString("cant_sur")%></td>
                            <td height="21" class="style8" align="center"><%=rset.getString("partida")%></td>
                        </tr>
                        <%
                                }
                                con.cierraConexion();
                            } catch (Exception e) {

                            }
                        %>
                    </table>
                </td>
            </tr>

            <tr>
                <td height="66">
                    <table width="369" border="0" cellpadding="2">
                        <tr>
                            <td width="361"></td>
                        </tr>
                        <tr>
                            <td class="style8">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style8"><div align="center">FIRMA DE RECIBIDO </div></td>
                        </tr>


                        <tr>
                            <td height="22" class="style8">ELABORÓ COLECTIVO: 
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">FECHA DE IMPRESION: 
                                &nbsp;-&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
    </body>
</html>
