<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"">
<title>Réservation d'une oeuvre</title>
<script language=javascript>
	function verif() {
		if (document.getElementById("Choixoeuvre").value == 0) {
			alert("Veuillez saisir une oeuvre !");
			return false;
		} else if (document.getElementById("IDAdh").value == "") {
			alert("Veuillez saisir un adhérent !");
			return false;
		} else if (document.getElementById("DateReserv").value == "") {
			alert("Veuillez saisir une date !");
			return false;
		}

		else
			return true;
	}
</script>

</head>
<body>
	<P>
		<A href="accueil.jsp"><FONT face="Arial" color="#004080">Retour
				Accueil</FONT></A>
	</P>

	<h1>Formulaire de réservation d'une oeuvre</h1>

	<form method="post" action="${pageContext.request.contextPath}/Gestionreservation" onsubmit="return verif();">
		<table>
			<tr>
				<td>Oeuvre :</td>
				<td><SELECT id="Choixoeuvre" name="Choixoeuvre">
						<OPTION value=0>SELECTIONNER OEUVRE</OPTION>
						<c:forEach items="${listeOev}" var="itemoeuvre">
							<OPTION value="${itemoeuvre.identifiant}">
								${itemoeuvre.titre}</OPTION>
						</c:forEach>
				</SELECT></td>
			</tr>
			<tr>
				<td><label for="IDAdh">Id adhérent :</label></td>
				<td><input type='text' name='IDAdh' id="IDAdh"
					value="<%if (request.getAttribute("AdhIdentifiant") != null) {
				out.println(request.getAttribute("AdhIdentifiant"));
			}%>"
					readonly></td>
			</tr>
			<tr>
				<td><label for="Login">Nom adhérent :</label></td>
				<td><input type='text' name='Login' id="Login"
					value="<%if (request.getAttribute("AdhLogin") != null) {
				out.println(request.getAttribute("AdhLogin"));
			}%>"
					readonly></td>
			</tr>
			<tr>
				<td><label for="Prenom">Prénom adhérent :</label></td>
				<td><input type='text' name='Prenom' id="Prenom"
					value="<%if (request.getAttribute("AdhPrenom") != null) {
				out.println(request.getAttribute("AdhPrenom"));
			}%>"
					readonly></td>
			</tr>
			<tr>
				<td><label for="DateReserv">Date réservation
						(aaaa-mm-jj) :</label></td>
				<td><input type='text' name='DateReserv' id="DateReserv">
			<tr>
				<td><BR></BR>
		</table>
		<input type='submit' value="Valider"> 
		<input type='button' value="Annuler" onclick="javascript:window.location='accueil.jsp'">
		<br />
	</form>

</body>
</html>