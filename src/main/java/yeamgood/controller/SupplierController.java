package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.model.*;
import yeamgood.service.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/main/supplier")
public class SupplierController {

    private List<Province> provinceList;
    private List<District> districtList;
    private List<Amphur> amphurList;


    @Autowired
    private SupplierService supplierService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private ProvinceService provinceService;

    @Autowired
    private AmphurService amphurService;

    @Autowired
    private DistrictService districtService;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("supplier") Supplier supplier, HttpServletRequest request) {
        List<Supplier> supplierList = supplierService.findAll();

        for (Supplier supplierTmp:supplierList){
            String provinceName = provinceService.findOne(supplierTmp.getProvinceID()).getProvinceName();
            String amphurName = amphurService.findOne(supplierTmp.getAmphurID()).getAmphurName();
            String districtName = districtService.findOne(supplierTmp.getDistrictID()).getDistrictName();

            String address = " ต." + districtName + " อ." + amphurName + " จ." + provinceName + " " + supplierTmp.getZipcode();
            supplierTmp.setAddress(supplierTmp.getAddress() + address);

        }

        ModelAndView model = new ModelAndView("supplier.main");
        model.addObject("supplierList", supplierList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/view", method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView view(HttpServletRequest request) {
        List<Supplier> supplierList = supplierService.findAll();

        for (Supplier supplierTmp:supplierList){
            String provinceName = provinceService.findOne(supplierTmp.getProvinceID()).getProvinceName();
            String amphurName = amphurService.findOne(supplierTmp.getAmphurID()).getAmphurName();
            String districtName = districtService.findOne(supplierTmp.getDistrictID()).getDistrictName();

            String address = " ต." + districtName + " อ." + amphurName + " จ." + provinceName + " " + supplierTmp.getZipcode();
            supplierTmp.setAddress(supplierTmp.getAddress() + address);

        }

        ModelAndView model = new ModelAndView("supplier.view");
        model.addObject("supplierList", supplierList);
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("supplier") Supplier supplier, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");

        provinceList = provinceService.findAll();
        amphurList = new ArrayList<Amphur>();
        districtList = new ArrayList<District>();

        if (id != null) {
            supplier = supplierService.findOne(Integer.parseInt(id));
            if(action != null){
                supplier.setSupplierID(0);
            }
            if(supplier.getProvinceID() != 0){
                amphurList = amphurService.findAllByProvinceID(supplier.getProvinceID());
            }
            if(supplier.getProvinceID() != 0 && supplier.getAmphurID() != 0){
                districtList = districtService.findAllByProvinceIDAndAmphurID(supplier.getProvinceID(),supplier.getAmphurID());
            }
        }

        ModelAndView model = new ModelAndView("supplier.manage");
        model.addObject("supplier", supplier);
        model.addObject("provinceList", provinceList);
        model.addObject("districtList", districtList);
        model.addObject("amphurList", amphurList);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody Supplier supplier) {
        supplierService.save(supplier);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody Supplier supplier) {
        supplierService.delete(supplier);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }

}

