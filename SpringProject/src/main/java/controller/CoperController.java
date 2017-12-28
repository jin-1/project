package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Model.CoperDAO;
import Model.CoperDTO;
import Model.MemberDAO;
import service.Paging;

@Controller
public class CoperController {
	@Autowired
	CoperDAO coperDao;
	MemberDAO memberDao;

	@RequestMapping(value="/CoperDelete", method=RequestMethod.POST)
	public String CoperDelete(HttpServletRequest req) {
		String userId =req.getParameter("userId");
		
		coperDao.deleteCoper(userId);
		return "redirect:CoperAll";
	}
	
	@RequestMapping(value="/CoperAll", method=RequestMethod.GET)
	public String CoperAll(HttpServletRequest req, Model model) {
		int currentPageNo = 1;
		int maxPost = 10;
		if(req.getParameter("page") !=null)
			currentPageNo = Integer.parseInt(req.getParameter("page"));
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1)*paging.getmaxPost();
		
		String menu = req.getParameter("menu");
		List<CoperDTO> list = coperDao.CoperAll(offset, paging.getmaxPost());
		paging.setNumberOfRecords(coperDao.writeGetCount());
		
		
		model.addAttribute("menu", menu);
		model.addAttribute("list", list);
		
		return "template/Corporation/CoperManager";
	}
		
}
