package controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Biz.CartBiz;
import Model.CartDTO;
//import Model.EventDTO;
import Model.MemberDTO;
import Model.ProductDAO;
import Model.ProductDTO;
import Model.PurchaseDTO;
import Model.RentRegDTO;
import service.RentService;



@Controller
public class RentController {
	
	@Autowired
	ProductDAO pDAO;
	@Autowired
	CartBiz cartBiz;
	@Autowired
	MemberDTO memberDto;
	@Autowired
	RentService rentService;
	
	@RequestMapping(value="/SearchProduct", method = RequestMethod.GET)
	public String searchProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		model.addAttribute("pDTO", pDTO);
		return "template/rent/SearchProduct";
	}
	@RequestMapping(value="/ViewOrderList", method = RequestMethod.GET)
	public String viewOrderList(HttpServletRequest req, HttpSession session, Model model, PurchaseDTO purchaseDTO) {
		memberDto = (MemberDTO) session.getAttribute("login");
		List<PurchaseDTO> view = pDAO.getOrderList(memberDto.getMemberId());
		
		for( int i=0; i<view.size(); i++) {
			String refundstatus = view.get(i).getRefundStatus();
			if(refundstatus == null || refundstatus.isEmpty()) {
				view.get(i).setRefundStatus("-");
			}
		}
		req.setAttribute("view", view);
		
		return "template/rent/ViewOrderList";
	}
