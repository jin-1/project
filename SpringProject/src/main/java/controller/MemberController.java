package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Model.CorporDTO;
import Model.MemberDAO;
import Model.MemberDTO;
import service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	MemberDAO memberDao;

	@RequestMapping(value = "/LoginForm", method = RequestMethod.GET)
	public String MemberForm(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/LoginForm";
	}

	@RequestMapping(value = "/LoginForm", method = RequestMethod.POST)
	public String MemberFormLogin(HttpSession session, @ModelAttribute("login") MemberDTO memberDto) {
		
		int result=memberService.Login(memberDto, session);
		System.out.println(result);
		if(result==2) {
			return "index";
		}else if(result==1){
			return "template/member/LoginForm";
		}else {
			return "template/member/LoginForm";
		}
	}
	
	@RequestMapping(value = "/CorLoginForm", method = RequestMethod.POST)
	public String CorPorFormLogin(HttpSession session, @ModelAttribute("corlogin") CorporDTO corporDto) {
		
		int result=memberService.CorLogin(corporDto, session);
		System.out.println(result);
		if(result==2) {
			return "corIndex";
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
	
	@RequestMapping(value = "/Register", method = RequestMethod.GET)
	public String Register(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/agreement";
	}
	
	@RequestMapping(value = "/MemberShip", method = RequestMethod.GET)
	public String MemberShip(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/membership";
	}
	
	
	@RequestMapping(value = "/MemberShip", method = RequestMethod.POST)
	public String member(@ModelAttribute("register") MemberDTO dto) {
		int result = memberService.setRegister(dto);
		
		if(result>0) {
			return "index";
		} else {
		return "template/member/membership";
		}
	}
	@RequestMapping(value = "/CorpoRation", method = RequestMethod.GET)
	public String CorpoRation(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/corporation";
	}
	
	@RequestMapping(value = "/CorpoRation", method = RequestMethod.POST)
	public String Corpor(@ModelAttribute("corregister") CorporDTO dto) {
		int result = memberService.setCorRegister(dto);
		
		if(result>0) {
			return "index";
		}else {
			return "template/member/corporation";
		}
	}
	
	@RequestMapping(value = "/IdFind", method = RequestMethod.GET)
	public String IdFind(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/idfind";
	}
	
	@RequestMapping(value = "/PwFind", method = RequestMethod.GET)
	public String PwFind(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/pwfind";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public HashMap<String, String> checkId(@RequestParam HashMap<String, Object> param) {

		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		// your logic
		int result = memberDao.IdCheck(String.valueOf(param.get("memberId")));
		if(result>0) {
			hashmap.put("result", "중복된 아이디 입니다.");
		}else {
			hashmap.put("result", "중복되지 않은 아이디 입니다.");
		}

		return hashmap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/coridcheck", method = RequestMethod.POST)
	public HashMap<String, String> corCheckId(@RequestParam HashMap<String, Object> param){
		HashMap<String, String> hashmap = new HashMap<String, String>();
		int result = memberDao.CorIdCheck(String.valueOf(param.get("corporId")));
		if(result>0) {
			hashmap.put("result", "중복된 아이디 입니다.");
		}else {
			hashmap.put("result", "중복되지 않은 아이디 입니다.");
		}
		return hashmap;
	}	
}
