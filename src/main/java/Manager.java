import java.sql.*;

public class Manager {
    private final static String SELECT_DATA = "SELECT `u`.`user_name`,sum( `li`.`item_price`) " +
            "FROM `invoice` `i` " +
            "INNER JOIN `users` `u` ON `i`.`user` = `u`.`user_id`" +
            " and `i`.`payed`=0 " +
            "INNER JOIN `LineItem` `li` ON `li`.`item_id`=`i`.`item` GROUP BY `u`.`user_name`";

    private Connection connection;

    public Manager() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:8889/Invoices", "root",
                    "root");
        } catch (SQLException e) {
            System.out.println("Connection Error");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void getData() {
        try (Statement statement = connection.createStatement()) {
            try (ResultSet resultSet = statement.executeQuery(SELECT_DATA)) {
                while (resultSet.next()) {
                    System.out.println("Name:   " + resultSet.getString(1) + "\nBill:    "
                            + resultSet.getDouble(2) + "\n==================");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }
}