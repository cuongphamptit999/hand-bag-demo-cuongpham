package vn.ptit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.ptit.repositories.ProductRepsitory;

@Controller
public class HomeController {
	
	@Autowired ProductRepsitory productRepsitory;
	@RequestMapping(value = { "/", "/home" }, method = { RequestMethod.GET })
	public String traVeTrangChu(Model model, HttpServletRequest req, HttpServletResponse resp) {
		model.addAttribute("products", productRepsitory.findAll());
		return "index";
	}

}
