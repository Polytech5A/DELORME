<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion des Oeuvres</title>

<script language=javascript>
	function verif() {
		 if (document.getElementById("Titre").value == "") {
			alert("Veuillez saisir un titre d'oeuvre !");
			return false;
		} else if (document.getElementById("Prix").value == "") {
			alert("Veuillez saisir un prix d'oeuvre !");
			return false;
		} else if (document.getElementById("IdProp").value == "") {
			alert("Veuillez saisir un identifiant du propriétaire !");
			return false;
		} else
			return true;
	}

	function remplichamp() {
		if (document.getElementById("Choixoeuvre").value == 0) {
			document.getElementById("IdOeuvre").value = '';
			document.getElementById("Titre").value = '';
			document.getElementById("Prix").value = '';
			document.getElementById("Etat").value = 'L';
			document.getElementById("IdProp").value = '';
	    	document.getElementById("IdProp").readOnly = false; 
		} else {
			document.getElementById("IdOeuvre").value = document.getElementById("Choixoeuvre").value;
			var Lib = document.getElementById("Choixoeuvre").options[document
					.getElementById("Choixoeuvre").selectedIndex].text;
			var Pos = Lib.indexOf("_");
			var Titre = Lib.substring(0, Pos);
			var Lib2 = Lib.substring(Pos + 1, Lib.length);
			Pos = Lib2.indexOf("_");
			var Prix = Lib2.substring(0, Pos);
			var Lib3 = Lib2.substring(Pos + 1, Lib2.length);
			Pos = Lib3.indexOf("_");
			var Etat = Lib3.substring(0,Pos);
			var IdProp = Lib3.substring(Pos + 1, Lib3.length);
			
			document.getElementById("Titre").value = Titre.trim();
			document.getElementById("Prix").value = Prix.trim();
			document.getElementById("Etat").value = Etat.trim();
		    document.getElementById("IdProp").value = IdProp.trim();
		    document.getElementById("IdProp").readOnly = true;
		    
			
		}
	}
</script>


</head>
<body>

	<P>
		<A href="accueil.jsp"><FONT face="Arial" color="#004080">Retour Accueil</FONT></A>
	</P>

	<h1>Formulaire de traitement des oeuvres</h1>

	<form method="post" action="${pageContext.request.contextPath}/Gestionoeuvre" name="formOeuvre" id="formOeuvre" onsubmit="return verif();">

		
		<SELECT id="Choixoeuvre" name="Choixoeuvre" onChange="remplichamp();">
			<OPTION value=0>SELECTIONNER OEUVRE</OPTION>
			<c:forEach items="${listeOeuvre}" var="itemoeuvre">
				<OPTION value="${itemoeuvre.identifiant}"> ${itemoeuvre.titre} _ ${itemoeuvre.prix} _ ${itemoeuvre.etat} _ ${itemoeuvre.idproprietaire}</OPTION>
			</c:forEach>
		</SELECT> 
		<br /> <br />
		<table>
			<tr>
				<td><label for="IdOeuvre">Id Oeuvre :</label></td>
				<td><input type='text' name='IdOeuvre' id="IdOeuvre" readonly></td>
			</tr>
			<tr>
				<td><label for="Titre">Titre Oeuvre :</label></td>
				<td><input type='text' name='Titre' id="Titre"></td>
			</tr>
			<tr>
				<td><label for="Prix">Prix :</label></td>
				<td><input type='text' name='Prix' id="Prix"></td>
			</tr>
			<tr>
				<td><label for="Etat">Etat :</label></td>
				<td><input type='text' name='Etat' id="Etat" readonly> </td>
			</tr>

			<tr>
		 		<td><label for="IdProp">Id proprietaire :</label></td>
				<td><input type='text' name='IdProp' id="IdProp"></td>
		
			</tr>

		</table>
		<BR></BR>
	
		<input type='submit' name="action" value="Ajout" id="Ajout">
		<input type='submit' name="action" value="Modification" id="ModificationOeuvre">
		<input type='submit' name="action" value="Suppression" id="Suppression">
		<input type='button' name="Annuler" value="Annuler" onclick="javascript:window.location='accueil.jsp'">
		<br />
		
	</form>

</body>
</html>