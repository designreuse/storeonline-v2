package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.model.AlertMessage;
import yeamgood.model.User;
import yeamgood.service.MenuService;
import yeamgood.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/main/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/main",method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("user") User user,HttpServletRequest request) {
        List<User> userList = userService.findAll();
        ModelAndView model = new ModelAndView("user.main");
        model.addObject("userList", userList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage",method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("user") User user,HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        if (id != null) {
            user = userService.findOne(Integer.parseInt(id));
            if(action != null){
                user.setId(0);
            }
        }
        ModelAndView model = new ModelAndView("user.manage");
        model.addObject("user", user);
        return model;
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST ,headers = {"content-type=application/json"})
    public  @ResponseBody AlertMessage save(@RequestBody User user){
        userService.save(user);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST ,headers = {"content-type=application/json"})
    public  @ResponseBody AlertMessage delete(@RequestBody User user) {
        userService.delete(user);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }
}

