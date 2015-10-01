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
@RequestMapping("/main/warehouse")
public class WareHouseController {

    private List<WareHouse> warehouseList;
    private List<WarehouseProduct> warehouseProductList;
    private List<Brand> brandList;
    private List<Catagory> catagoryList;
    private List<Unit> unitList;

    @Autowired
    private WareHouseService warehouseService;

    @Autowired
    private WarehouseProductService warehouseProductService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private ProductService productService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private CatagoryService catagoryService;

    @Autowired
    private UnitService unitService;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("warehouse") WareHouse warehouse, HttpServletRequest request) {
        List<WareHouse> warehouseList = warehouseService.findAll();
        ModelAndView model = new ModelAndView("warehouse.main");
        model.addObject("warehouseList", warehouseList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("warehouse") WareHouse warehouse, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        if (id != null) {
            warehouse = warehouseService.findOne(Integer.parseInt(id));
            if(action != null){
                warehouse.setWarehouseID(0);
            }
        }
        ModelAndView model = new ModelAndView("warehouse.manage");
        model.addObject("warehouse", warehouse);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody WareHouse warehouse) {
        warehouseService.save(warehouse);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody WareHouse warehouse) {
        warehouseService.delete(warehouse);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/product/main", method = RequestMethod.POST)
    public ModelAndView warehouseProductMain(@ModelAttribute("warehouseProduct") WarehouseProduct warehouseProduct, HttpServletRequest request) {
        WareHouse warehouse = new WareHouse();
        String warehouseID = request.getParameter("warehouseID");
        warehouseList = warehouseService.findAllByActive(Constant.ACTIVE);
        if (warehouseID != null) {
            warehouse = warehouseService.findOne(Integer.parseInt(warehouseID));
            warehouseProductList = warehouseProductService.findAllByWarehouse(warehouse);

            for (WarehouseProduct warehouseProductData:warehouseProductList){
                warehouseProductData.setUnitsInStockText(NumberFormat.getNumberInstance().format(warehouseProductData.getUnitsInStock()));
            }
        }

        ModelAndView model = new ModelAndView("warehouse.product.main");
        model.addObject("warehouseList", warehouseList);
        model.addObject("warehouseProductList", warehouseProductList);
        model.addObject("warehouse", warehouse);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/product/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView warehouseProductManage(HttpServletRequest request) {
        List<Product> productList = productService.findAll();
        String warehouseID = request.getParameter("warehouseID");

        brandList = brandService.findAllByActive(Constant.ACTIVE);
        catagoryList = catagoryService.findAllByActive(Constant.ACTIVE);
        unitList = unitService.findAllByActive(Constant.ACTIVE);

        ModelAndView model = new ModelAndView("warehouse.product.manage");
        model.addObject("warehouseID",warehouseID);
        model.addObject("productList", productList);
        model.addObject("brandList", brandList);
        model.addObject("catagoryList", catagoryList);
        model.addObject("unitList", unitList);
        return model;
    }


    @RequestMapping(value = "/product/manageFindOne", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView warehouseProductMangaeFindOne(@ModelAttribute("warehouseProduct") WarehouseProduct warehouseProduct, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        if (id != null) {
            warehouseProduct = warehouseProductService.findOne(Integer.parseInt(id));
            if(action != null){
                warehouseProduct.setWarehouseProductID(0);
            }
        }
        ModelAndView model = new ModelAndView("warehouse.product.manage.findOne");
        model.addObject("warehouseProduct", warehouseProduct);
        return model;
    }

    @RequestMapping(value = "/product/saveFindOne", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public @ResponseBody AlertMessage warehouseProductSaveFindOne(@RequestBody WarehouseProduct warehouseProduct) {
        WarehouseProduct warehouseProductSave = warehouseProductService.findOne(warehouseProduct.getWarehouseProductID());
        warehouseProductSave.setUnitsInStock(warehouseProduct.getUnitsInStock());
        warehouseProductService.save(warehouseProductSave);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/product/save", method = RequestMethod.POST)
    public @ResponseBody AlertMessage warehouseProductSave(HttpServletRequest request) {

        String warehouseID = request.getParameter("warehouseID");
        String[] amountList = request.getParameterValues("amount");
        String[] productList = request.getParameterValues("productID");

        WarehouseProduct warehouseProduct;
        WareHouse warehouse;
        Product product;
        warehouseProductList = new ArrayList<WarehouseProduct>();
        int size = amountList.length;
        for (int round = 0; round < size; round++) {
            warehouseProduct = new WarehouseProduct();
            warehouse = new WareHouse();
            product = new Product();

            warehouse.setWarehouseID(Integer.parseInt(warehouseID));
            product.setProductID(Integer.parseInt(productList[round]));

            warehouseProduct.setWarehouse(warehouse);
            warehouseProduct.setProduct(product);
            warehouseProduct.setUnitsInStock(Integer.parseInt(amountList[round]));
            warehouseProductList.add(warehouseProduct);
        }
        warehouseProductService.saveWarehouseProduct(warehouseProductList);

        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }


    @RequestMapping(value = "/product/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public @ResponseBody AlertMessage warehouseProductDelete(@RequestBody WarehouseProduct warehouseProduct) {
        warehouseProductService.delete(warehouseProduct);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }


}

