package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Model.MemberDAO;
import Model.MemberDTO;
import service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;


	@RequestMapping(value = "/LoginForm", method = RequestMethod.GET)
	public String MemberForm(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/LoginForm";
	}

	@RequestMapping(value = "/LoginForm", method = RequestMethod.POST)
	public String MemberFormLogin(HttpSession session, @ModelAttribute("login") MemberDTO memberDto) {
		
		int result=memberService.Login(memberDto, session);
		
		if(result==2) {
			return "index";
		}else if(result==1){
			return "template/member/LoginForm";
		}else {
			return "template/member/LoginForm";
		}
	}
	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String MemberLogout(HttpSession session) {
		System.out.println("로그아웃");
		session.invalidate();
		return "index";
		
	}
	

}
