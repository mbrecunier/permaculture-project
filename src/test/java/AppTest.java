import org.junit.*;
import static org.junit.Assert.*;
import org.fluentlenium.adapter.FluentTest;
import org.junit.ClassRule;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import static org.assertj.core.api.Assertions.assertThat;
import static org.fluentlenium.core.filter.FilterConstructor.*;
import java.util.List;



public class AppTest extends FluentTest {
  public WebDriver webDriver = new HtmlUnitDriver();
  public WebDriver getDefaultDriver() {
    return webDriver;
  }

  @ClassRule
  public static ServerRule server = new ServerRule();

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void rootTest() {
    goTo("http://localhost:4567/");
    assertThat(pageSource()).contains("Portland Permaculture Project");
  }

  @Test
  public void login_loadsFromHomepage() {
    goTo("http://localhost:4567/");
    click("a", withText("Login"));
    assertThat(pageSource()).contains("Returning User");
  }

  @Test
  public void newUser_isCreatedProperly() {
    goTo("http://localhost:4567/log-in");
    fill("#new-name").with("michelle202");
    fill("#new-password").with("123");
    submit("#create-new-user");
    assertThat(pageSource()).contains("Welcome, michelle202");
  }

  @Test
  public void returningUsers_loginSuccessfully() {
    User testUser = new User("Michelle", "321");
    testUser.save();
    goTo("http://localhost:4567/log-in");
    click("option", withText("Michelle"));
    fill("#password").with("321");
    submit("#sign-in");
    assertThat(pageSource()).contains("Welcome, Michelle");
  }

  @Test
  public void returningUsers_wrongPasswordRedirects() {
    User testUser = new User("Michelle", "321");
    testUser.save();
    goTo("http://localhost:4567/log-in");
    click("option", withText("Michelle"));
    fill("#password").with("111");
    submit("#sign-in");
    assertThat(pageSource()).contains("User Name and Password do not match");
  }

  @Test
  public void plantGallery_loadsPlantInformation() {
    User testUser = new User("Michelle", "321");
    testUser.save();
    goTo("http://localhost:4567/log-in");
    fill("#password").with("321");
    submit("#sign-in");
    click("a", withText("Gallery"));
    assertThat(pageSource()).contains("tomatoes");
  }
  //
  // @Test
  // public void personalPlanter_holdsFavoritedPlants() {
  //   User testUser = new User("Michelle", "321");
  //   testUser.save();
  //   goTo("http://localhost:4567/log-in");
  //   fill("#password").with("321");
  //   submit("#sign-in");
  //   click("a", withText("Gallery"));
  //   ((favorite a plant))
  //   goTo("http://localhost:4567/planter");
  //   assertThat(pageSource()).contains("");
  // }

  @Test
  public void aboutTest() {
    goTo("http://localhost:4567/about");
    assertThat(pageSource()).contains("About Permaculture");
  }

  @Test
  public void tipsTest() {
    goTo("http://localhost:4567/tips");
    assertThat(pageSource()).contains("Garden Tips");
  }

}
