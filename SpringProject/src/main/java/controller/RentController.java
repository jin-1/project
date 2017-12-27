package controller;

import java.util.ArrayList;
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
import Model.EventDTO;
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
	@Autowired
	MemberDTO memberDto;

	
	@RequestMapping(value="/SearchProduct", method = RequestMethod.GET)
	public String searchProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		model.addAttribute("pDTO", pDTO);
		return "template/rent/SearchProduct";
	}
	@RequestMapping(value="/RentOrder", method = RequestMethod.GET)
	public String rentOrder(HttpServletRequest req, HttpSession session, Model model, RentRegDTO rrDTO) {
		System.out.println("order 而⑦듃濡�");
		String menu = "Order";
		memberDto = (MemberDTO) session.getAttribute("login");
		List<RentRegDTO> orderList = pDAO.getOrder(memberDto.getMemberId());
		
		for( int i=0; i<orderList.size(); i++) {
			String returnStation = orderList.get(i).getReturnStation();
			if(returnStation == null || returnStation.isEmpty()) {
				orderList.get(i).setReturnDate("-");
				orderList.get(i).setReturnStation("-");
			}
		}
		req.setAttribute("orderList", orderList);
		model.addAttribute("menu", menu);
		
		return "template/rent/RentOrder";
	}
	
	
	@RequestMapping(value="/AdminAddProduct", method = RequestMethod.GET)
	public String adminAddProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		System.out.println("order 而⑦듃濡�1");
		String menu = req.getParameter("menu");
		
		pDAO.insertProduct(pDTO);
		
		return "template/rent/AdminAddProduct";
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

		cartBiz.addCart(req, items);		// session�뿉 �옣諛붽뎄�땲 ���옣

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
	public String paymentComplete (HttpServletRequest req, HttpSession session, RentRegDTO rrDTO, Model model) {
		String pickupDate = req.getParameter("dateTrain");;
		String pickupStation = req.getParameter("startTrain");
		String returnStation;
		/*System.out.println("contoller1 "+returnStation+", "+pickupStation);*/
		
		memberDto = (MemberDTO) session.getAttribute("login");
		
		ArrayList<CartDTO> cartList = cartBiz.getCart(req);
		for( int i=0; i<cartList.size(); i++) {
			rrDTO.setPrdName(cartList.get(i).getPrdName());
			rrDTO.setPickupQty(cartList.get(i).getQty());
			rrDTO.setPickupStation(pickupStation);
			rrDTO.setPickupDate(pickupDate);
			rrDTO.setMemberId(memberDto.getMemberId());
			
			if(cartList.get(i).getPrdCode().startsWith("A")) {
				rrDTO.setVerifyReturn("�씪�쉶�슜");
			} else {
				returnStation = req.getParameter("endTrain");
				rrDTO.setReturnDate(pickupDate);
				rrDTO.setReturnStation(returnStation);
				rrDTO.setVerifyReturn("誘몃컲�궔");
			}
			pDAO.placeOrder(rrDTO);
		}	
		return "template/rent/PaymentComplete";
	}
	
	@RequestMapping(value="/CouponOpen", method= RequestMethod.GET)
	public String couponOpen (HttpServletRequest req, HttpSession session, EventDTO eventDTO) {
		System.out.println("controller111");
	/*	memberDto = (MemberDTO) session.getAttribute("login");
		List<EventDTO> eventApply = pDAO.couponOpen(memberDto.getMemberId());
		req.setAttribute("eventApply", eventApply);*/
		
		return "template/rent/CouponOpen";
	}
}
