package yeamgood.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import yeamgood.model.District;
import yeamgood.model.Zipcode;
import yeamgood.service.DistrictService;
import yeamgood.service.ZipcodeService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/main/zipcode")
public class ZipcodeController {

    private Zipcode zipcode;

    @Autowired
    private ZipcodeService zipcodeService;

    @Autowired
    private DistrictService districtService;

    @RequestMapping(value = "/findOneAjax", method = RequestMethod.POST)
    public @ResponseBody Zipcode findAllAjax(HttpServletRequest request) {
        String districtID = request.getParameter("districtID");
        District district = districtService.findOne(Integer.parseInt(districtID));
        String districtCode = district.getDistrictCode();
        zipcode = zipcodeService.findOneByDistrictCode(districtCode);
        return zipcode;
    }

}

