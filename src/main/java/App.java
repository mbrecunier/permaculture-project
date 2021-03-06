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
      List<Plant> plants = Plant.all();
      model.put("plants", plants);
      model.put("template", "templates/gallery.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/tool-gallery", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      model.put("currentUser", currentUser);
      List<Tool> tools = Tool.all();
      model.put("tools", tools);
      model.put("template", "templates/tool-gallery.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/planter", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      model.put("currentUser", currentUser);
      model.put("template", "templates/planter.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/tips", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      model.put("currentUser", currentUser);
      model.put("template", "templates/tips.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/logout", (request, response) -> {
      request.session().attribute("currentUser", null);
      response.redirect("/");
      return null;
    });

    post("/favorite", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      int plantId = Integer.parseInt(request.queryParams("plantId"));
      if(currentUser != null) {
        if(!currentUser.getPlants().contains(Plant.find(plantId))) {
          currentUser.addPlant(plantId);
        }
      }
      response.redirect("/gallery");
      return null;
    });

    post("/favorite-tool", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      int toolId = Integer.parseInt(request.queryParams("toolId"));
      Tool newTool = Tool.find(toolId);
        if(currentUser != null) {
            currentUser.addTool(toolId);
            newTool.subtractQuantity();
        }
      response.redirect("/tool-gallery");
      return null;
    });

    post("/remove-plant", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      int plantId = Integer.parseInt(request.queryParams("delete-plantId"));
      currentUser.removePlant(plantId);
      response.redirect("/planter");
      return null;
    });

    post("/remove-tool", (request, response) -> {
      HashMap<String, Object> model = new HashMap<String, Object>();
      User currentUser = request.session().attribute("currentUser");
      int toolId = Integer.parseInt(request.queryParams("delete-toolId"));
      Tool newTool = Tool.find(toolId);
      newTool.addQuantity();
      currentUser.removeTool(toolId);
      response.redirect("/planter");
      return null;
    });

  }
}
