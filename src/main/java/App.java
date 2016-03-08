import java.util.Map;
import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;
import java.util.List;

public class App {

  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    get("/", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      model.put("currentUser", currentUser);
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/log-in", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      List<User> allUsers = User.all();
      model.put("loginFail", request.session().attribute("loginFail"));
      model.put("allUsers", allUsers);
      model.put("template", "templates/log-in.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/new-user", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      String newName = request.queryParams("new-name");
      String newPassword = request.queryParams("new-password");
      User newUser = new User(newName, newPassword);
      newUser.save();
      request.session().attribute("currentUser", newUser);
      response.redirect("/");
      return null;
    });

    post("/sign-in", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      int userId = Integer.parseInt(request.queryParams("name"));
      User user = User.find(userId);
      String password = request.queryParams("password");
      if (user.getPassword().equals(password)) {
        request.session().attribute("loginFail", false);
        request.session().attribute("currentUser", user);
        response.redirect("/");
        return null;
      }
      request.session().attribute("loginFail", true);
      response.redirect("/log-in");
      return null;
    });

    get("/gallery", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      model.put("currentUser", currentUser);
      //all plants
      model.put("template", "templates/gallery.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/planter", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      model.put("currentUser", currentUser);
      //user plants
      model.put("template", "templates/planter.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/about", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      model.put("currentUser", currentUser);
      model.put("template", "templates/about.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/tips", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      model.put("currentUser", currentUser);
      model.put("template", "templates/tips.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/logout", (request, response) -> {
      request.session().attribute("currentUser", null);
      response.redirect("/");
      return null;
    });

  }
}
