package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.data.MenuList;
import yeamgood.service.MenuService;

import java.util.List;

@Controller
@RequestMapping(value = "/main/home")
public class IndexController {

    @Autowired
    private MenuService menuService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        List<MenuList> menuList = menuService.getMenuViewList();
        ModelAndView model = new ModelAndView("welcomePage");
        model.addObject("menuList", menuList);
        return model;
    }

}
