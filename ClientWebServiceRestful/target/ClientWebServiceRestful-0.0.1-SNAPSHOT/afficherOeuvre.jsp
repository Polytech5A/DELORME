<%@ include file="include/header.jsp" %>
<body>
<div id="site">
    <%@ include file="include/menu.jsp" %>
    <div id="conteneur">
        <%@ include file="include/bandeaudroite.jsp" %>

        <div id="contenu">
            <P align="center">
                <FONT face="Arial" size="5" color="#004080"> <STRONG>Recherche &nbsp;
                    d'une oeuvre </STRONG></FONT>
            </P>

            <h1>Affichage d'une oeuvre </h1>

            <form method="post" action="Controleur?action=modifierOeuvre">
                <div>
                    <ul>
                        <li><b>ID :</b><input type="text" name="txtId" value="${uneOeuvre.idOeuvrepret}" readonly/></li>
                        <li><b>Titre :</b> <input type="text" name="txtTitre" value="${uneOeuvre.titreOeuvrepret}"/></li>
                        <li><b>Nom Prorietaire :</b> ${uneOeuvre.proprietaire.nomProprietaire}</li>
                    </ul>
                    <input type="submit" value="Modifier"/>
                </div>
            </form>
        </div>
        <%@ include file="include/footer.jsp" %>
    </div>
</div>

</body>
</html>
