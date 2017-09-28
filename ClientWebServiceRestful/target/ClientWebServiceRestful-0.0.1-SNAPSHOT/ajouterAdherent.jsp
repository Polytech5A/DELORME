<%@ include file="include/header.jsp" %>
<body>
<div id="site">
    <%@ include file="include/menu.jsp" %>
    <div id="conteneur">
        <%@ include file="include/bandeaudroite.jsp" %>

        <div id="contenu">
            <H1>Ajout d'un adherent</H1>

            <DIV align="center">
                <FORM name='identification' method="post"
                      action="Controleur?action=insererAdherent"
                      onsubmit="return teste()">
                    <P align="left">
                        <FONT face="Arial" color="#004080"></FONT> <FONT face="Arial"
                                                                         color="#004080"> <BR>&nbsp; &nbsp; &nbsp; Nom
                        de
                        l'adherent :
                    </FONT> <INPUT type="text" name="txtnom" value="" id="nom"> <BR>
                        <FONT face="Arial" color="#004080"> <BR>Prenom de
                            l'adherent :
                        </FONT> <INPUT type="text" name="txtprenom" id="prenom"> <BR>

                        <FONT face="Arial" color="#004080"> <BR>&nbsp; &nbsp;
                            &nbsp; Ville de l'adherent :
                        </FONT> <INPUT type="text" name="txtville" id="ville"> <FONT
                            face="Arial" color="#004080"> <BR></FONT><BR>

                        <!-- Boutons Ajouter -->
                        <BR>
                        <INPUT type="submit" name="bt" value="Ajouter"> <FONT
                            face="Arial" color="#004080"></FONT> &nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <BR> <BR> <BR>
                    </P>
                </FORM>
                <P><BR> <BR> <BR></P>
            </div>
            <%@ include file="include/footer.jsp" %>
        </div>
    </div>
</body>
</html>
