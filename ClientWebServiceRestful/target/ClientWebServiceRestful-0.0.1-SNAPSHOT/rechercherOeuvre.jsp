<%@ include file="include/header.jsp" %>
<body>
<div id="site">
    <%@ include file="include/menu.jsp" %>
    <div id="conteneur">
        <%@ include file="include/bandeaudroite.jsp" %>
        <div id="contenu">
            <P align="center">
                <FONT face="Arial" size="5" color="#004080"> <STRONG>Recherche &nbsp; d'une oeuvre </STRONG></FONT>
            </P>

            <h1>Recherche d'une oeuvre </h1>

            <h2>A l'aide d'une liste</h2>
            <form method="post" action="Controleur?action=rechercherOeuvre">
                <div>
                    <select name="id">
                        <c:forEach var="uneOeuvre" items="${mesOeuvres}">
                            <option value="${uneOeuvre.idOeuvrepret}"> ${uneOeuvre.titreOeuvrepret}
                            </option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Rechercher l'oeuvre "/>
                </div>
            </form>
        </div>
        <%@ include file="include/footer.jsp" %>
    </div>
</div>

</body>
</html>