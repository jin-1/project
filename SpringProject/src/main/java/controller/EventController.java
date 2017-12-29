package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import Model.EventDAO;
import Model.EventDTO;
import Model.MemberDAO;
import Model.MemberDTO;


@Controller
public class EventController {
	@Autowired
	MemberDAO memberdao;
	
	@Autowired
	EventDAO eventDao;

	@RequestMapping(value = "/Event", method = RequestMethod.GET)
	public String EventAll2(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String menu = req.getParameter("menu");
		MemberDTO memberdto = (MemberDTO) session.getAttribute("login");
		String memberId = memberdto.getMemberId();
		System.out.println(memberId+"아이디");
		MemberDTO m = memberdao.selectPoint(memberId);
		
		model.addAttribute("menu", menu);
		model.addAttribute("point", m.getPoint());
		
		return "template/Event/Event2";
	}

	@RequestMapping(value = "/EventMain", method = RequestMethod.GET)
	public String EventMain(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/Event/EventMain";
	}
	
	@RequestMapping(value = "/Coupon", method = RequestMethod.GET)
	public String Coupon(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String menu = req.getParameter("menu");
		List<EventDTO> list = eventDao.Coupon(session);
		model.addAttribute("menu", menu);
		model.addAttribute("list", list);
		
		return "template/Event/coupon";
	}
	
	@ResponseBody
	@RequestMapping(value = "/couponList", method = RequestMethod.POST)
	public HashMap<String, EventDTO> couponList(HttpSession session) {


		HashMap<String, EventDTO> couponList = eventDao.CouponList(session);
		
		return couponList;
	}
	
	//쿠폰등록
	@ResponseBody
	@RequestMapping(value = "/couponInsert", method = RequestMethod.POST)
	public HashMap<String, String> searchStation(HttpSession session) {

		eventDao.CouponIn(session);
		
		HashMap<String, String> s = new HashMap<String, String>();
		s.put("1", "쿠폰이 등록되었습니다.");
		return s;
	}
	


}
