package controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import Model.CommentDTO;
import Model.CorporDTO;
import Model.MemberDTO;
import Model.TourDAO;
import Model.TourDTO;
import service.TourService;

@Controller
public class TourController {
	@Autowired
	private TourDAO tourDAO;
	@Autowired
	private TourService tourService;
	@Autowired
	private CommentDTO commentDTO;
	@Autowired
	private CorporDTO corpDTO;
	@Autowired
	private MemberDTO memberDto;
	
	@RequestMapping(value="/TourMain", method = RequestMethod.GET)
	public String tourMain(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		model.addAttribute("tourDTO", new TourDTO());
		return "template/tour/TourMain";
	}
	
	@RequestMapping(value="/TourResult", method = RequestMethod.GET)
	public String tourResult(HttpServletRequest req, Model model, TourDTO dto, HttpSession session) {
		String one = req.getParameter("SearchArea1"); //�õ� �޾ƿ���
		String two = req.getParameter("SearchArea2"); //�ñ��� �޾ƿ���
		String[] cateArr = req.getParameterValues("category"); //ī�װ� �޾ƿ���
		
		String cateName[] = {"한식", "중식", "일식", "분식", "호텔", "모텔", "찜질방", "게스트하우스", "자연", "레저", "역사", "박물관"};
		String cate = "";
		if(cateArr != null) {
			for(String s : cateArr) {
				cate += cateName[Integer.parseInt(s)] + " ";
			}
			dto.setLocalCategorySave(cate.split(" "));
		} else {
			dto.setLocalCategorySave(null);
		}
		dto.setLocalName("%"+dto.getLocalName()+"%");
		dto.setLocalAddr("%"+one+" "+two+"%");

		List<TourDTO> result = tourDAO.tourSearch(dto);
		
		dto.setLocalName(dto.getLocalName().replaceAll("%", ""));
		
		String menu = req.getParameter("menu");
		
		corpDTO = (CorporDTO) session.getAttribute("corlogin");
		if(corpDTO == null) {
			model.addAttribute("login", null);
		} else {
			model.addAttribute("login", "1");
		}
		model.addAttribute("menu", menu);
		model.addAttribute("result", result);
		return "template/tour/TourResult";
	}
	
	@RequestMapping(value="/TourInfo", method = RequestMethod.GET)
	public String tourInfo(TourDTO tourDTO, Model model, HttpServletRequest req, HttpSession session) {
		TourDTO result = tourDAO.tourInfo(tourDTO);
		
		int code = Integer.parseInt(req.getParameter("localCode"));
		commentDTO.setLocalCode(code);
		
		memberDto = (MemberDTO) session.getAttribute("login");
		if(memberDto == null) {
			model.addAttribute("login", null);
		} else {
			model.addAttribute("login", "1");
		}
		
		model.addAttribute("result", result);
//		model.addAttribute("comment", comment);
		return "template/tour/TourInfo";
	}
	@ResponseBody
	@RequestMapping(value = "/TourInfo", method = RequestMethod.POST)
	public HashMap<Integer, CommentDTO> slelctcomment(HttpSession session,@RequestParam HashMap<String, Object> param) {
		int code = Integer.parseInt(String.valueOf(param.get("localCode")));
		commentDTO.setLocalCode(code);
		
		List<CommentDTO> comment = tourDAO.tourComment(commentDTO);
		HashMap<Integer, CommentDTO> commentMap = new HashMap<Integer, CommentDTO>();
		int num = 0;
		for(CommentDTO cdto : comment) {
			commentMap.put(num++, cdto);
		}
		return commentMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/TourComment", method = RequestMethod.POST)
	public HashMap<String, CommentDTO> commentInsert(HttpSession session,@RequestParam HashMap<String, Object> param, Model model) {		
		tourService.insertComment(param,session,model);
		HashMap<String, CommentDTO> tour = tourService.selectAllComment(String.valueOf(param.get("localCode")));
		
		return tour;
	}
	
	@RequestMapping(value="/TourAdd", method=RequestMethod.GET)
	public String tourAddForm(Model model) {
		return "template/tour/TourAdd";
	}
	
	@RequestMapping(value="/TourAdd", method=RequestMethod.POST)
	public String addTour(@ModelAttribute("localAdd") TourDTO dto, HttpSession session, HttpServletRequest request) throws IOException {
		int result = tourService.setTour(dto, session, request);
		if(result > 0) {
			return "template/tour/MyTour";
		} else {
			return "template/tour/TourAdd";
		}
	}
	
	@RequestMapping(value="/MyTour", method= {RequestMethod.POST, RequestMethod.GET})
	public String myTour(TourDTO dto, Model model, HttpSession session) {
		corpDTO = (CorporDTO) session.getAttribute("corlogin");
		String corpId = corpDTO.getCorporId();
		dto.setCorpId(corpId);
		
		List<TourDTO> result = tourDAO.myTour(corpId);
		
		model.addAttribute("result", result);
		return "template/tour/MyTour";
	}
	
	@RequestMapping(value="/ModifyMyTour", method= RequestMethod.GET)
	public String modifyMyTourForm(TourDTO dto, Model model, HttpSession session, HttpServletRequest request) {
		int code = Integer.parseInt(request.getParameter("localCode"));
		dto.setLocalCode(code);
		
		TourDTO result = tourDAO.tourInfo(dto);
		/*TourDTO result = tourDAO.modifyMyTour(corpId);*/
		
		model.addAttribute("result", result);
		return "template/tour/ModifyMyTour";
	}
	
	@RequestMapping(value="/ModifyMyTour", method= RequestMethod.POST)
	public String modifyMyTour(@ModelAttribute("localAdd") TourDTO dto, HttpSession session, HttpServletRequest request) throws IOException{
		int result = tourService.resetTour(dto, session, request);
		if(result > 0) {
			return "redirect:MyTour";
		} else {
			return "template/tour/ModifyMyTour";
		}
	}
	
	@RequestMapping(value="/ViewAll", method= RequestMethod.GET)
	public String viewAllForm(TourDTO dto, Model model) {
		List<TourDTO> result = tourDAO.viewAll(dto);
		
		model.addAttribute("result", result);
		return "template/tour/ViewAll";
	}
	
	@RequestMapping(value="/DeleteView", method= RequestMethod.GET)
	////////////////////////delete할 것 
	public String deleteView(TourDTO dto, Model model) {
		List<TourDTO> result = tourDAO.viewAll(dto);
		
		model.addAttribute("result", result);
		return "template/tour/ViewAll";
	}
	
	@RequestMapping(value="/ViewOne", method= RequestMethod.GET)
	public String viewOneForm(TourDTO dto, Model model, HttpServletRequest request) {
		int code = Integer.parseInt(request.getParameter("localCode"));
		dto.setLocalCode(code);
		
		TourDTO result = tourDAO.tourInfo(dto);
		model.addAttribute("result", result);
		return "template/tour/ViewOne";
	}
	
	@RequestMapping(value="/ViewOne", method= RequestMethod.POST)
	public String viewOne(@ModelAttribute("viewOne")TourDTO dto, Model model, HttpServletRequest request) {
		int result = tourService.viewOne(dto, request);
		if(result > 0) {
			return "redirect:ViewAll";
		} else {
			return "template/tour/ViewOne";
		}
	}
}
