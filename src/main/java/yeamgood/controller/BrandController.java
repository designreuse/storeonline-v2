package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.model.AlertMessage;
import yeamgood.model.Brand;
import yeamgood.service.BrandService;
import yeamgood.service.MenuService;
import yeamgood.service.BrandService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/main/brand")
public class BrandController {

    @Autowired
    private BrandService brandService;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("brand") Brand brand, HttpServletRequest request) {
        List<Brand> brandList = brandService.findAll();
        ModelAndView model = new ModelAndView("brand.main");
        model.addObject("brandList", brandList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("brand") Brand brand, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        if (id != null) {
            brand = brandService.findOne(Integer.parseInt(id));
            if(action != null){
                brand.setBrandID(0);
            }
        }
        ModelAndView model = new ModelAndView("brand.manage");
        model.addObject("brand", brand);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody Brand brand) {
        brandService.save(brand);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody Brand brand) {
        brandService.delete(brand);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }

}

