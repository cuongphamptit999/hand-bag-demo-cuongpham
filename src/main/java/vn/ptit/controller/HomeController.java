package vn.ptit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.ptit.repositories.CategoryRepository;
import vn.ptit.repositories.ProductRepository;
import vn.ptit.services.ProductServices;

@Controller
public class HomeController {
	@Autowired
	ProductRepository productRepsitory;
	@Autowired
	ProductServices productServices;
	@Autowired
	CategoryRepository categoryRepository;

	@RequestMapping(value = { "/", "/home" }, method = { RequestMethod.GET })
	public String traVeTrangChu(Model model, HttpServletRequest req, HttpServletResponse resp) {

		model.addAttribute("categories", categoryRepository.findAll());
		model.addAttribute("productWallets", productServices.searchProductByIdCateSortName(1));
		model.addAttribute("productBackpacks", productServices.searchProductByIdCateSortName(2));
		
		return "index";
	}
	
	@RequestMapping(value = { "/login" }, method = { RequestMethod.GET })
	public String login(Model model, HttpServletRequest req, HttpServletResponse resp) {

		model.addAttribute("categories", categoryRepository.findAll());
		
		return "login";
	}

}
