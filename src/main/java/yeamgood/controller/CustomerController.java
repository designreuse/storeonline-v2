package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import yeamgood.model.AlertMessage;
import yeamgood.model.Customer;
import yeamgood.service.CustomerService;
import yeamgood.service.MenuService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/main/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public ModelAndView main(@ModelAttribute("customer") Customer customer, HttpServletRequest request) {
        List<Customer> customerList = customerService.findAll();
        ModelAndView model = new ModelAndView("customer.main");
        model.addObject("customerList", customerList);
        model.addObject("menuHeader", menuService.findOne(Integer.parseInt(request.getParameter("menuId"))));
        return model;
    }

    @RequestMapping(value = "/manage", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manage(@ModelAttribute("customer") Customer customer, HttpServletRequest request) {
        String id = request.getParameter("id");
        if (id != null) {
            customer = customerService.findOne(Integer.parseInt(id));
        }
        ModelAndView model = new ModelAndView("customer.manage");
        model.addObject("customer", customer);
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage save(@RequestBody Customer customer) {
        customerService.save(customer);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.saveSuccess();
        return alertMessage;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, headers = {"content-type=application/json"})
    public
    @ResponseBody
    AlertMessage delete(@RequestBody Customer customer) {
        customerService.delete(customer);
        AlertMessage alertMessage = new AlertMessage();
        alertMessage.deleteSuccess();
        return alertMessage;
    }

}

