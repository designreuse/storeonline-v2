package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.model.AlertMessage;
import yeamgood.model.CommonData;
import yeamgood.service.MenuService;
import yeamgood.service.CommonDataService;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/main/commonData")
public class CommonDataController {

    @Autowired
    private CommonDataService commonDataService;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("commonData") CommonData commonData, HttpServletRequest request) {
        List<CommonData> commonDataList = commonDataService.findAll();
        ModelAndView model = new ModelAndView("commonData.main");
        model.addObject("commonDataList", commonDataList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("commonData") CommonData commonData, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        if (id != null) {
            commonData = commonDataService.findOne(Integer.parseInt(id));
            if(action != null){
                commonData.setId(0);
            }
        }
        ModelAndView model = new ModelAndView("commonData.manage");
        model.addObject("commonData", commonData);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody CommonData commonData) {
        commonDataService.save(commonData);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody CommonData commonData) {
        commonDataService.delete(commonData);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }

}

