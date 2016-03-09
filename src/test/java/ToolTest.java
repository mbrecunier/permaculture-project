import org.junit.*;
import static org.junit.Assert.*;
import org.sql2o.*;
import java.util.List;

public class ToolTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void tool_instantiatesCorrectly_true() {
    Tool testTool = new Tool("hammer", "http://hammer.com");
    assertTrue(testTool instanceof Tool);
  }
  @Test
  public void getName_returnsName_string() {
    Tool testTool = new Tool("hammer", "http://hammer.com");
    assertEquals("hammer", testTool.getName());
  }

  @Test
  public void getImgUrl_returnsUrl_string() {
    Tool testTool = new Tool("hammer", "http://hammer.com");
    assertEquals("http://hammer.com", testTool.getImgUrl());
  }

  @Test
  public void all_emptyAtFirst() {
    assertEquals(Tool.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfToolsAreTheSame() {
    Tool testTool = new Tool("hammer", "http://hammer.com");
    Tool testTool2 = new Tool("hammer", "http://hammer.com");
    assertTrue(testTool.equals(testTool2));
  }

  @Test
  public void saves_savesToolToDatabase() {
    Tool testTool = new Tool("hammer", "http://hammer.com");
    testTool.save();
    assertTrue(Tool.all().contains(testTool));
  }

  @Test
  public void find_returnsToolFromDatabase() {
    Tool testTool = new Tool("hammer", "http://hammer.com");
    testTool.save();
    assertEquals(testTool, Tool.find(testTool.getId()));
  }

  @Test
  public void delete_deletesToolFromDatabase() {
    Tool testTool = new Tool("hammer", "http://hammer.com");
    testTool.save();
    testTool.delete();
    assertFalse(Tool.all().contains(testTool));
  }
}
