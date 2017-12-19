package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Biz.CartBiz;
import Model.CartDTO;
import Model.ProductDAO;
import Model.ProductDTO;


@Controller
public class RentController {
	
	@Autowired
	ProductDAO pDAO;
	
	
	@RequestMapping(value="/SearchProduct", method = RequestMethod.GET)
	public String searchProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		model.addAttribute("pDTO", pDTO);
		return "template/rent/SearchProduct";
	}
	@RequestMapping(value="/SearchResult", method = RequestMethod.POST)
	public String searchResult( HttpServletRequest req, ProductDTO pDTO, Model model) {
		pDTO.setPrdName("%"+pDTO.getPrdName()+"%");
	/*	System.out.println(pDTO.getPrdType());
		System.out.println(pDTO.getPrdName());*/
		List<ProductDTO> result = pDAO.searchList(pDTO);
		model.addAttribute("result", result);
		return "template/rent/SearchResult";
	}
	
	@RequestMapping(value="/ProductIndex", method = RequestMethod.GET)
	public String productIndex(Model model, ProductDTO pDTO) {
		/*System.out.println(pDTO.getPrdName());*/
		List<ProductDTO> result = pDAO.productIndex(pDTO);	
		model.addAttribute("result", result);
		return "template/rent/ProductIndex";
	}
	
	
	@RequestMapping(value="/Cart", method = RequestMethod.POST)
	public String cart (HttpServletRequest req, CartBiz cartBiz) {
		String prdName = req.getParameter("productName");
		String prdCode = req.getParameter("productCode");
		String prdPrice = req.getParameter("productPrice");
		String prdQty = req.getParameter("productQ");
		
		String []items = {prdName, prdCode, prdPrice, prdQty};
		cartBiz = new CartBiz();
		cartBiz.addCart(req, items);		// session에 장바구니 저장
		
		
		cartBiz = new CartBiz();
		ArrayList<CartDTO> cartList = cartBiz.getCart(req);
		int totalMoney = 0;
		for( int i=0; i<cartList.size(); i++) {
			int money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
		}
		req.setAttribute("totalMoney", totalMoney);
		req.setAttribute("cartList", cartList);
		
		return "template/rent/Cart";
	}
	
	@RequestMapping(value="/CartQtyUp", method= RequestMethod.GET)
	public String cartQtyUp (HttpServletRequest req, CartBiz cartBiz) {
		String prdName = req.getParameter("prdName");
		System.out.println(prdName);
		/*req.setCharacterEncoding("utf-8");*/
		cartBiz = new CartBiz();
		cartBiz.upCartQty(req, prdName);
		ArrayList<CartDTO> cartList = cartBiz.getCart(req);
		int totalMoney = 0;
		for( int i=0; i<cartList.size(); i++) {
			int money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
		}

		req.setAttribute("totalMoney", totalMoney);
		req.setAttribute("cartList", cartList);
	
		return "template/rent/Cart";
	}
	@RequestMapping(value="/CartQtyDown", method= RequestMethod.GET)
	public String cartQtyDown (HttpServletRequest req, CartBiz cartBiz) {
		String prdName = req.getParameter("prdName");
		/*req.setCharacterEncoding("utf-8");*/
		cartBiz = new CartBiz();
		cartBiz.downCartQty(req, prdName);
		
		ArrayList<CartDTO> cartList = cartBiz.getCart(req);
		int totalMoney = 0;
		for( int i=0; i<cartList.size(); i++) {
			int money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
		}
		req.setAttribute("totalMoney", totalMoney);
		req.setAttribute("cartList", cartList);
		
		return "template/rent/Cart";
	}
	@RequestMapping(value="/CartRemove", method= RequestMethod.POST)
	public String cartRemove (HttpServletRequest req, CartBiz cartBiz) {
		String [] prdName = req.getParameterValues("delete");
		cartBiz = new CartBiz();
		cartBiz.removeCartItem(req, prdName);
		
		ArrayList<CartDTO> cartList = cartBiz.getCart(req);
		int totalMoney = 0;
		for( int i=0; i<cartList.size(); i++) {
			int money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
		}

		req.setAttribute("totalMoney", totalMoney);
		req.setAttribute("cartList", cartList);
		return "template/rent/Cart";
	}
	
	@RequestMapping(value="/Payment", method= RequestMethod.POST)
	public String placeOrder (HttpServletRequest req, CartBiz cartBiz) {
		String totalAmount = req.getParameter("totalAmount");
		/*String [] prdCode = req.getParameterValues("prdCode");
		String [] prdQty = req.getParameterValues("qty");*/
		System.out.println(totalAmount);
		return "template/rent/Payment";
	}
}
