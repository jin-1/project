
package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Model.AccountDTO;
import Model.AccountDetailDTO;
import Model.CorporDTO;
import Model.EmailDTO;
import Model.InquiryDTO;
import Model.MemberDAO;
import Model.MemberDTO;
import Model.PagingDTO;
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
		} else if (result == 3){
			return "template/admin/adminIndex";
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

	// 일반회원 아이디
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

	// 일반회원 비밀번호
	@ResponseBody
	@RequestMapping(value = "/PwFind", method = RequestMethod.POST)
	public HashMap<String, String> Pwfind(@RequestParam HashMap<String, String> param) throws Exception {
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
				emailDto.setContent(name + "님의" + id + "는 " + pw + "입니다.");
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

	// 기업회원 아이디
	@ResponseBody
	@RequestMapping(value = "/corIdFind", method = RequestMethod.POST)
	public HashMap<String, String> corIdFind(@RequestParam HashMap<String, String> param) throws Exception {
		int con = 0;
		System.out.println(param.get("corporName") + "ddddddddd");
		System.out.println(param.get("corporEmail") + "ddddddddd");
		corporDto.setCorporName(param.get("corporName"));
		corporDto.setCorporEmail(param.get("corporEmail"));
		CorporDTO result = memberDao.corIdFind(corporDto);

		HashMap<String, String> hashmap = new HashMap<String, String>();
		if (result == null) {
			con = 0;
			hashmap.put("sc" + con, "아이디 또는 메일을 다시 확인해 주세요.");
			return hashmap;
		} else {
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

	// 기업회원 비밀번호
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
				emailDto.setContent("아이디 : " + id + "의 비밀번호는 : " + pw + " 입니다.");
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
		memberDto = (MemberDTO) session.getAttribute("login");

		// 게시판 목록 보여주기

		ArrayList<InquiryDTO> page = new ArrayList<InquiryDTO>();
		page = (ArrayList<InquiryDTO>) memberService.writeList(req);

		// pagingDto.setNumberOfRecords();
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
	
	// 일반회원 회원 탈퇴
	@RequestMapping(value = "/myPageCon2", method = RequestMethod.GET)
	public String myPageCon2(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/myPageCon2";
	}
	
	// 일반회원 회원 탈퇴
	@RequestMapping(value = "/myPageCon2", method = RequestMethod.POST)
	public String myPageCon2(HttpSession session, @ModelAttribute("mem_del") MemberDTO dto) {
		System.out.println(dto.getMemberId());
		int result = memberDao.memberDel(dto);
		if (result > 0) {
			session.invalidate();
			return "index";
		} else {
			return "template/member/myPageCon2";
		}
	}


	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage1(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String userId = req.getParameter("userId");
		MemberDTO memberdto = memberDao.selectOneMember(userId);
		model.addAttribute("menu", menu);
		model.addAttribute("memberdto", memberdto);

		return "template/member/myPage";
	}
	// 일반회원 내정보수정
	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public String myPageRe(@ModelAttribute("myPageRevise") MemberDTO dto) {
		int result = memberDao.myPageRe(dto);

		if (result > 0) {
			return "index";
		} else {
			return "template/member/membership";
		}
	}

	// 1:1문의등록 페이지이동
	@RequestMapping(value = "/InquiryAdd", method = RequestMethod.GET)
	public String InquiryAdd(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/inquiryAdd";
	}

	// 1:1문의등록
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

	// 1:1문의상세 페이지이동
	@RequestMapping(value = "/InquiryCon", method = RequestMethod.GET)
	public String InquiryCon(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		int num = Integer.parseInt(req.getParameter("num"));
		InquiryDTO inquiryDto = memberDao.inquiryCon(num);
		model.addAttribute("menu", menu);

		model.addAttribute("inquiryDto", inquiryDto);

		return "template/member/InquiryCon";
	}

	// 관리자 mypage이동
	@RequestMapping(value = "/inquiryAdmin", method = RequestMethod.GET)
	public String mypageIndexAdmin(HttpServletRequest req, Model model) throws Exception {

		String menu = req.getParameter("menu");

		model.addAttribute("menu", menu);

		HttpSession session = req.getSession();
		memberDto = (MemberDTO) session.getAttribute("login");

		// 게시판 목록 보여주기

		ArrayList<InquiryDTO> page = new ArrayList<InquiryDTO>();
		page = (ArrayList<InquiryDTO>) memberService.writeList3(req);

		// pagingDto.setNumberOfRecords();
		PagingDTO pDto = memberService.makePage3(req);
		model.addAttribute("page", page);
		model.addAttribute("page1", pDto);
		return "template/admin/inquiryAdmin";
	}
	
	// 관리자 mypage이동
	@RequestMapping(value = "/corInquiryAdmin", method = RequestMethod.GET)
	public String corInquiryAdmin(HttpServletRequest req, Model model) throws Exception {

		String menu = req.getParameter("menu");

		model.addAttribute("menu", menu);

		HttpSession session = req.getSession();
		memberDto = (MemberDTO) session.getAttribute("login");

		// 게시판 목록 보여주기

		ArrayList<InquiryDTO> page = new ArrayList<InquiryDTO>();
		page = (ArrayList<InquiryDTO>) memberService.writeList5(req);

		// pagingDto.setNumberOfRecords();
		PagingDTO pDto = memberService.makePage5(req);
		model.addAttribute("page", page);
		model.addAttribute("page1", pDto);
		return "template/admin/corInquiryAdmin";
	}

	// 1:1문의상세 페이지이동 관리자
	@RequestMapping(value = "/InquiryConAdmin", method = RequestMethod.GET)
	public String InquiryConAdmin(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		int num = Integer.parseInt(req.getParameter("num"));

		InquiryDTO inquiryDto = memberDao.inquiryCon(num);
		model.addAttribute("menu", menu);

		model.addAttribute("inquiryDto", inquiryDto);

		return "template/admin/InquiryConAdmin";
	}

	// 1:1문의 답변등록 관리자
	@RequestMapping(value = "/InquiryConAdmin", method = RequestMethod.POST)
	public String InquiryRipply(@ModelAttribute("ripply_frm") InquiryDTO dto) {
		dto.setInquiryReplyNum(1);
		System.out.println(dto.getInquiryNum());

		int result = memberDao.ripplyadd(dto);
		if (result > 0) {
			return "redirect:inquiryAdmin";
		} else {
			return "template/admin/InquiryConAdmin";
		}
	}
	
	// 기업1:1문의상세 페이지이동 관리자
	@RequestMapping(value = "/corInquiryConAdmin", method = RequestMethod.GET)
	public String corInquiryConAdmin(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		int num = Integer.parseInt(req.getParameter("num"));

		InquiryDTO inquiryDto = memberDao.corInquiryConAdmin(num);
		model.addAttribute("menu", menu);

		model.addAttribute("inquiryDto", inquiryDto);

		return "template/admin/corInquiryConAdmin";
	}
	
	// 기업1:1문의 답변등록 관리자
	@RequestMapping(value = "/corInquiryConAdmin", method = RequestMethod.POST)
	public String corInquiryConAdmin(@ModelAttribute("ripplye_conten1") InquiryDTO dto) {
		dto.setInquiryReplyNum(1);
		System.out.println(dto.getInquiryNum());

		int result = memberDao.corRipplyadd(dto);
		if (result > 0) {
			return "redirect:corInquiryAdmin";
		} else {
			return "template/admin/corInquiryConAdmin";
		}
	}
	


	// 마이페이지 인덱스 페이지이동(기업)
	@RequestMapping(value = "/corIndex", method = RequestMethod.GET)
	public String corpageIndex(HttpServletRequest req, Model model) throws Exception {

		String menu = req.getParameter("menu");

		model.addAttribute("menu", menu);

		HttpSession session = req.getSession();
		corporDto = (CorporDTO) session.getAttribute("corlogin");
		System.out.println(corporDto.getCorporId() + "아이디");

		// 게시판 목록 보여주기

		ArrayList<InquiryDTO> page = new ArrayList<InquiryDTO>();
		page = (ArrayList<InquiryDTO>) memberService.writeList4(req);

		// pagingDto.setNumberOfRecords();
		PagingDTO pDto = memberService.makePage4(req);
		model.addAttribute("page", page);
		model.addAttribute("page1", pDto);
		return "template/corpor/corIndex";
	}
	
	
	@RequestMapping(value = "/corPageCon", method = RequestMethod.GET)
	public String corPageCon(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/corpor/corPageCon";
	}
	

	// 기업회원 내정보수정 페이지
	@RequestMapping(value = "/corMyPage", method = RequestMethod.GET)
	public String corMyPage(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/corpor/corMyPage";
		
		
	}
	
	// 기업회원 내정보수정
	@RequestMapping(value = "/corMyPage", method = RequestMethod.POST)
	public String corPageCon(@ModelAttribute("corporPage") CorporDTO dto) {
		int result = memberDao.corPageRe(dto);
		if (result > 0) {
			return "index";
		} else {
			return "template/corpor/corMyPage";
		}
	}

	// 기업회원 사업등록 페이지
	@RequestMapping(value = "/TourAdd1", method = RequestMethod.GET)
	public String coporationAdd(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/tour/TourAdd";
	}
	
	// 기업 1:1문의등록 페이지이동
	@RequestMapping(value = "/corinquiryAdd", method = RequestMethod.GET)
	public String corinquiryAdd(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/corpor/corinquiryAdd";
	}

	// 기업 1:1문의등록
	@RequestMapping(value = "/corinquiryAdd", method = RequestMethod.POST)
	public String corinquiryAdd(@ModelAttribute("corInquiry") InquiryDTO dto) {
		String inDate = new java.text.SimpleDateFormat("yy/MM/dd").format(new java.util.Date());
		dto.setInquiryDate(inDate);

		System.out.println(dto.getInquiryDate());

		int result = memberDao.corInquiryAdd(dto);
		if (result > 0) {
			return "redirect:corIndex";
		} else {
			return "template/corpor/corinquiryAdd";
		}
	}
	
	// 기업 1:1문의상세 페이지이동
	@RequestMapping(value = "/corInquiryCon", method = RequestMethod.GET)
	public String corInquiryCon(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		int num = Integer.parseInt(req.getParameter("num"));
		InquiryDTO inquiryDto = memberDao.corInquiryCon(num);
		model.addAttribute("menu", menu);

		model.addAttribute("inquiryDto", inquiryDto);

		return "template/corpor/corInquiryCon";
	}
	



	@RequestMapping(value = "/MyBudget", method = RequestMethod.GET)
	public String MyBudget(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		HttpSession session = req.getSession();
		List<AccountDTO> list = memberDao.selectAccount(session);
		model.addAttribute("list", list);
		model.addAttribute("menu", menu);

		return "template/member/MyBudget";
	}

	@RequestMapping(value = "/travelAdd", method = RequestMethod.GET)
	public String travelAdd(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);

		return "template/member/MyBudgetAdd";
	}

	@RequestMapping(value = "/travelAdd", method = RequestMethod.POST)
	public String travelAddPost(HttpServletRequest req, Model model, @ModelAttribute("account") AccountDTO actdto) {
		String menu = req.getParameter("menu");
		HttpSession session = req.getSession();
		model.addAttribute("menu", menu);
		memberDao.insertAccount(session, actdto);
		return "template/member/MyBudgetAdd";
	}

	@RequestMapping(value = "/budgetDD", method = RequestMethod.POST)
	public String budgetDD(HttpServletRequest req, Model model, @ModelAttribute("budgetDD") AccountDetailDTO actdto) {
		String menu = req.getParameter("menu");
		HttpSession session = req.getSession();
		MemberDTO memberDto = (MemberDTO) session.getAttribute("login");
		model.addAttribute("menu", menu);
		System.out.println(actdto.getBudgetCode());
		actdto.setMemberId(memberDto.getMemberId());
		memberDao.insertAccountDetail(actdto);
		return "redirect:budgetD?menu=Budget&budgeCode=" + actdto.getBudgetCode();
	}

	@RequestMapping(value = "/budgetD", method = RequestMethod.GET)
	public String budgetD(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String budgeCode = req.getParameter("budgeCode");
		HttpSession session = req.getSession();
		List<AccountDTO> acDto = memberDao.selectAccounts(budgeCode);
		model.addAttribute("menu", menu);
		model.addAttribute("acDto", acDto);
		model.addAttribute("budgeCode", budgeCode);
		return "template/member/MyBudgetView";
	}
	//포인트 차감
	@ResponseBody
	@RequestMapping(value = "/pointdown", method = RequestMethod.POST)
	public HashMap<String, String> pointdown(HttpSession session) {

		memberDao.delepoint(session);
		
		HashMap<String, String> s = new HashMap<String, String>();
		s.put("1", "포인트가 차감되었습니다..");
		return s;
	}
	
	@RequestMapping(value = "/MemberDelete", method = RequestMethod.POST)
	public String MemberDelete(HttpServletRequest req) {
		String userId =req.getParameter("userId");
		
		memberDao.deleteMember(userId);
		return "redirect:MemberAll";
	}
	@RequestMapping(value = "/MemberAll", method = RequestMethod.GET)
	public String MemerAll(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		List<MemberDTO> list = memberDao.MemberAll();
		
		model.addAttribute("menu", menu);
		model.addAttribute("list", list);
		
		return "template/admin/memberManager";
	}
	
	@RequestMapping(value="/CoperAll", method=RequestMethod.GET)
	public String CoperAll(HttpServletRequest req, Model model) {
	
		String menu = req.getParameter("menu");
		List<CorporDTO> list = memberDao.CoperAll();

		
		model.addAttribute("menu", menu);
		model.addAttribute("list", list);
		
		return "template/admin/CoperManager";
	}
}
