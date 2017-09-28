package service;

import com.google.gson.Gson;
import meserreurs.MonException;
import metier.Adherent;
import metier.Oeuvrepret;
import metier.Proprietaire;
import persistance.DialogueBd;

import javax.ws.rs.*;
import java.util.ArrayList;
import java.util.List;

@Path("/mediatheque")
public class WService {

    @POST
    @Path("/Adherents/ajout/{unAdh}")
    @Consumes("application/json")
    public void insertionAdherent(String unAdherent) throws MonException {
        DialogueBd unDialogueBd = DialogueBd.getInstance();
        Gson gson = new Gson();
        Adherent unAdh = gson.fromJson(unAdherent, Adherent.class);
        try {
            String mysql = "";
            mysql = "INSERT INTO adherent (nom_adherent, prenom_adherent, ville_adherent) ";
            mysql += " VALUES ( \'" + unAdh.getNomAdherent() + "\', \'" + unAdh.getPrenomAdherent();
            mysql += "  \', \'" + unAdh.getVilleAdherent() + "\') ";

            unDialogueBd.insertionBD(mysql);

        } catch (MonException e) {
            throw e;
        }
    }

    @GET
    @Path("/Adherents")
    @Produces("application/json")
    public String rechercheLesAdherents() throws MonException {
        List<Object> rs;
        List<Adherent> mesAdherents = new ArrayList<Adherent>();
        int index = 0;
        try {
            DialogueBd unDialogueBd = DialogueBd.getInstance();
            String mysql = "";

            mysql = "SELECT * FROM adherent ORDER BY id_adherent ASC";

            rs = unDialogueBd.lecture(mysql);

            while (index < rs.size()) {
                Adherent unAdh = new Adherent();
                unAdh.setIdAdherent(Integer.parseInt(rs.get(index + 0).toString()));
                unAdh.setNomAdherent(rs.get(index + 1).toString());
                unAdh.setPrenomAdherent(rs.get(index + 2).toString());
                unAdh.setVilleAdherent(rs.get(index + 3).toString());
                index = index + 4;

                mesAdherents.add(unAdh);
            }

            Gson gson = new Gson();
            String json = gson.toJson(mesAdherents);
            return json;

        } catch (MonException e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    @GET
    @Path("/Oeuvres")
    @Produces("application/json")
    public String rechercherOeuvres() throws MonException {
        List<Object> rs;
        List<Oeuvrepret> mesOeuvres = new ArrayList<Oeuvrepret>();
        int index = 0;

        try {
            DialogueBd unDialogueBd = DialogueBd.getInstance();

            String mysql = "SELECT * FROM oeuvrepret ORDER BY id_oeuvrepret ASC";
            rs = unDialogueBd.lecture(mysql);

            while (index < rs.size()) {
                Oeuvrepret uneOeuvre = new Oeuvrepret();
                uneOeuvre.setIdOeuvrepret(Integer.parseInt(rs.get(index + 0).toString()));
                uneOeuvre.setTitreOeuvrepret(rs.get(index + 1).toString());
                uneOeuvre.setProprietaire(null);

                index = index + 3;
                mesOeuvres.add(uneOeuvre);
            }

            return new Gson().toJson(mesOeuvres);
        } catch (MonException e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    @GET
    @Path("/Oeuvres/{uneOeuvre}")
    @Consumes("application/json")
    public String rechercherOeuvre(@PathParam("uneOeuvre") String uneOeuvre) throws MonException {
        List<Object> rs;
        List<Object> rsBis;

        try {
            DialogueBd unDialogueBd = DialogueBd.getInstance();

            String mysql = "SELECT * FROM oeuvrepret WHERE id_oeuvrepret = " + uneOeuvre;
            rs = unDialogueBd.lecture(mysql);

            String mysqlBis = "SELECT * FROM proprietaire WHERE id_proprietaire = " + rs.get(2).toString();
            rsBis = unDialogueBd.lecture(mysqlBis);

            Proprietaire proprietaire = new Proprietaire();
            proprietaire.setIdProprietaire(Integer.parseInt(rsBis.get(0).toString()));
            proprietaire.setNomProprietaire(rsBis.get(1).toString());
            proprietaire.setPrenomProprietaire(rsBis.get(2).toString());

            Oeuvrepret oeuvre = new Oeuvrepret();
            oeuvre.setIdOeuvrepret(Integer.parseInt(rs.get(0).toString()));
            oeuvre.setTitreOeuvrepret(rs.get(1).toString());
            oeuvre.setProprietaire(proprietaire);

            return new Gson().toJson(oeuvre);
        } catch (MonException e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }
}
