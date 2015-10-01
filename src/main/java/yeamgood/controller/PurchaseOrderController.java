package yeamgood.controller;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.constant.Constant;
import yeamgood.model.*;
import yeamgood.service.*;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Controller
@RequestMapping("/main/purchaseOrder")
public class PurchaseOrderController {

    @Autowired
    private PurchaseOrderService purchaseOrderService;

    @Autowired
    private PurchaseOrderProductService purchaseOrderProductService;

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
    public ModelAndView main(@ModelAttribute("purchaseOrder") PurchaseOrder purchaseOrder, HttpServletRequest request) {
        List<PurchaseOrder> purchaseOrderList = purchaseOrderService.findAll();
        ModelAndView model = new ModelAndView("purchaseOrder.main");
        model.addObject("purchaseOrderList", purchaseOrderList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("purchaseOrder") PurchaseOrder purchaseOrder, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        List<PurchaseOrderProduct> purchaseOrderProductList = new ArrayList<PurchaseOrderProduct>();

        if (id != null) {
            purchaseOrder = purchaseOrderService.findOne(Integer.parseInt(id));
            purchaseOrderProductList = purchaseOrderProductService.findAllByPurchaseOrderID(purchaseOrder.getPurchaseOrderID());
            if(StringUtils.equals(action,"add")){
                purchaseOrder.setPurchaseOrderID(0);
            }

            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
            if(purchaseOrder.getPurchaseDate() != null){
                purchaseOrder.setPurchaseDateText(formatter.format(purchaseOrder.getPurchaseDate()));
            }
            if(purchaseOrder.getRequiredDate() != null){
                purchaseOrder.setRequiredDateText(formatter.format(purchaseOrder.getRequiredDate()));
            }
        }
        purchaseOrder.setPurchaseOrderProductList(purchaseOrderProductList);

        ModelAndView model = new ModelAndView("purchaseOrder.manage");
        model.addObject("purchaseOrder", purchaseOrder);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody PurchaseOrder purchaseOrder) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
        if(StringUtils.isNotBlank(purchaseOrder.getPurchaseDateText())){
            purchaseOrder.setPurchaseDate(formatter.parse(purchaseOrder.getPurchaseDateText()));
        }
        if(StringUtils.isNotBlank(purchaseOrder.getRequiredDateText())) {
            purchaseOrder.setRequiredDate(formatter.parse(purchaseOrder.getRequiredDateText()));
        }
        purchaseOrderService.save(purchaseOrder);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody PurchaseOrder purchaseOrder) {
        purchaseOrderService.delete(purchaseOrder);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }


    @RequestMapping(value = "/product/view", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView warehouseProductManage(HttpServletRequest request) {
        List<Product> productList = productService.findAll();
        List<Brand> brandList = brandService.findAllByActive(Constant.ACTIVE);
        List<Catagory> catagoryList = catagoryService.findAllByActive(Constant.ACTIVE);
        List<Unit> unitList  = unitService.findAllByActive(Constant.ACTIVE);

        ModelAndView model = new ModelAndView("purchaseOrder.product.view");
        model.addObject("productList", productList);
        model.addObject("brandList", brandList);
        model.addObject("catagoryList", catagoryList);
        model.addObject("unitList", unitList);
        return model;
    }

}

