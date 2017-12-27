package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Model.MemberDAO;
import service.MemberService;


@Controller
public class BudgetController {
	@Autowired
	MemberService memberService;
	@Autowired
	MemberDAO memberDao;
	@RequestMapping(value = "/BudgetG", method = RequestMethod.GET)
	public String BudgetGrap(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/Budget/BudgetGrap";
	}
	@RequestMapping(value = "/BudgetL", method = RequestMethod.GET)
	public String BudgetList(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/Budget/Budget";
	}

}
