package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.data.MenuList;
import yeamgood.model.AlertMessage;
import yeamgood.model.Menu;
import yeamgood.service.MenuService;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/main/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("menu") Menu menu, HttpServletRequest request) {
        List<Menu> menuList = menuService.findAll();
        ModelAndView model = new ModelAndView("menu.main");
        model.addObject("menuList", menuList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("menu") Menu menu, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        if (id != null) {
            menu = menuService.findOne(Integer.parseInt(id));
            if(action != null){
                menu.setId(0);
            }
        }
        ModelAndView model = new ModelAndView("menu.manage");
        model.addObject("menu", menu);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody Menu menu) {
        menuService.save(menu);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody Menu menu) {
        menuService.delete(menu);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }


}

