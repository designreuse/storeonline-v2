package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.model.AlertMessage;
import yeamgood.model.Unit;
import yeamgood.service.MenuService;
import yeamgood.service.UnitService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/main/unit")
public class UnitController {

    @Autowired
    private UnitService unitService;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("unit") Unit unit, HttpServletRequest request) {
        List<Unit> unitList = unitService.findAll();
        ModelAndView model = new ModelAndView("unit.main");
        model.addObject("unitList", unitList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("unit") Unit unit, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        if (id != null) {
            unit = unitService.findOne(Integer.parseInt(id));
            if(action != null){
                unit.setUnitID(0);
            }
        }
        ModelAndView model = new ModelAndView("unit.manage");
        model.addObject("unit", unit);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody Unit unit) {
        unitService.save(unit);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody Unit unit) {
        unitService.delete(unit);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }

}

