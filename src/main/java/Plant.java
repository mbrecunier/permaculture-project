import org.sql2o.*;
import java.util.List;

public class Plant {
  private int id;
  private String plant_name;
  private String planting_season;
  private String img_url;
  private String health_benefits;

  public Plant (String plant_name, String planting_season, String img_url, String health_benefits) {
    this.plant_name = plant_name;
    this.planting_season = planting_season;
    this.img_url = img_url;
    this.health_benefits = health_benefits;
  }
  public int getId() {
    return id;
  }

  public String getName() {
    return plant_name;
  }

  public String getPlantingSeason() {
    return planting_season;
  }

  public String getImgUrl() {
    return img_url;
  }

  public String getHealthBenefits() {
    return health_benefits;
  }

  public static List<Plant> all() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM plants";
      return con.createQuery(sql).executeAndFetch(Plant.class);
    }
  }

  @Override
  public boolean equals(Object otherPlant) {
    if(!(otherPlant instanceof Plant)) {
      return false;
    } else {
      Plant newPlant = (Plant) otherPlant;
      return this.getName().equals(newPlant.getName());
    }
  }

  public void save() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO plants (plant_name, planting_season, img_url, health_benefits) VALUES (:plant_name, :planting_season, :img_url, :health_benefits)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("plant_name", this.plant_name)
        .addParameter("planting_season", this.planting_season)
        .addParameter("img_url", this.img_url)
        .addParameter("health_benefits", this.health_benefits)
        .executeUpdate()
        .getKey();
    }
  }

  public static Plant find(int id) {
    try (Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM plants WHERE id = :id";
      Plant testPlant = con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Plant.class);
      return testPlant;
    }
  }

  public void delete() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "DELETE FROM plants WHERE id = :id";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

}
