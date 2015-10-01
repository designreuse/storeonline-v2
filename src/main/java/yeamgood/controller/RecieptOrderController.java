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
@RequestMapping("/main/recieptOrder")
public class RecieptOrderController {

    @Autowired
    private RecieptOrderService recieptOrderService;

    @Autowired
    private RecieptOrderProductService recieptOrderProductService;

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
    public ModelAndView main(@ModelAttribute("recieptOrder") RecieptOrder recieptOrder, HttpServletRequest request) {
        List<RecieptOrder> recieptOrderList = recieptOrderService.findAll();
        ModelAndView model = new ModelAndView("recieptOrder.main");
        model.addObject("recieptOrderList", recieptOrderList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("recieptOrder") RecieptOrder recieptOrder, HttpServletRequest request) {
        String id = request.getParameter("id");
        String action = request.getParameter("action");
        List<RecieptOrderProduct> recieptOrderProductList = new ArrayList<RecieptOrderProduct>();

        if (id != null) {
            recieptOrder = recieptOrderService.findOne(Integer.parseInt(id));
            recieptOrderProductList = recieptOrderProductService.findAllByRecieptOrderID(recieptOrder.getRecieptOrderID());
            if(StringUtils.equals(action,"add")){
                recieptOrder.setRecieptOrderID(0);
            }

            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
            if(recieptOrder.getRecieptDate() != null){
                recieptOrder.setRecieptDateText(formatter.format(recieptOrder.getRecieptDate()));
            }
        /*    if(recieptOrder.getRequiredDate() != null){
                recieptOrder.setRequiredDateText(formatter.format(recieptOrder.getRequiredDate()));
            }*/
        }
        recieptOrder.setRecieptOrderProductList(recieptOrderProductList);

        ModelAndView model = new ModelAndView("recieptOrder.manage");
        model.addObject("recieptOrder", recieptOrder);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody RecieptOrder recieptOrder) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.ENGLISH);
        if(StringUtils.isNotBlank(recieptOrder.getRecieptDateText())){
            recieptOrder.setRecieptDate(formatter.parse(recieptOrder.getRecieptDateText()));
        }
       /* if(StringUtils.isNotBlank(recieptOrder.getRequiredDateText())) {
            recieptOrder.setRequiredDate(formatter.parse(recieptOrder.getRequiredDateText()));
        }*/
        recieptOrderService.save(recieptOrder);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody RecieptOrder recieptOrder) {
        recieptOrderService.delete(recieptOrder);
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

        ModelAndView model = new ModelAndView("recieptOrder.product.view");
        model.addObject("productList", productList);
        model.addObject("brandList", brandList);
        model.addObject("catagoryList", catagoryList);
        model.addObject("unitList", unitList);
        return model;
    }

}

