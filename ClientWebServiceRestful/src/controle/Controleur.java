package controle;

import com.google.gson.Gson;
import consommation.Appel;
import metier.Adherent;
import metier.Oeuvre;
import metier.Oeuvrepret;
import metier.Oeuvrevente;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class Controleur
 */
@WebServlet("/Controleur")
public class Controleur extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String ACTION_TYPE = "action";

    private static final String LISTER_ADHERENT = "listerAdherent";

    private static final String AJOUTER_ADHERENT = "ajouterAdherent";

    private static final String INSERER_ADHERENT = "insererAdherent";

    private static final String SUPPRIMER_ADHERENT = "supprimerAdherent";

    private static final String RECHERCHER_LISTE_OEUVRE = "chercherListeOeuvre";

    private static final String RECHERCHER_OEUVRE = "rechercherOeuvre";

    private static final String MODIFIER_OEUVRE = "modifierOeuvre";

    private static final String ERROR_KEY = "messageErreur";

    private static final String ERROR_PAGE = "/erreur.jsp";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controleur() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processusTraiteRequete(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processusTraiteRequete(request, response);
    }

    protected void processusTraiteRequete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionName = request.getParameter(ACTION_TYPE);
        String destinationPage = ERROR_PAGE;
        String ressource;
        String reponse;

        if (LISTER_ADHERENT.equals(actionName)) {
            ressource = "/Adherents";

            try {
                reponse = new Appel().appelJson(ressource);
                List<Adherent> json = new Gson().fromJson(reponse, List.class);
                request.setAttribute("mesAdherents", json);
            } catch (Exception e) {
                destinationPage = "/index.jsp";
                request.setAttribute("MesErreurs", e.getMessage());
            }

            destinationPage = "/listerAdherent.jsp";
        } else if (AJOUTER_ADHERENT.equals(actionName)) {
            destinationPage = "/ajouterAdherent.jsp";
        } else if (INSERER_ADHERENT.equals(actionName)) {
            try {
                Adherent unAdherent = new Adherent();
                unAdherent.setNomAdherent(request.getParameter("txtnom"));
                unAdherent.setPrenomAdherent(request.getParameter("txtprenom"));
                unAdherent.setVilleAdherent(request.getParameter("txtville"));
                ressource = "/Adherents/ajout/" + unAdherent;
                reponse = new Appel().postJson(ressource, unAdherent);
            } catch (Exception e) {
                request.setAttribute("MesErreurs", e.getMessage());
                destinationPage = "/erreur.jsp";
            }

            destinationPage = "/index.jsp";
        } else if (SUPPRIMER_ADHERENT.equals(actionName)) {
            try {
                String idAdh = request.getParameter("id");
                ressource = "/Adherents/delete/" + idAdh;
                reponse = new Appel().deleteJson(ressource);
            } catch (Exception e) {
                request.setAttribute("MesErreurs", e.getMessage());
                destinationPage = "/erreur.jsp";
            }

            destinationPage = "/index.jsp";
        } else if (RECHERCHER_LISTE_OEUVRE.equals(actionName)) {
            ressource = "/Oeuvres";

            try {
                reponse = new Appel().appelJson(ressource);
                List<Oeuvrevente> json = new Gson().fromJson(reponse, List.class);
                request.setAttribute("mesOeuvres", json);
            } catch (Exception e) {
                destinationPage = "/index.jsp";
                request.setAttribute("MesErreurs", e.getMessage());
            }

            destinationPage = "/rechercherOeuvre.jsp";
        } else if (RECHERCHER_OEUVRE.equals(actionName)) {
            if (request.getParameter("id") != null) {
                try {
                    int idoeuvre = new Gson().fromJson(request.getParameter("id"), Integer.class);

                    ressource = "/Oeuvres/" + idoeuvre;
                    reponse = new Appel().appelJson(ressource);
                    Oeuvrepret json = new Gson().fromJson(reponse, Oeuvrepret.class);
                    request.setAttribute("uneOeuvre", json);
                } catch (Exception e) {
                    destinationPage = "/erreur.jsp";
                    request.setAttribute("MesErreurs", e.getMessage());
                }

                destinationPage = "/afficherOeuvre.jsp";
            }
        } else if (MODIFIER_OEUVRE.equals(actionName)) {
            try {
                Oeuvre uneOeuvre = new Oeuvre();
                uneOeuvre.setIdentifiant(Integer.parseInt(request.getParameter("txtId")));
                uneOeuvre.setTitre(request.getParameter("txtTitre"));
                uneOeuvre.setEtat(request.getParameter("txtEtat"));
                uneOeuvre.setPrix(Float.parseFloat(request.getParameter("txtPrix")));

                ressource = "/Oeuvres/" + uneOeuvre;
                reponse = new Appel().putJson(ressource, uneOeuvre);
            } catch (Exception e) {
                request.setAttribute("MesErreurs", e.getMessage());
                destinationPage = "/erreur.jsp";
            }

            destinationPage = "/index.jsp";
        } else {
            String messageErreur = "[" + actionName + "] n'est pas une action valide.";
            request.setAttribute(ERROR_KEY, messageErreur);
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(destinationPage);
        dispatcher.forward(request, response);
    }
}