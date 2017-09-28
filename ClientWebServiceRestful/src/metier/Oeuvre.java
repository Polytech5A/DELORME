package metier;

public class Oeuvre {

    private int identifiant;

    private String titre;

    private String etat;

    private Float prix;

    private int idproprietaire;

    public Oeuvre() {

    }

    public Oeuvre(int identifiant, String titre, String etat, Float prix, int idproprietaire) {
        this.identifiant = identifiant;
        this.titre = titre;
        this.etat = etat;
        this.prix = prix;
        this.idproprietaire = idproprietaire;
    }

    public void setIdentifiant(int identifiant) {
        this.identifiant = identifiant;
    }

    public int getIdentifiant() {
        return this.identifiant;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getTitre() {
        return this.titre;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public String getEtat() {
        return this.etat;
    }

    public void setPrix(Float prix) {
        this.prix = prix;
    }

    public Float getPrix() {
        return this.prix;
    }

    public void setidproprietaire(int idproprietaire) {
        this.idproprietaire = idproprietaire;

    }

    public int getidproprietaire() {
        return this.idproprietaire;
    }
}
