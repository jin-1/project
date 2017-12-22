package controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

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
import Model.MemberDTO;
import Model.ProductDAO;
import Model.ProductDTO;
import Model.RentRegDTO;


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

/*		System.out.println("controller "+req.getParameter("prdCategory"));*/
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
	
	@RequestMapping(value="/Cart", method = RequestMethod.GET)
	public String cartShortcut (HttpServletRequest req, Model model) throws Exception {
		int totalMoney = 0;
		ArrayList<CartDTO> cartList; 
		
		if(cartBiz.getCart(req) == null || cartBiz.getCart(req).isEmpty() || cartBiz.getCart(req).size()==0) {
			cartList= null;
		}else {
			cartList = cartBiz.getCart(req);
			for( int i=0; i<cartList.size(); i++) {
				int money = cartList.get(i).getPrice()*cartList.get(i).getQty();
				totalMoney += money;
			}
		}
		req.setAttribute("totalMoney", totalMoney);
		req.setAttribute("cartList", cartList);
		
		return "template/rent/Cart";
	}
	
	@RequestMapping(value="/Cart", method = RequestMethod.POST)
	public String cart (HttpServletRequest req, Model model) {
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
	public HashMap<String, Object> cartQtyUp(HttpServletRequest req,@RequestParam HashMap<String, Object> param) {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();

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
	
	
	@ResponseBody
	@RequestMapping(value="/CartQtyDown", method= RequestMethod.POST)
	public HashMap<String, Object> cartQtyDown (HttpServletRequest req,@RequestParam HashMap<String, Object> param) {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		cartBiz.downCartQty(req, String.valueOf(param.get("prdName")));
		
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
	
	@ResponseBody
	@RequestMapping(value="/CartRemove", method= RequestMethod.POST)
	public HashMap<String, Object> cartRemove (HttpServletRequest req, @RequestParam HashMap<String, Object> param) {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		
		String [] deletedPrd = String.valueOf(param.get("deletehidden")).split(Pattern.quote(","));
		cartBiz.removeCartItem(req, deletedPrd);
		
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
	
	@RequestMapping(value="/Payment", method= RequestMethod.POST)
	public String placeOrder (HttpServletRequest req) {
		ArrayList<CartDTO> cartList = cartBiz.getCart(req);
		int totalMoney = 0;
		for( int i=0; i<cartList.size(); i++) {
			int money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
		}
		req.setAttribute("totalMoney", totalMoney);
		req.setAttribute("cartList", cartList);
		
		return "template/rent/Payment";
	}
	
	@RequestMapping(value="/PaymentComplete", method= RequestMethod.POST)
	public String paymentComplete (HttpServletRequest req, RentRegDTO rrDTO, Model model) throws ParseException {
		String pickupStation = req.getParameter("startTrain");
		Date pickupDate = new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("dateTrain"));
		HttpSession session = req.getSession();
		System.out.println(pickupDate);
		MemberDTO memberdto= (MemberDTO) session.getAttribute("login");
		ArrayList<CartDTO> cartList = cartBiz.getCart(req);
		int totalMoney = 0;
		for( int i=0; i<cartList.size(); i++) {
			int money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
			
			rrDTO.setPrdName(cartList.get(i).getPrdName());
			rrDTO.setPickupQty(cartList.get(i).getQty());
			rrDTO.setPickupStation(pickupStation);
			rrDTO.setPickupDate(pickupDate);
			rrDTO.setMemberId(memberdto.getMemberId());
		}
		req.setAttribute("totalMoney", totalMoney);
		req.setAttribute("cartList", cartList);
		
/*
		
		
		List<RentRegDTO> result = pDAO.placeOrder(rrDTO);
		model.addAttribute("result", result);*/
		
		return "template/rent/PaymentComplete";
	}
}
