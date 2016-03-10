import org.sql2o.*;
import java.util.List;

public class Nutrient {
  private int id;
  private String description;

  public Nutrient (String description) {
    this.description = description;
  }

  public int getId() {
    return id;
  }

  public String getDescription() {
    return description;
  }
}
