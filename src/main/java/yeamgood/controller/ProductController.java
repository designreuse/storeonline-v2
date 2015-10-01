package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.constant.Constant;
import yeamgood.model.*;
import yeamgood.service.*;

import javax.servlet.http.HttpServletRequest;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/main/product")
public class ProductController {

    private List<Brand> brandList;
    private List<Catagory> catagoryList;
    private List<Unit> unitList;
    private List<WarehouseProduct> warehouseProductList;

    @Autowired
    private ProductService productService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private CatagoryService catagoryService;

    @Autowired
    private UnitService unitService;

    @Autowired
    private WarehouseProductService warehouseProductService;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("product") Product product, HttpServletRequest request) {
        List<Product> productList = productService.findAll();
        ModelAndView model = new ModelAndView("product.main");
        model.addObject("productList", productList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("product") Product product, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        warehouseProductList = new ArrayList<WarehouseProduct>();
        if (id != null) {
            product = productService.findOne(Integer.parseInt(id));
            product.setBrandID(String.valueOf(product.getBrand().getBrandID()));
            product.setCatagoryID(String.valueOf(product.getCatagory().getCatagoryID()));
            product.setUnitID(String.valueOf(product.getUnit().getUnitID()));
            if(action != null && action.equals("add")){
                product.setProductID(0);
            }else{
                warehouseProductList = warehouseProductService.findAllByProduct(product);
                for (WarehouseProduct warehouseProductData:warehouseProductList){
                    warehouseProductData.setUnitsInStockText(NumberFormat.getNumberInstance().format(warehouseProductData.getUnitsInStock()));
                }
            }
        }

        brandList = brandService.findAllByActive(Constant.ACTIVE);
        catagoryList = catagoryService.findAllByActive(Constant.ACTIVE);
        unitList = unitService.findAllByActive(Constant.ACTIVE);

        ModelAndView model = new ModelAndView("product.manage");
        model.addObject("product", product);
        model.addObject("brandList", brandList);
        model.addObject("catagoryList", catagoryList);
        model.addObject("unitList", unitList);
        model.addObject("warehouseProductList", warehouseProductList);

        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody Product product) {
        Brand brand = new Brand();
        brand.setBrandID(Integer.parseInt(product.getBrandID()));
        product.setBrand(brand);

        Catagory catagory = new Catagory();
        catagory.setCatagoryID(Integer.parseInt(product.getCatagoryID()));
        product.setCatagory(catagory);

        Unit unit = new Unit();
        unit.setUnitID(Integer.parseInt(product.getUnitID()));
        product.setUnit(unit);

        productService.save(product);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody Product product) {
        productService.delete(product);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }


}

