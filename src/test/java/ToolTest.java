import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;
import java.util.List;

public class ToolTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void tool_instantiatesCorrectly_true() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    assertTrue(testTool instanceof Tool);
  }
  @Test
  public void getName_returnsName_string() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    assertEquals("hammer", testTool.getName());
  }

  @Test
  public void getImgUrl_returnsUrl_string() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    assertEquals("http://hammer.com", testTool.getImgUrl());
  }

  @Test
  public void getQuantity_returnsQuantity_int() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    assertEquals(10, testTool.getQuantity());
  }

  @Test
  public void subtractQuantity_returnsQuantity_int() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    testTool.subtractQuantity();
    assertEquals(9, testTool.getQuantity());
  }

  @Test
  public void addQuantity_returnsQuantity_int() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    testTool.addQuantity();
    assertEquals(11, testTool.getQuantity());
  }

  @Test
  public void all_emptyAtFirst() {
    assertEquals(Tool.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfToolsAreTheSame() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    Tool testTool2 = new Tool("hammer", "http://hammer.com", 10);
    assertTrue(testTool.equals(testTool2));
  }

  @Test
  public void saves_savesToolToDatabase() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    testTool.save();
    assertTrue(Tool.all().contains(testTool));
  }

  @Test
  public void find_returnsToolFromDatabase() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    testTool.save();
    assertEquals(testTool, Tool.find(testTool.getId()));
  }

  @Test
  public void delete_deletesToolFromDatabase() {
    Tool testTool = new Tool("hammer", "http://hammer.com", 10);
    testTool.save();
    testTool.delete();
    assertFalse(Tool.all().contains(testTool));
  }
}
