import org.sql2o.*;
import java.util.List;

public class Plant {
  private int id;
  private String plant_name;
  private String planting_season;
  private String img_url;
  private String health_benefits;
  private String companions;
  private String antagonists;

  public Plant (String plant_name, String planting_season, String img_url, String health_benefits, String companions, String antagonists) {
    this.plant_name = plant_name;
    this.planting_season = planting_season;
    this.img_url = img_url;
    this.health_benefits = health_benefits;
    this.companions = companions;
    this.antagonists = antagonists;
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

  public String getCompanions() {
    return companions;
  }

  public String getAntagonists() {
    return antagonists;
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
      String sql = "INSERT INTO plants (plant_name, planting_season, img_url, health_benefits, companions, antagonists) VALUES (:plant_name, :planting_season, :img_url, :health_benefits, :companions, :antagonists)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("plant_name", this.plant_name)
        .addParameter("planting_season", this.planting_season)
        .addParameter("img_url", this.img_url)
        .addParameter("health_benefits", this.health_benefits)
        .addParameter("companions", this.companions)
        .addParameter("antagonists", this.antagonists)
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
 // // in Tags.java
 //  public List<Recipe> getRecipes() {
 //  try (Connection con = DB.sql2o.open()) {
 //    String sql = "SELECT recipes.* FROM tags JOIN recipes_tags ON tags.id = recipes_tags.tag_id JOIN recipes ON recipes_tags.recipe_id = recipes.id WHERE tags.id = :id";
 //    return con.createQuery(sql)
 //      .addParameter("id", this.id)
 //      .executeAndFetch(Recipe.class);

  public List<Nutrient> getNutrients() {
    try (Connection con = DB.sql2o.open()) {
      String sql = "SELECT nutrientneeds.* FROM plants JOIN plants_nutrientneeds ON plants.id = plants_nutrientneeds.plant_id JOIN nutrientneeds ON plants_nutrientneeds.nutrientproperty_id = nutrientneeds.id WHERE plants.id = :id";
      return con.createQuery(sql)
        .addParameter("id", this.id)
        .executeAndFetch(Nutrient.class);
    }
  }

}
