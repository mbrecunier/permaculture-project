import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;
import java.util.List;

public class PlantTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void plant_instantiatesCorrectly_true() {
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    assertTrue(testPlant instanceof Plant);
  }
  @Test
  public void getName_returnsName_string() {
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    assertEquals("Arugula", testPlant.getName());
  }

  @Test
  public void getPlantingSeason_returnsSeason_string() {
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    assertEquals("May", testPlant.getPlantingSeason());
  }

  @Test
  public void getImgUrl_returnsUrl_string() {
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    assertEquals("http://arugula.com", testPlant.getImgUrl());
  }

  @Test
  public void getHealthBenefits_returnsBenefits_string() {
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    assertEquals("vitamin K", testPlant.getHealthBenefits());
  }

  @Test
  public void all_emptyAtFirst() {
    assertEquals(Plant.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfPlantsAreTheSame() {
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    Plant testPlant2 = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    assertTrue(testPlant.equals(testPlant2));
  }

  @Test
  public void saves_savesUserToDatabase() {
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    testPlant.save();
    assertTrue(Plant.all().contains(testPlant));
  }

  @Test
  public void find_returnsPlantFromDatabase() {
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    testPlant.save();
    assertEquals(testPlant, Plant.find(testPlant.getId()));
  }

  @Test
  public void delete_deletesPlantFromDatabase() {
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    testPlant.save();
    testPlant.delete();
    assertFalse(Plant.all().contains(testPlant));
  }
}
