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
import Model.EmailDTO;
import Model.MemberDAO;
import Model.MemberDTO;
import service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	MemberDAO memberDao;
	EmailDTO emailDto;
	//일반회원 로그인
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
	
	//회원가입 약관동의 페이지 이동
	@RequestMapping(value = "/Register", method = RequestMethod.GET)
	public String Register(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/agreement";
	}
	
	//일반회원가입 페이지 이동
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
	
	//아이디 찾기
	@RequestMapping(value = "/IdFind", method = RequestMethod.GET)
	public String IdFind(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/idfind";
	}
	
	@RequestMapping(value = "/IdFind", method = RequestMethod.POST)
	public String memIdfind(@ModelAttribute("idFind") MemberDTO dto, Model model) throws Exception {
		
		MemberDTO result = memberDao.memIdFind(dto); 
		EmailDTO emailDTO = new EmailDTO(); 
			String id = result.getMemberId();
			String mail = result.getMemberEmail();
			String name = result.getMemberName();
			
			System.out.println("3"+id);
			System.out.println("2"+mail);
			System.out.println("1"+name);
			
			if(id != null) {
				System.out.println("333");
				emailDTO.setContent("아이디는"+id+"입니다.");
				emailDTO.setSubject(name+"님이 찾으신 아이디 입니다.");
				emailDTO.setReceiver(mail);
				System.out.println("444");
				memberService.SendEmail(emailDTO);
			}
			return "template/member/idfind";
		}

	
	//비밀번호 찾기
	@RequestMapping(value = "/PwFind", method = RequestMethod.GET)
	public String PwFind(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/pwfind";
	}
	
	//마이페이지 인덱스 페이지이동
	@RequestMapping(value = "/MyPage", method = RequestMethod.GET)
	public String MypageIndex(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/mypageIndex";
	}
	
	//일반회원 아이디 중복검사
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
	
	//기업회원 아이디 중복검사
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
	
	//일반회원 내 정보 수정
	@RequestMapping(value = "/myPageCon", method = RequestMethod.GET)
	public String myPageCon(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/member/myPageCon";
	}
	
	
}
