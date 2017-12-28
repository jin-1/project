package controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import Model.*;
import service.MemberService;

@Controller
public class noticeController {
	@Autowired
	MemberDAO memberDao;
	MemberDTO memberDto;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/noticeAdmin", method = RequestMethod.GET)
	public String noticeAdmin(HttpServletRequest req, Model model) throws Exception {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		HttpSession session = req.getSession();
		memberDto = (MemberDTO)session.getAttribute("login");
		
		ArrayList<NoticeDTO> page = new ArrayList<NoticeDTO>();
		
		page = (ArrayList<NoticeDTO>) memberService.writeList2(req);
		
//		pagingDto.setNumberOfRecords();
		PagingDTO pDto = memberService.makePage2(req);
		model.addAttribute("page", page);
		model.addAttribute("page1", pDto);	
		
		return "template/admin/noticeAdmin";
	}
	
	//noticeIndex 페이지 이동
	@RequestMapping(value = "/NoticeIndex", method = RequestMethod.GET)
	public String NoticeIndex(HttpServletRequest req, Model model) throws Exception {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		HttpSession session = req.getSession();
		memberDto = (MemberDTO)session.getAttribute("login");
		
		ArrayList<NoticeDTO> page = new ArrayList<NoticeDTO>();
		
		page = (ArrayList<NoticeDTO>) memberService.writeList2(req);
		
//		pagingDto.setNumberOfRecords();
		PagingDTO pDto = memberService.makePage2(req);
		model.addAttribute("page", page);
		model.addAttribute("page1", pDto);	
		
		return "template/notice/noticeIndex";
	}

	//noticeAdd페이지 이동
	@RequestMapping(value = "/noticeAdd", method = RequestMethod.GET)
	public String noticeAdd(HttpServletRequest req, Model model) {
		System.out.println("ddd");
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		
		return "template/admin/noticeAdd";
	}
	
	//공지사항 등록
	@RequestMapping(value = "/noticeAdd", method = RequestMethod.POST)
	public String inquiryAdd(@ModelAttribute("notice") NoticeDTO dto) {
		String inDate = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
		dto.setNoticeDate(inDate);
		
		int result = memberDao.noticeAdd(dto);
		if (result > 0) {
			return "redirect:noticeAdmin";
			} else {
				return "template/admin/noticeAdd";
			}
	}
	
	//1:1문의상세 페이지이동
	@RequestMapping(value = "/noticeCon", method = RequestMethod.GET)
	public String noticeCon(HttpServletRequest req, Model model) {
		
		String menu = req.getParameter("menu");
		int num = Integer.parseInt(req.getParameter("num"));
		memberDao.noticeCount(num);
		
		NoticeDTO noticeDto = memberDao.noticeCon(num);
		
		System.out.println(noticeDto.getNoticeCount()+"count");
		
		model.addAttribute("menu", menu);
		model.addAttribute("noticeDto", noticeDto);
		
		return "template/notice/noticeCon";
	}
	
	@RequestMapping(value = "/noticeDetails", method = RequestMethod.GET)
	public String noticeDetails(HttpServletRequest req, Model model) {
		
		String menu = req.getParameter("menu");
		int num = Integer.parseInt(req.getParameter("num"));
		memberDao.noticeCount(num);
		
		NoticeDTO noticeDto = memberDao.noticeCon(num);
		
		System.out.println(noticeDto.getNoticeCount()+"count");
		
		model.addAttribute("menu", menu);
		model.addAttribute("noticeDto", noticeDto);
		
		return "template/notice/noticeDetails";
	}
	
	
	
}
