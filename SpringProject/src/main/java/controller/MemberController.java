package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

import Model.*;
import service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	MemberDAO memberDao;
	@Autowired
	EmailDTO emailDto;
	@Autowired
	MemberDTO memberDto;
	@Autowired
	CorporDTO corporDto;

	
	
	
	// 일반회원 로그인
	@RequestMapping(value = "/LoginForm", method = RequestMethod.GET)
	public String MemberForm(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/LoginForm";
	}

	@RequestMapping(value = "/LoginForm", method = RequestMethod.POST)
	public String MemberFormLogin(HttpSession session, @ModelAttribute("login") MemberDTO memberDto) {

		int result = memberService.Login(memberDto, session);
		System.out.println(result);
		if (result == 2) {
			return "index";
		} else if (result == 1) {
			return "template/member/LoginForm";
		} else {
			return "template/member/LoginForm";
		}
	}

	@RequestMapping(value = "/CorLoginForm", method = RequestMethod.POST)
	public String CorPorFormLogin(HttpSession session, @ModelAttribute("corlogin") CorporDTO corporDto) {

		int result = memberService.CorLogin(corporDto, session);
		System.out.println(result);
		if (result == 2) {
			return "index";
		} else if (result == 1) {
			return "template/member/LoginForm";
		} else {
			return "template/member/LoginForm";
		}
	}

	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String MemberLogout(HttpSession session) {
		System.out.println("로그아웃");
		session.invalidate();
		return "index";

	}

	// 회원가입 약관동의 페이지 이동
	@RequestMapping(value = "/Register", method = RequestMethod.GET)
	public String Register(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/agreement";
	}

	// 일반회원가입 페이지 이동
	@RequestMapping(value = "/MemberShip", method = RequestMethod.GET)
	public String MemberShip(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/membership";
	}

	@RequestMapping(value = "/MemberShip", method = RequestMethod.POST)
	public String member(@ModelAttribute("register") MemberDTO dto) {
		
		System.out.println(dto.getMemberId());
		int result = memberService.setRegister(dto);

	if (result > 0) {
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

		if (result > 0) {
			return "index";
		} else {
			return "template/member/corporation";
		}
	}

	// 아이디 찾기
	@RequestMapping(value = "/IdFind", method = RequestMethod.GET)
	public String IdFind(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/idfind";
	}

	//일반회원 아이디
	@ResponseBody
	@RequestMapping(value = "/IdFind", method = RequestMethod.POST)
	public HashMap<String, String> idfind(@RequestParam HashMap<String, String> param) throws Exception {
		int con = 0;

		memberDto.setMemberName(param.get("memberName"));
		memberDto.setMemberEmail(param.get("memberEmail"));
		MemberDTO result = memberDao.memIdFind(memberDto);
		HashMap<String, String> hashmap = new HashMap<String, String>();
		if (result == null) {
			System.out.println("1234");
			con = 0;
			hashmap.put("sc" + con, "아이디 또는 메일을 다시 확인해 주세요.");
		} else if (result != null) {
			String id = result.getMemberId();
			String mail = result.getMemberEmail();
			String name = result.getMemberName();
			if (id != null) {
				emailDto.setContent("아이디는" + id + "입니다.");
				emailDto.setSubject(name + "님이 찾으신 아이디 입니다.");
				emailDto.setReceiver(mail);
				con = memberService.SendEmail(emailDto);

				if (con == 2) {
					hashmap.put("sc" + con, "메일이 성공적으로 보내졌습니다");
				} else {
					hashmap.put("sc" + con, "메일을 다시 확인해 주세요.");
				}
			} 
		}
		return hashmap;
	}
	
	//일반회원 비밀번호
	@ResponseBody
	@RequestMapping(value = "/PwFind", method = RequestMethod.POST)
	public HashMap<String, String> Pwfind(@RequestParam HashMap<String, String> param) throws Exception {
		
		System.out.println(param.get("memberId"));
		int con = 0;
		memberDto.setMemberId(param.get("memberId"));
		memberDto.setMemberName(param.get("memberName"));
		memberDto.setMemberEmail(param.get("memberEmail"));
		MemberDTO result = memberDao.memPwFind(memberDto);
		
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		if (result == null) {
			System.out.println("1234");
			con = 0;
			hashmap.put("sc" + con, "아이디 또는 메일을 다시 확인해 주세요.");
		} else if (result != null) {
			String id = result.getMemberId();
			String pw = result.getMemberPw();
			String mail = result.getMemberEmail();
			String name = result.getMemberName();
			if (pw != null) {
				emailDto.setContent("아이디 : "+id+"의 비밀번호는 : "+pw+" 입니다.");
				emailDto.setSubject(name + "님이 찾으신 아이디 입니다.");
				emailDto.setReceiver(mail);
				con = memberService.SendEmail(emailDto);

				if (con == 2) {
					hashmap.put("sc" + con, "메일이 성공적으로 보내졌습니다");
				} else {
					hashmap.put("sc" + con, "메일을 다시 확인해 주세요.");
				}
			} 
		}
		return hashmap;
	}
	
	//기업회원 아이디
	@ResponseBody
	@RequestMapping(value = "/corIdFind", method = RequestMethod.POST)
	public HashMap<String, String> corIdFind(@RequestParam HashMap<String, String> param) throws Exception {
		int con = 0;
		System.out.println(param.get("corporName")+"ddddddddd");
		System.out.println(param.get("corporEmail")+"ddddddddd");
		corporDto.setCorporName(param.get("corporName"));
		corporDto.setCorporEmail(param.get("corporEmail"));
		CorporDTO result = memberDao.corIdFind(corporDto);
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		if (result == null) {
			con = 0;
			hashmap.put("sc" + con, "아이디 또는 메일을 다시 확인해 주세요.");
			return hashmap;
		} else  {
			String id = result.getCorporId();
			String mail = result.getCorporEmail();
			String name = result.getCorporName();
			if (id != null) {
				emailDto.setContent("아이디는" + id + "입니다.");
				emailDto.setSubject(name + "님이 찾으신 아이디 입니다.");
				emailDto.setReceiver(mail);
				con = memberService.SendEmail(emailDto);
				return hashmap;
				
			}
			return hashmap;
		}
		
	}
	
	//기업회원 비밀번호
	@ResponseBody
	@RequestMapping(value = "/coporPwfind", method = RequestMethod.POST)
	public HashMap<String, String> coporPwfind(@RequestParam HashMap<String, String> param) throws Exception {
		
		System.out.println(param.get("corporId"));
		int con = 0;
		corporDto.setCorporId(param.get("corporId"));
		corporDto.setCorporName(param.get("corporName"));
		corporDto.setCorporEmail(param.get("corporEmail"));
		CorporDTO result = memberDao.corPwFind(corporDto);
		
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		if (result == null) {
			System.out.println("1234");
			con = 0;
			hashmap.put("sc" + con, "아이디 또는 메일을 다시 확인해 주세요.");
		} else if (result != null) {
			String id = result.getCorporId();
			String pw = result.getCorporPw();
			String mail = result.getCorporEmail();
			String name = result.getCorporName();
			if (pw != null) {
				emailDto.setContent("아이디 : "+id+"의 비밀번호는 : "+pw+" 입니다.");
				emailDto.setSubject(name + "님이 찾으신 아이디 입니다.");
				emailDto.setReceiver(mail);
				con = memberService.SendEmail(emailDto);

				if (con == 2) {
					hashmap.put("sc" + con, "메일이 성공적으로 보내졌습니다");
				} else {
					hashmap.put("sc" + con, "메일을 다시 확인해 주세요.");
				}
			} 
		}
		return hashmap;
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/PwFind", method = RequestMethod.GET)
	public String PwFind(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/pwfind";
	}

	// 마이페이지 인덱스 페이지이동
	@RequestMapping(value = "/MyPage", method = RequestMethod.GET)
	public String MypageIndex(HttpServletRequest req, Model model) throws Exception {
		
		String menu = req.getParameter("menu");
		
		model.addAttribute("menu", menu);
		
		HttpSession session = req.getSession();
		memberDto = (MemberDTO)session.getAttribute("login");
		
		//게시판 목록 보여주기
	
		
		ArrayList<InquiryDTO> page = new ArrayList<InquiryDTO>();
		page = (ArrayList<InquiryDTO>) memberService.writeList(req);
		
		
//		pagingDto.setNumberOfRecords();
		PagingDTO pDto = memberService.makePage(req);
		model.addAttribute("page", page);
		model.addAttribute("page1", pDto);
		return "template/member/mypageIndex";
	}

	// 일반회원 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public HashMap<String, String> checkId(@RequestParam HashMap<String, Object> param) {

		HashMap<String, String> hashmap = new HashMap<String, String>();
		// your logic
		int result = memberDao.IdCheck(String.valueOf(param.get("memberId")));
		if (result > 0) {
			hashmap.put("result", "중복된 아이디 입니다.");
		} else {
			hashmap.put("result", "중복되지 않은 아이디 입니다.");
		}

		return hashmap;
	}

	// 기업회원 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "/coridcheck", method = RequestMethod.POST)
	public HashMap<String, String> corCheckId(@RequestParam HashMap<String, Object> param) {
		HashMap<String, String> hashmap = new HashMap<String, String>();
		int result = memberDao.CorIdCheck(String.valueOf(param.get("corporId")));
		if (result > 0) {
			hashmap.put("result", "중복된 아이디 입니다.");
		} else {
			hashmap.put("result", "중복되지 않은 아이디 입니다.");
		}
		return hashmap;
	}

	// 일반회원 내 정보 수정 비밀번호 페이지
	@RequestMapping(value = "/myPageCon", method = RequestMethod.GET)
	public String myPageCon(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/myPageCon";
	}
	
	// 일반회원 내정보수정 페이지 
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/myPage";
	}
	
	// 일반회원 내정보수정
	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public String myPageRe(@ModelAttribute("myPageRevise") MemberDTO dto) {
		int result = memberDao.myPageRe(dto);
		System.out.println(dto.getMemberId());
		System.out.println(dto.getMemberAddr());
		System.out.println(dto.getMemberPw());
		System.out.println(dto.getInteRest());
		System.out.println(dto.getMemberPhone());
		System.out.println(dto.getMemberName());
		if (result > 0) {
			return "index";
		} else {
			return "template/member/membership";
		}
	}
	
	//1:1문의등록 페이지이동
	@RequestMapping(value = "/InquiryAdd", method = RequestMethod.GET)
	public String InquiryAdd(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/inquiryAdd";
	}
	
	//1:1문의등록
	@RequestMapping(value = "/InquiryAdd", method = RequestMethod.POST)
	public String inquiryAdd(@ModelAttribute("inquiry") InquiryDTO dto) {
		String inDate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
		dto.setInquiryDate(inDate);
		dto.setInquiryNum(1);
		
		System.out.println(dto.getInquiryNum());
		
		int result = memberDao.inquiryAdd(dto);
		if (result > 0) {
			return "redirect:MyPage";
			} else {
				return "template/member/inquiryAdd";
			}
	}
	
	//1:1문의상세 페이지이동
	@RequestMapping(value = "/InquiryCon", method = RequestMethod.GET)
	public String InquiryCon(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		int num = Integer.parseInt(req.getParameter("num"));
		InquiryDTO inquiryDto = memberDao.inquiryCon(num);
		model.addAttribute("menu", menu);
		
		model.addAttribute("inquiryDto", inquiryDto);
		
		return "template/member/InquiryCon";
	}
	
	//관리자 mypage이동
	@RequestMapping(value = "/mypageIndexAdmin", method = RequestMethod.GET)
	public String mypageIndexAdmin(HttpServletRequest req, Model model) throws Exception {
		
		String menu = req.getParameter("menu");
		
		model.addAttribute("menu", menu);
		
		HttpSession session = req.getSession();
		memberDto = (MemberDTO)session.getAttribute("login");
		
		//게시판 목록 보여주기
		
		ArrayList<InquiryDTO> page = new ArrayList<InquiryDTO>();
		page = (ArrayList<InquiryDTO>) memberService.writeList3(req);
		
//		pagingDto.setNumberOfRecords();
		PagingDTO pDto = memberService.makePage3(req);
		model.addAttribute("page", page);
		model.addAttribute("page1", pDto);
		return "template/member/mypageIndexAdmin";
	}
	
	//1:1문의상세 페이지이동 관리자
	@RequestMapping(value = "/InquiryConAdmin", method = RequestMethod.GET)
	public String InquiryConAdmin(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		int num = Integer.parseInt(req.getParameter("num"));
		
		InquiryDTO inquiryDto = memberDao.inquiryCon(num);
		model.addAttribute("menu", menu);
		
		model.addAttribute("inquiryDto", inquiryDto);
		
		return "template/member/InquiryConAdmin";
	}
	
	//1:1문의 답변등록
	@RequestMapping(value = "/InquiryConAdmin", method = RequestMethod.POST)
	public String InquiryRipply(@ModelAttribute("ripply_frm") InquiryDTO dto) {
		dto.setInquiryReplyNum(1);
		System.out.println(dto.getInquiryNum());
		
		int result = memberDao.ripplyadd(dto);
		if (result > 0) {
			return "redirect:mypageIndexAdmin";
			} else {
				return "template/member/InquiryConAdmin";
			}
	}
	// 마이페이지 인덱스 페이지이동(기업)
	@RequestMapping(value = "/corpageIndex", method = RequestMethod.GET)
	public String corpageIndex(HttpServletRequest req, Model model) throws Exception {
		
		String menu = req.getParameter("menu");
		
		model.addAttribute("menu", menu);
		
		HttpSession session = req.getSession();
		corporDto = (CorporDTO)session.getAttribute("corlogin");
		System.out.println(corporDto.getCorporId()+"아이디");
		
		//게시판 목록 보여주기
	
		
		ArrayList<InquiryDTO> page = new ArrayList<InquiryDTO>();
		page = (ArrayList<InquiryDTO>) memberService.writeList4(req);
		
		
//		pagingDto.setNumberOfRecords();
		PagingDTO pDto = memberService.makePage4(req);
		model.addAttribute("page", page);
		model.addAttribute("page1", pDto);
		return "template/corporation/corpageIndex";
	}
	
	
	// 일반회원 내정보수정 페이지 
	@RequestMapping(value = "/corMyPage", method = RequestMethod.GET)
	public String corMyPage(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/corMyPage";
	}
	
	// 기업회원 사업등록 페이지 
	@RequestMapping(value = "/coporationAdd", method = RequestMethod.GET)
	public String coporationAdd(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/corporation/coporationAdd";
	}
}
