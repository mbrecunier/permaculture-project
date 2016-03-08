import org.junit.rules.ExternalResource;
import org.sql2o.*;

public class DatabaseRule extends ExternalResource {

  protected void before() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/permaculture_test", null, null);
  }

  protected void after() {
    try(Connection con = DB.sql2o.open()) {
      String deleteUsersQuery = "DELETE FROM users *;";
      String deletePlantsQuery = "DELETE FROM plants *;";
      con.createQuery(deleteUsersQuery).executeUpdate();
      con.createQuery(deletePlantsQuery).executeUpdate();
    }
  }
}
