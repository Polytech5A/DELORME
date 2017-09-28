<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion des propriétaires</title>

<script language=javascript>
	function verif() {
		/*
		if(document.getElementById("Choixprop").value == 0)   
		{ alert("Veuillez sélectionner un propriétaire !"); 
		  return false; 
		}*/
		if (document.getElementById("Nom").value == "") {
			alert("Veuillez saisir un nom de propriétaire !");
			return false;
		} else if (document.getElementById("Prenom").value == "") {
			alert("Veuillez saisir un prénom de propriétaire !");
			return false;
		}

		else
			return true;
	}

	function remplichamp() {
		if (document.getElementById("Choixprop").value == 0) {
			document.getElementById("IDProp").value = '';
			document.getElementById("Nom").value = '';
			document.getElementById("Prenom").value = '';

		} else {
			document.getElementById("IDProp").value = document
					.getElementById("Choixprop").value;

			var NomPrenom = document.getElementById("Choixprop").options[document
					.getElementById("Choixprop").selectedIndex].text;
			var Pos = NomPrenom.indexOf("_");
			var Nom = NomPrenom.substring(0, Pos);
			var Prenom = NomPrenom.substring(Pos + 1, NomPrenom.length)

			document.getElementById("Nom").value = Nom.trim();
			document.getElementById("Prenom").value = Prenom.trim();
		}
	}
</script>


</head>
<body>
	<P>
		<A href="accueil.jsp"><FONT face="Arial" color="#004080">Retour
				Accueil</FONT></A>
	</P>

	<h1>Formulaire de traitement des propriétaires</h1>

	<form method="post" action="${pageContext.request.contextPath}/Gestionproprietaire" name="formProp" id="formProp" onsubmit="return verif();">

		<SELECT id="Choixprop" name="Choixprop" onChange="remplichamp();">
			<OPTION value=0>SELECTIONNER PROPRIETAIRE</OPTION>
			<c:forEach items="${listeProp}" var="itemprop">
				<OPTION value="${itemprop.identifiant}">${itemprop.nom} _ ${itemprop.prenom}</OPTION>
			</c:forEach>
		</SELECT>
		<br />
		<br />
		<table>
			<tr>
				<td><label for="IDProp">Id propriétaire :</label></td>
				<td><input type='text' name='IDProp' id="IDProp" readonly></td>
			</tr>
			<tr>
				<td><label for="Nom">Nom propriétaire :</label></td>
				<td><input type='text' name='Nom' id="Nom"></td>
			</tr>
			<tr>
				<td><label for="Prenom">Prénom propriétaire :</label></td>
				<td><input type='text' name='Prenom' id="Prenom"></td>
			</tr>
		</table>
		<BR></BR>
		<input type='submit' name="action" value="Ajout" id="Ajout">
		<input type='submit' name="action" value="Modification" id="Modification"> 
		<input type='submit' name="action" value="Suppression" id="Suppression">
		<input type='button' name="Annuler" value="Annuler" onclick="javascript:window.location='accueil.jsp'"> <br />
	</form>

</body>
</html>