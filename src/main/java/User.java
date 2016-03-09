import org.sql2o.*;
import java.util.List;

public class User {
  private int id;
  private String name;
  private String password;

  public User (String name, String password) {
    this.name = name;
    this.password = password;
  }

  public String getName() {
    return name;
  }

  public String getPassword() {
    return password;
  }

  public static List<User> all() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM users";
      return con.createQuery(sql).executeAndFetch(User.class);
    }
  }

  @Override
  public boolean equals(Object otherUser) {
    if(!(otherUser instanceof User)) {
      return false;
    } else {
      User newUser = (User) otherUser;
      return this.getName().equals(newUser.getName());
    }
  }

  public void save() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO users (name, password) VALUES (:name, :password)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", this.name)
        .addParameter("password", this.password)
        .executeUpdate()
        .getKey();
    }
  }

  public int getId() {
    return id;
  }

  public static User find(int id) {
    try (Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM users WHERE id = :id;";
      User user = con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(User.class);
      return user;
    }
  }

  public void delete() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "DELETE FROM users WHERE id = :id;";
      con.createQuery(sql)
        .addParameter("id", this.id)
        .executeUpdate();
    }
  }

  public void addPlant(int plantId) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO users_plants (user_id, plant_id) VALUES (:user_id, :plant_id)";
      con.createQuery(sql)
        .addParameter("user_id", this.id)
        .addParameter("plant_id", plantId)
        .executeUpdate();
    }
  }

  public List<Plant> getPlants() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT plants.* FROM users JOIN users_plants ON users.id = users_plants.user_id JOIN plants ON users_plants.plant_id = plants.id WHERE user_id = :id";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetch(Plant.class);
    }
  }

  public void addTool(int toolId) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO users_tools (user_id, tool_id) VALUES (:user_id, :tool_id)";
      con.createQuery(sql)
        .addParameter("user_id", this.id)
        .addParameter("tool_id", toolId)
        .executeUpdate();
    }
  }

  public List<Tool> getTools() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT tools.* FROM users JOIN users_tools ON users.id = users_tools.user_id JOIN tools ON users_tools.tool_id = tools.id WHERE user_id = :id";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetch(Tool.class);
    }
  }

}
