import org.sql2o.*;
import java.util.List;

public class Tool {
  private int id;
  private String tool_name;
  private String img_url;

  public Tool (String tool_name, String img_url) {
    this.tool_name = tool_name;
    this.img_url = img_url;
  }
  public int getId() {
    return id;
  }

  public String getName() {
    return tool_name;
  }

  public String getImgUrl() {
    return img_url;
  }

  public static List<Tool> all() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM tools";
      return con.createQuery(sql).executeAndFetch(Tool.class);
    }
  }

  @Override
  public boolean equals(Object otherTool) {
    if(!(otherTool instanceof Tool)) {
      return false;
    } else {
      Tool newTool = (Tool) otherTool;
      return this.getName().equals(newTool.getName());
    }
  }

  public void save() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO tools (tool_name, img_url) VALUES (:tool_name, :img_url)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("tool_name", this.tool_name)
        .addParameter("img_url", this.img_url)
        .executeUpdate()
        .getKey();
    }
  }

  public static Tool find(int id) {
    try (Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM tools WHERE id = :id";
      Tool testTool = con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Tool.class);
      return testTool;
    }
  }

  public void delete() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "DELETE FROM tools WHERE id = :id";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

}
