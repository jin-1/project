package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Model.EventDTO;
import Model.EventDAO;
import service.MemberService;

@Controller
public class EventController {

	MemberService memberService;
	@Autowired
	EventDAO eventDao;
	@RequestMapping(value = "/EventAll", method = RequestMethod.GET)
	public String EventAll(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/Event/Event";
	}
	@RequestMapping(value = "/EventAll2", method = RequestMethod.GET)
	public String EventAll2(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/Event/Event2";
	}
	@RequestMapping(value = "/EventResult", method = RequestMethod.GET)
	public String EventResult(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/Event/EventResult";
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
		System.out.println(list.get(0).getElectedCode());
		model.addAttribute("menu", menu);
		model.addAttribute("list", list);
		
		return "template/Event/coupon";
	}


}