/*	@RequestMapping(value="/ViewOrderList", method = RequestMethod.POST)
	public String viewOrderList1(HttpServletRequest req, HttpSession session, Model model, PurchaseDTO purchaseDTO) {
		memberDto = (MemberDTO) session.getAttribute("login");
		List<PurchaseDTO> view = pDAO.getOrderList(memberDto.getMemberId());
		
		for( int i=0; i<view.size(); i++) {
			String refundstatus = view.get(i).getRefundStatus();
			if(refundstatus == null || refundstatus.isEmpty()) {
				view.get(i).setRefundStatus("-");
			}
		}
		req.setAttribute("view", view);
		
		return "template/rent/ViewOrderList";
	}*/
	
	
	@RequestMapping(value="/RentOrder", method = RequestMethod.GET)
	public String rentOrder(HttpServletRequest req, HttpSession session, Model model, RentRegDTO rrDTO) {
		List<RentRegDTO> orderList = pDAO.getOrder(rrDTO);
		
		for( int i=0; i<orderList.size(); i++) {
			String returnStation = orderList.get(i).getReturnStation();
			if(returnStation == null || returnStation.isEmpty()) {
				orderList.get(i).setReturnDate("-");
				orderList.get(i).setReturnStation("-");
			}
		}
		req.setAttribute("orderList", orderList);
		
		return "template/rent/RentOrder";
	}
	
	@RequestMapping(value="/AdminProductMain", method = RequestMethod.GET)
	public String adminProductMain(HttpServletRequest req, Model model, ProductDTO pDTO) {
		List<ProductDTO> result = pDAO.adminProductMain(pDTO);
		
		model.addAttribute("result", result);
		return "template/rent/AdminProductMain";
	}
	
	@RequestMapping(value="/AdminAddProduct", method = RequestMethod.GET)
	public String adminAddProduct(HttpServletRequest req, Model model, ProductDTO pDTO) {
		String menu = req.getParameter("menu");

		return "template/rent/AdminAddProduct";
	}
	
	@RequestMapping(value="/AdminPrdModify", method = RequestMethod.GET)
	public String adminPrdModify(HttpServletRequest req, Model model, ProductDTO pDTO) {
		String prdCode = req.getParameter("prdCode");
		pDTO.setPrdCode(prdCode);
		System.out.println(prdCode+"   afsgsg");
		List<ProductDTO> result = pDAO.viewPrd(pDTO);
		model.addAttribute("result", result);
		return "template/rent/AdminPrdModify";
	}
	@RequestMapping(value="/AdminPrdModfy", method = RequestMethod.GET)
	public String adminPrdModfy(HttpServletRequest req, Model model, ProductDTO pDTO) {
		List<ProductDTO> result = pDAO.adminPrdModfy(pDTO);
		model.addAttribute("result", result);
		
		return "template/rent/AdminPrdModfy";
	}
	@RequestMapping(value="/AdminPrdModify", method = RequestMethod.POST)
	public String adminPrdModifyView(HttpServletRequest req, Model model, ProductDTO pDTO) {
		pDTO.setPrdName(req.getParameter("prdName"));
		pDTO.setPrdPrice(Integer.parseInt(req.getParameter("prdPrice")));
		
		int result = pDAO.updatePrd(pDTO);
		model.addAttribute("result", result);
		
		if(result > 0) {
			return "redirect:AdminProductMain";
		} else {
			return "template/rent/AdminPrdModify";
		}
		
	}
	@RequestMapping(value="/AdminAddProduct", method = RequestMethod.POST)
	public String adminProductMain(MultipartHttpServletRequest req, ProductDTO pDTO, HttpSession session)throws IOException {
		
		System.out.println("order 컨트롤2");
	
		MultipartFile file = req.getFile("prdImgSave");
		
		String realPath = session.getServletContext().getRealPath("/");
		System.out.println(realPath);
		
		pDTO.setPrdName(req.getParameter("prdName"));
		pDTO.setPrdCategory(req.getParameter("prdCategory"));
		pDTO.setPrdType(req.getParameter("prdType"));
		pDTO.setPrdPrice(Integer.parseInt(req.getParameter("prdPrice")));
		System.out.println("controller "+pDTO.getPrdType());
		
		String filename = file.getOriginalFilename();
		pDTO.setPrdImg(filename);
		pDTO.setPrdImgSave(file);
		
		int result = rentService.insertProduct(pDTO, session, req, realPath);
		
		if(result > 0) {
			return "redirect:AdminProductMain";
		} else {
			return "template/rent/AdminAddProduct";
		}
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
	public String paymentComplete (HttpServletRequest req, HttpSession session, RentRegDTO rrDTO, Model model, PurchaseDTO purchaseDTO) {
		memberDto = (MemberDTO) session.getAttribute("login");
		String pickupDate = req.getParameter("dateTrain_2");
		String pickupStation = req.getParameter("startTrain");
		String returnStation = req.getParameter("endTrain");
		String returnDate = req.getParameter("dateTrain_1");
		
		String cardNum = req.getParameter("cardO")+req.getParameter("cardS")+req.getParameter("cardT")+req.getParameter("cardF");
		
		/*System.out.println("contoller1 "+pickupDate+", "+pickupStation+", d "+returnStation+", d "+returnDate);*/
		System.out.println(cardNum);
		System.out.println(Integer.parseInt(req.getParameter("fixedTotal1")));
		
		purchaseDTO.setCardNum(cardNum);
		purchaseDTO.setMemberId(memberDto.getMemberId());
		purchaseDTO.setPayment(Integer.parseInt(req.getParameter("fixedTotal1")));
		pDAO.placePayment(purchaseDTO);

		
		int totalMoney = 0;
			
		ArrayList<CartDTO> cartList = cartBiz.getCart(req);
		for( int i=0; i<cartList.size(); i++) {
			int money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
			rrDTO.setPrdName(cartList.get(i).getPrdName());
			rrDTO.setPickupQty(cartList.get(i).getQty());
			rrDTO.setPickupStation(pickupStation);
			rrDTO.setPickupDate(pickupDate);
			rrDTO.setMemberId(memberDto.getMemberId());
			
			if(cartList.get(i).getPrdCode().startsWith("A")) {
				rrDTO.setVerifyReturn("일회용");
			} else {
				returnStation = req.getParameter("endTrain");
				rrDTO.setReturnDate(returnDate);
				rrDTO.setReturnStation(returnStation);
				rrDTO.setVerifyReturn("미반납");
			}
			pDAO.placeOrder(rrDTO);
		}	
		int point = (int)Math.round(totalMoney * 0.05);
		memberDto.setPoint(point);
		pDAO.addPoint(memberDto);
		
		cartList.clear();
		return "template/rent/PaymentComplete";
	}
	
//	@RequestMapping(value="/CouponOpen", method= RequestMethod.GET)
//	public String couponOpen (HttpServletRequest req, HttpSession session, EventDTO eventDTO) {
//		System.out.println("controller111");
//	/*	memberDto = (MemberDTO) session.getAttribute("login");
//		List<EventDTO> eventApply = pDAO.couponOpen(memberDto.getMemberId());
//		req.setAttribute("eventApply", eventApply);*/
//		
//		return "template/rent/CouponOpen";
//	}
	
	@RequestMapping(value="/AdminUpdateOrder", method= RequestMethod.GET)
	public String adminUpdateOrder (HttpServletRequest req, RentRegDTO rrDTO, PurchaseDTO purchaseDTO) {
		System.out.println("controller success view");
		List<PurchaseDTO> result = pDAO.adminViewResult(purchaseDTO);
		req.setAttribute("result", result);

		return "template/rent/AdminUpdateOrder";
	}
	
	@RequestMapping(value="/AdminViewOrder", method= RequestMethod.GET)
	public String adminViewOrder (HttpServletRequest req, RentRegDTO rrDTO, PurchaseDTO purchaseDTO) {
		List<RentRegDTO> orderList = pDAO.adminViewOrder(rrDTO);
		req.setAttribute("orderList", orderList);
		
		return "template/rent/AdminViewOrder";
	}
/*		memberDto = (MemberDTO) session.getAttribute("login");
		List<PurchaseDTO> view = pDAO.getOrderList(memberDto.getMemberId());
		
		for( int i=0; i<view.size(); i++) {
			String refundstatus = view.get(i).getRefundStatus();
			if(refundstatus == null || refundstatus.isEmpty()) {
				view.get(i).setRefundStatus("-");
			}
		}
		req.setAttribute("view", view);
		
		return "template/rent/ViewOrderList";*/
	
}
