import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.SQLException;

public class App {

    public static void main(String[] args) throws IOException, SQLException {
        Manager manager = new Manager();
        manager.getData();
    }

}
