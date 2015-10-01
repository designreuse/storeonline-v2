package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.model.Menu;
import yeamgood.model.RoleUser;
import yeamgood.service.MenuService;
import yeamgood.service.RoleUserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/main/roleUser")
public class RoleUserController {

    @Autowired
    private RoleUserService roleUserService;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/mainPage",method = RequestMethod.POST)
    public ModelAndView mainPage(HttpServletRequest request) {
        List<RoleUser> roleUserList = roleUserService.findAll();

        int menuId = Integer.parseInt(request.getParameter("menuId"));
        Menu menuHeader = menuService.findOne(menuId);

        ModelAndView model = new ModelAndView("roleUser.main");
        model.addObject("roleUserList", roleUserList);
        model.addObject("menuHeader",menuHeader);
        return model;
    }

    /*

    @RequestMapping(value = "/editPage",method = RequestMethod.POST)
    public ModelAndView editPage(@ModelAttribute("menu") Menu menu) {
        ModelAndView model = new ModelAndView("menuCreatePage");
        return model;
    }

    @RequestMapping(value = "/updatePage", method = RequestMethod.POST)
    public ModelAndView updatePage(@RequestParam("id") int id,@ModelAttribute("menu") Menu menu) {
        menu = menuService.fineOne(id);
        ModelAndView model = new ModelAndView("menuCreatePage");
        model.addObject("menu",menu);
        return model;
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST ,headers = {"content-type=application/json"})
    public  @ResponseBody
    AlertMessage save(@RequestBody Menu menu,HttpServletRequest request) throws UnsupportedEncodingException {
        AlertMessage alertMessage;
        menuService.save(menu);
        alertMessage = new AlertMessage(AlertIcon.FA_SAVE,AlertHeader.INFO,AlertContent.SAVE_SUSCESS,AlertColor.ALERT_SUCCESS);
        return alertMessage;
    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST ,headers = {"content-type=application/json"})
    public  @ResponseBody AlertMessage delete(@RequestBody Menu menu,HttpServletRequest request) {
        menuService.delete(menu);
        AlertMessage alertMessage = new AlertMessage(AlertIcon.FA_DELETE,AlertHeader.INFO,AlertContent.DELETE_SUSCESS,AlertColor.ALERT_SUCCESS);
        return alertMessage;
    }*/
}

