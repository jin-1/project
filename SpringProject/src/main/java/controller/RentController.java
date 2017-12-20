package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Biz.CartBiz;
import Model.CartDTO;
import Model.ProductDAO;
import Model.ProductDTO;


@Controller
public class RentController {
	
	@Autowired
	ProductDAO pDAO;
	@Autowired
	CartBiz cartBiz;
	
	@RequestMapping(value="/SearchProduct", method = RequestMethod.GET)
	public String searchProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		model.addAttribute("pDTO", pDTO);
		return "template/rent/SearchProduct";
	}
	@RequestMapping(value="/SearchResult", method = RequestMethod.POST)
	public String searchResult( HttpServletRequest req, ProductDTO pDTO, Model model) {
		pDTO.setPrdName("%"+pDTO.getPrdName()+"%");
		List<ProductDTO> result = pDAO.searchList(pDTO);
		model.addAttribute("result", result);
		return "template/rent/SearchResult";
	}
	
	@RequestMapping(value="/ProductIndex", method = RequestMethod.GET)
	public String productIndex(HttpServletRequest req, Model model, ProductDTO pDTO) {
		List<ProductDTO> result = pDAO.productIndex(pDTO);	
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		model.addAttribute("result", result);
		return "template/rent/ProductIndex";
	}
	
	
	@RequestMapping(value="/Cart", method = RequestMethod.POST)
	public String cart (HttpServletRequest req) {
		String prdName = req.getParameter("productName");
		String prdCode = req.getParameter("productCode");
		String prdPrice = req.getParameter("productPrice");
		String prdQty = req.getParameter("productQ");
		
		String []items = {prdName, prdCode, prdPrice, prdQty};

		cartBiz.addCart(req, items);		// session에 장바구니 저장
		
		
	
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
	
	
	@ResponseBody
	@RequestMapping(value = "/CartQtyUp", method = RequestMethod.POST)
	public HashMap<String, Object> checkId(HttpServletRequest req,@RequestParam HashMap<String, Object> param) {

		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		System.out.println(param.get("prdName"));
		/*req.setCharacterEncoding("utf-8");*/
		
		cartBiz.upCartQty(req, String.valueOf(param.get("prdName")));
		ArrayList<CartDTO> cartList = cartBiz.getCart(req);
		int totalMoney = 0;
		for( int i=0; i<cartList.size(); i++) {
			int money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
		}
		hashmap.put("totalMoney", String.valueOf(totalMoney));
		hashmap.put("cartList", cartList);
		return hashmap;
	}
	
	

	@RequestMapping(value="/CartQtyDown", method= RequestMethod.POST)
	public String cartQtyDown (HttpServletRequest req) {
		String prdName = req.getParameter("prdName");
		/*req.setCharacterEncoding("utf-8");*/
		
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
	public String cartRemove (HttpServletRequest req) {
		String [] prdName = req.getParameterValues("delete");
		
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
	public String placeOrder (HttpServletRequest req) {
		String totalAmount = req.getParameter("totalAmount");
		/*String [] prdCode = req.getParameterValues("prdCode");
		String [] prdQty = req.getParameterValues("qty");*/
		System.out.println(totalAmount);
		return "template/rent/Payment";
	}
}
