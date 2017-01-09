<%-- 
    Document   : index
    Created on : 13/12/2016, 16:12:47
    Author     : Cogeti
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controle.ConectaBanco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel = "stylesheet" href = "login.css">
    </head>
    <body>
        <%
            ConectaBanco conn = new ConectaBanco();
            Connection conexao = conn.conectaPostgre("sistemavideoaula");
            if (conexao != null) {
                System.out.println("Conectado");
            } else {
                System.out.println("Nao conectado");
            }

        %>
        <form id="principal" action="index.jsp">
            <div><h1 id="titulo">Bem Vindo! Realize o login para continuar!</h1></div>
            <div id = "Campos">
                <center><h2>Login: <input type="text" name="txtLog" value="" id="txtLog"/></h2>
                    <h2>Senha: <input type="password" name="txtSenha" value="" id="txtSenha"/></h2>

                    <%
                        if (conexao != null) {
                            if((request.getParameter("txtLog")!=null)&&(request.getParameter("txtSenha")!=null)){
                                Statement st;
                                ResultSet rs;
                                st = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
                                rs = st.executeQuery("select * from login where login = '"+request.getParameter("txtLog")+"' and senha = '"+request.getParameter("txtSenha")+"'");
                                System.out.println("TO aqui");
                                if(rs.next()){
                                    response.sendRedirect("FormularioPrincipal.jsp");
                                }
                                System.out.println("deu ruim");

                            }
                        }else{
                            System.out.println("Não foi possivel logar");
                        }
                    %>
                    <input type="submit" value="Logar" name="btnLogin" /></center>
            </div>
    </body>
</html>
