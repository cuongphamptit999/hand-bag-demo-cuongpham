package vn.ptit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.ptit.repositories.CategoryRepository;
import vn.ptit.repositories.ProductRepository;
import vn.ptit.services.ProductServices;

@Controller
public class ProductController {
	@Autowired
	ProductRepository productRepsitory;
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	ProductServices productServices;

	@RequestMapping(value = { "/all-product" }, method = { RequestMethod.GET })
	public String getAllProduct(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		model.addAttribute("products", productRepsitory.findAll());
		model.addAttribute("categories", categoryRepository.findAll());
		return "all_product";
	}

	@RequestMapping(value = { "/all-product/{slug}" }, method = { RequestMethod.GET })
	public String getProductByCate(@PathVariable String slug, ModelMap model, HttpServletRequest req,
			HttpServletResponse resp) {
		model.addAttribute("products", productServices.searchProductBySlugCate(slug));
		model.addAttribute("categories", categoryRepository.findAll());
		return "all_product";
	}

	@RequestMapping(value = { "/all-product/filter-by-price/{price}" }, method = { RequestMethod.GET })
	public String getProductByPrice(@PathVariable String price, ModelMap model, HttpServletRequest req,
			HttpServletResponse resp) {
		model.addAttribute("products", productServices.searchProductByPrice(price));
		model.addAttribute("price", price);
		model.addAttribute("categories", categoryRepository.findAll());
		return "all_product";
	}
	
	@RequestMapping(value = { "/all-product/sort-by-price/{sortPrice}" }, method = { RequestMethod.GET })
	public String getProductBySortPrice(@PathVariable String sortPrice, ModelMap model, HttpServletRequest req,
			HttpServletResponse resp) {
		model.addAttribute("products", productServices.searchProductBySortPrice(sortPrice));
		model.addAttribute("sortPrice", sortPrice);
		model.addAttribute("categories", categoryRepository.findAll());
		return "all_product";
	}
	
	@RequestMapping(value = { "/product-detail/{slug}" }, method = { RequestMethod.GET })
	public String getProductBySlug(@PathVariable String slug, ModelMap model, HttpServletRequest req,
			HttpServletResponse resp) {
		model.addAttribute("product", productServices.getProductBySlug(slug).get(0));
		model.addAttribute("categories", categoryRepository.findAll());
		return "product_detail";
	}
}
