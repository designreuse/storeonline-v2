package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import yeamgood.model.Amphur;
import yeamgood.model.District;
import yeamgood.service.AmphurService;
import yeamgood.service.DistrictService;
import yeamgood.service.MenuService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/main/district")
public class DistrictController {

    private List<District> districtList;

    @Autowired
    private DistrictService districtService;

/*    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("district") District district, HttpServletRequest request) {
        List<District> districtList = districtService.findAll();
        ModelAndView model = new ModelAndView("district.main");
        model.addObject("districtList", districtList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("district") District district, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        if (id != null) {
            district = districtService.findOne(Integer.parseInt(id));
            if(action != null){
                district.setDistrictID(0);
            }
        }
        ModelAndView model = new ModelAndView("district.manage");
        model.addObject("district", district);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody District district) {
        districtService.save(district);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody District district) {
        districtService.delete(district);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }*/


    @RequestMapping(value = "/findAllAjax", method = RequestMethod.POST)
    public @ResponseBody List<District> findAllAjax(HttpServletRequest request) {
        String provinceID = request.getParameter("provinceID");
        String amphurID = request.getParameter("amphurID");
        districtList = districtService.findAllByProvinceIDAndAmphurID(Integer.parseInt(provinceID),Integer.parseInt(amphurID));
        return districtList;
    }

}

