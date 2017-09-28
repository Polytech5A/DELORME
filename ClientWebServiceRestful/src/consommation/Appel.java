package consommation;

import com.google.gson.Gson;

import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

public class Appel {

    public String appelTextPlain(String action) {
        String uneChaine;

        WebTarget target = Consommateur.get().target;
        target = target.path(action);
        System.out.println(" uri :" + target.getUri());
        uneChaine = target.request().accept(MediaType.TEXT_PLAIN).get(String.class);
        return uneChaine;
    }

    public String appelXml() {
        String uneChaine;

        WebTarget target = Consommateur.get().target;
        target = target.path("get");
        //System.out.println(" uri :"  + target.getUri());
        uneChaine = target.request().accept(MediaType.APPLICATION_XML).get(String.class);
        return uneChaine;
    }

    public String appelJson(String action) {
        String uneChaine;

        WebTarget target = Consommateur.get().target;
        target = target.path(action);
        System.out.println("uri :" + target.getUri());
        uneChaine = target.request().accept(MediaType.APPLICATION_JSON).get(String.class);
        return uneChaine;
    }

    public String putJson(String action, Object unObj) {
        Response uneChaine;

        WebTarget target = Consommateur.get().target;
        target = target.path(action);
        System.out.println(" uri :" + target.getUri());
        Gson gson = new Gson();
        String json = gson.toJson(unObj);
        Response response = target.request(MediaType.APPLICATION_JSON).put(Entity.entity(json, MediaType.APPLICATION_JSON), Response.class);

        if (response.getStatus() >= 200 && response.getStatus() <= 299) {
            return "Mise a jour effectue";
        } else {
            return "Echec mise a jour";
        }
    }

    public String postJson(String action, Object unObj) {
        Response uneChaine;

        WebTarget target = Consommateur.get().target;
        target = target.path(action);
        System.out.println(" uri :" + target.getUri());
        Gson gson = new Gson();
        String json = gson.toJson(unObj);
        Response response = target.request(MediaType.APPLICATION_JSON).post(Entity.entity(json, MediaType.APPLICATION_JSON), Response.class);

        if (response.getStatus() >= 200 && response.getStatus() <= 299) {
            return "Mise a jour effectue";
        } else {
            return "Echec mise a jour";
        }
    }

    public String deleteJson(String action) {
        Response uneChaine;

        WebTarget target = Consommateur.get().target;
        target = target.path(action);
        System.out.println(" uri :" + target.getUri());
        Response response = target.request(MediaType.APPLICATION_JSON).delete();

        if (response.getStatus() >= 200 && response.getStatus() <= 299) {
            return "Mise a jour effectue";
        } else {
            return "Echec mise a jour";
        }
    }
}