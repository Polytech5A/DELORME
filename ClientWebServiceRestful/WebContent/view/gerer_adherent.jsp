<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion des adhérents</title>

<script language=javascript>
	function verif() {
		/*
		if(document.getElementById("Choixprop").value == 0)   
		{ alert("Veuillez sélectionner un propriétaire !"); 
		  return false; 
		}*/
		if (document.getElementById("Nom").value == "") {
			alert("Veuillez saisir un nom d'adhérent !");
			return false;
		} else if (document.getElementById("Prenom").value == "") {
			alert("Veuillez saisir un prénom d'adhérent !");
			return false;
		}

		else
			return true;
	}

	function remplichamp() {
		if (document.getElementById("Choixadh").value == 0) {
			document.getElementById("IDAdh").value = '';
			document.getElementById("Nom").value = '';
			document.getElementById("Prenom").value = '';

		} else {
			document.getElementById("IDAdh").value = document
					.getElementById("Choixadh").value;

			var NomPrenom = document.getElementById("Choixadh").options[document
					.getElementById("Choixadh").selectedIndex].text;
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
		<A href="accueil.jsp"><FONT face="Arial" color="#004080">Retour	Accueil</FONT></A>
	</P>

	<h1>Formulaire de traitement des adhérents</h1>

	<form method="post" action="${pageContext.request.contextPath}/Gestionadherent" name="formAdh" id="formAdh" onsubmit="return verif();"> 

		<SELECT id="Choixadh" name="Choixadh" onChange="remplichamp();">
			<OPTION value=0>SELECTIONNER ADHERENT</OPTION>
			<c:forEach items="${listeAdherent}" var="itemadh">
				<OPTION value="${itemadh.id_adherent}"> ${itemadh.nom_adherent} _
					${itemadh.prenom_adherent}</OPTION>
			</c:forEach>
		</SELECT> <br />
		<br />
		<table>
			<tr>
				<td><label for="IDAdh">Id adhérent :</label></td>
				<td><input type='text' name='IDAdh' id="IDAdh" readonly></td>
			</tr>
			<tr>
				<td><label for="Nom">Nom adhérent :</label></td>
				<td><input type='text' name='Nom' id="Nom"></td>
			</tr>
			<tr>
				<td><label for="Prenom">Prénom adhérent :</label></td>
				<td><input type='text' name='Prenom' id="Prenom"></td>
			</tr>
		</table>
		<BR></BR> <BR></BR>
	
		<input type='submit' name="action" value="Ajout" id="Ajout"> 
		<input type='submit' name="action" value="Modification" id="Modification">
		<input type='submit' name="action" value="Suppression" id="Suppression"> 
		<input type='button' name="Annuler" value="Annuler" onclick="javascript:window.location='accueil.jsp'">
		<br />
	</form>

</body>
</html>