package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Model.CommentDTO;
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
	CommentDTO commentDTO;
	
	@RequestMapping(value="/TourMain", method = RequestMethod.GET)
	public String tourMain(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		model.addAttribute("tourDTO", new TourDTO());
		return "template/tour/TourMain";
	}
	
	@RequestMapping(value="/TourResult", method = RequestMethod.GET)
	public String tourResult(HttpServletRequest req, Model model, TourDTO dto) {
		String one = req.getParameter("SearchArea1"); //ï¿½Ãµï¿½ ï¿½Þ¾Æ¿ï¿½ï¿½ï¿½
		String two = req.getParameter("SearchArea2"); //ï¿½Ã±ï¿½ï¿½ï¿½ ï¿½Þ¾Æ¿ï¿½ï¿½ï¿½
		String[] cateArr = req.getParameterValues("category"); //Ä«ï¿½×°ï¿½ ï¿½Þ¾Æ¿ï¿½ï¿½ï¿½
		
		String cateName[] = {"ÇÑ½Ä", "Áß½Ä", "ÀÏ½Ä", "ºÐ½Ä", "È£ÅÚ", "¸ðÅÚ", "ÂòÁú¹æ", "°Ô½ºÆ®ÇÏ¿ì½º", "ÀÚ¿¬", "·¹Àú", "¿ª»ç", "¹Ú¹°°ü"};
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
		
		model.addAttribute("menu", menu);
		model.addAttribute("result", result);
		return "template/tour/TourResult";
	}
	
	@RequestMapping(value="/TourInfo", method = RequestMethod.GET)
	public String tourInfo(TourDTO tourDTO, Model model, HttpServletRequest req) {
		TourDTO result = tourDAO.tourInfo(tourDTO);
		
		String code = req.getParameter("localCode");
		commentDTO.setLocalCode(code);
		
		model.addAttribute("result", result);
		return "template/tour/TourInfo";
	}
	@ResponseBody
	@RequestMapping(value = "/TourInfo", method = RequestMethod.POST)
	public HashMap<Integer, CommentDTO> slelctcomment(HttpSession session,@RequestParam HashMap<String, Object> param) {
		String code = String.valueOf(param.get("localCode"));
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
	public HashMap<String, CommentDTO> commentInsert(HttpSession session,@RequestParam HashMap<String, Object> param) {		
		tourService.insertComment(param,session);
		HashMap<String, CommentDTO> tour = tourService.selectAllComment(String.valueOf(param.get("localCode")));
		
		return tour;
	}
	
	@RequestMapping(value="/TourAdd", method={RequestMethod.POST, RequestMethod.GET})
	public String tourAdd(Model model) {
		return "template/tour/TourAdd";
	}
}
