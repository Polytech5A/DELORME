package consommation;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;

public class Consommateur {

    protected static final String SERVICE_URI = "http://localhost:8080/mediatheque";

    protected static Consommateur singleton = null;

    protected Client client;

    public WebTarget target;

    protected Consommateur() {
        client = ClientBuilder.newClient();
        target = client.target(SERVICE_URI);
    }

    public static Consommateur get() {
        if (singleton == null)
            singleton = new Consommateur();

        return singleton;
    }

    public WebTarget target() {
        return client.target(SERVICE_URI);
    }
}