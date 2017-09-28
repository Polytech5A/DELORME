<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>Page d'ajout d'un adhérent</title>
<script language=javascript>
	function verif() {
		//alert("test saisie");
		if (document.getElementById("Login").value == "") {
			alert("Veuillez saisir un nom d'uilisateur !");
			return false;
		} else
			return true;
	}
</script>

</head>
<body>
	<P>
		<A href="accueil.jsp"><FONT face="Arial" color="#004080">Retour
				Accueil</FONT></A>
	</P>

	<h1>Ajout d'un adhérent</h1>

	<form method="post" action="${pageContext.request.contextPath}/Ajoutadherent" onsubmit="return verif();">

		<br />
		<br /> 
		<label for="Login"> Nom de l'adhérent :</label>
		<input type='text' name='Login' id="Login"> <br />
		<br /> 
		<label for="Password"> Prenom de l'adhérent :</label>
		<input type='text' name='Password' id="Password"> <br />
		<br /> 
		<BR></BR> 
		<input type='submit' value="Valider"> 
		<input type='button' value="Annuler" onclick="javascript:window.location='accueil.jsp'"> <br />
	</form>

</body>
</html>