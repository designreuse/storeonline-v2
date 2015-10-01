package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.model.AlertMessage;
import yeamgood.model.Catagory;
import yeamgood.service.CatagoryService;
import yeamgood.service.MenuService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/main/catagory")
public class CatagoryController {

    @Autowired
    private CatagoryService catagoryService;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("catagory") Catagory catagory, HttpServletRequest request) {
        List<Catagory> catagoryList = catagoryService.findAll();
        ModelAndView model = new ModelAndView("catagory.main");
        model.addObject("catagoryList", catagoryList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("catagory") Catagory catagory, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        if (id != null) {
            catagory = catagoryService.findOne(Integer.parseInt(id));
            if(action != null){
                catagory.setCatagoryID(0);
            }
        }
        ModelAndView model = new ModelAndView("catagory.manage");
        model.addObject("catagory", catagory);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody Catagory catagory) {
        catagoryService.save(catagory);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody Catagory catagory) {
        catagoryService.delete(catagory);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }

}

