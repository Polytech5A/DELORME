<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String erreur = (String) request.getAttribute("erreur");
    if (erreur == null)
        erreur = "";
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Authentification</title>
    <script language=javascript>
        function verif() {
            if (document.getElementById("txtlogin").value == "") {
                alert("Veuillez saisir un identifiant !");
                return false;
            }
            else if (document.getElementById("txtPwd").value == "") {
                alert("Veuillez saisir un mot de passe !");
                return false;
            }

            else
                return true;
        }
    </script>

</head>
<body>
<h1 align='center'>Page d'identification</h1>
<form method="post" action="Controleur?accueil" name="formLogin" id="formLogin" onsubmit="return verif();">
    <table>
        <tr>
            <td>Login :</td>
            <td><input type="text" name="txtLogin" id="txtLogin"></td>
        </tr>
        <tr>
            <td>Mot de passe :</td>
            <td><input type="password" name="txtPwd" id="txtPwd"></td>
        </tr>
    </table>
    <br/>
    <input type='submit' value="Envoi" id="login">
    <p>
        <%=erreur%>
    </p>
</form>
</body>
</html>