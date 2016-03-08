import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;
import java.util.List;

public class UserTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void user_instantiates_correctly_true() {
    User testUser = new User("Michelle", "p@$$w0rd");
    assertTrue(testUser instanceof User);
  }

  @Test
  public void getName_returnsName_string() {
    User testUser = new User("Michelle", "p@$$w0rd");
    assertEquals("Michelle", testUser.getName());
  }

  @Test
  public void getPassword_returnsPassword_string() {
    User testUser = new User("Michelle", "p@$$w0rd");
    assertEquals("p@$$w0rd", testUser.getPassword());
  }

  @Test
  public void all_emptyAtFirst() {
    assertEquals(User.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfUsersAreTheSame() {
    User testUser1 = new User("Michelle", "p@$$w0rd");
    User testUser2 = new User("Michelle", "p@$$w0rd");
    assertTrue(testUser1.equals(testUser2));
  }

  @Test
  public void saves_savesUserToDatabase() {
    User testUser = new User("Michelle", "p@$$w0rd");
    testUser.save();
    assertTrue(User.all().contains(testUser));
  }

  @Test
  public void find_returnsUserFromDatabase() {
    User testUser = new User("Michelle", "p@$$w0rd");
    testUser.save();
    assertEquals(testUser, User.find(testUser.getId()));
  }

  @Test
  public void delete_deletesUserFromDatabase() {
    User testUser = new User("Michelle", "p@$$w0rd");
    testUser.save();
    testUser.delete();
    assertFalse(User.all().contains(testUser));
  }

  @Test
  public void addPlant_attachesPlantToUser() {
    User testUser = new User("Michelle", "p@$$w0rd");
    testUser.save();
    Plant testPlant = new Plant("Arugula", "May", "http://arugula.com", "vitamin K");
    testPlant.save();
    testUser.addPlant(testPlant.getId());
    assertTrue(testUser.getPlants().contains(testPlant));
  }

}
