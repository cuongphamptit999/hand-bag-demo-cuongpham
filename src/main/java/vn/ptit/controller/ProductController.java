package vn.ptit.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.ptit.entities.Bill;
import vn.ptit.entities.BoughtProduct;
import vn.ptit.repositories.BillRepository;
import vn.ptit.repositories.CategoryRepository;
import vn.ptit.repositories.ProductRepository;
import vn.ptit.services.ProductServices;
import vn.ptit.services.UserService;
import vn.ptit.ultils.FilterMap;

@Controller
public class ProductController {
	@Autowired
	ProductRepository productRepsitory;
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	ProductServices productServices;
	@Autowired UserService userService;
	@Autowired BillRepository billRepository;

	@RequestMapping(value = { "/all-product" }, method = { RequestMethod.GET })
	public String getAllProduct(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		String material = req.getParameter("material");
		String brand = req.getParameter("brand");
		String sort = req.getParameter("sort");

		List<FilterMap> listFilter = new ArrayList<>();
		if (material != null) {
			FilterMap filter = new FilterMap("material", material);
			listFilter.add(filter);
			model.addAttribute("material", material);
		}
		if (brand != null) {
			FilterMap filter = new FilterMap("brand", brand);
			listFilter.add(filter);
			model.addAttribute("brand", brand);
		}

		if (sort != null) {
			FilterMap filter = new FilterMap("sort", sort);
			listFilter.add(filter);
			model.addAttribute("sort", sort);
		}

		model.addAttribute("products", productServices.findProduct(listFilter));
		model.addAttribute("categories", categoryRepository.findAll());
		return "all_product";
	}

	@RequestMapping(value = { "/all-product/{slug}" }, method = { RequestMethod.GET })
	public String getProductByCate(@PathVariable String slug, ModelMap model, HttpServletRequest req,
			HttpServletResponse resp) {
		String material = req.getParameter("material");
		String brand = req.getParameter("brand");
		String sort = req.getParameter("sort");

		List<FilterMap> listFilter = new ArrayList<>();
		if (material != null) {
			FilterMap filter = new FilterMap("material", material);
			listFilter.add(filter);
			model.addAttribute("material", material);
		}
		if (brand != null) {
			FilterMap filter = new FilterMap("brand", brand);
			listFilter.add(filter);
			model.addAttribute("brand", brand);
		}

		if (sort != null) {
			FilterMap filter = new FilterMap("sort", sort);
			listFilter.add(filter);
			model.addAttribute("sort", sort);
		}

		model.addAttribute("products", productServices.searchProductBySlugCate(slug, listFilter));
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

	@RequestMapping(value = { "/cart" }, method = { RequestMethod.GET })
	public String getCart(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		model.addAttribute("categories", categoryRepository.findAll());
		return "cart";
	}
	
	@RequestMapping(value = { "/cart/finish" }, method = { RequestMethod.GET })
	public String checkoutCart(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		Bill bill = new Bill();
		bill.setDateCreate(new Date());
		bill.setUser(userService.loadUserByUsername(req.getRemoteUser()));
		
		HttpSession httpSession = req.getSession();
		List<BoughtProduct> carts = (List<BoughtProduct>) httpSession.getAttribute("giohang");
		for (BoughtProduct boughtProduct : carts) {
			bill.addBoughtProduct(boughtProduct);
		}
		
		billRepository.save(bill);
		carts.clear();
		httpSession.setAttribute("giohang", carts);
		model.addAttribute("categories", categoryRepository.findAll());
		
		return "cart";
	}
}
