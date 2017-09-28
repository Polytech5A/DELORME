<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
	<title>Erreur</title>
	
</head>
<body>
	
        <h2>Erreur</h2>
        <p>Une erreur est survenue.</p>
       	<h3>Détails</h3>
        <p>
        	${erreur}
        </p>
       
   
</body>
</html>