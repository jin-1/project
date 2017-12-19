package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

@Controller
public class TourController {
	@Autowired
	private TourDAO tourService;
	
	@RequestMapping(value="/TourMain", method = RequestMethod.GET)
	public String tourMain(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		model.addAttribute("tourDTO", new TourDTO());
		return "template/tour/TourMain";
	}
	
	@RequestMapping(value="/TourResult", method = RequestMethod.GET)
	public String tourResult(HttpServletRequest req, Model model, TourDTO dto) {
		String one = req.getParameter("SearchArea1"); //시도 받아오기
		String two = req.getParameter("SearchArea2"); //시군구 받아오기
		String[] cateArr = req.getParameterValues("category"); //카테고리 받아오기
		
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

		List<TourDTO> result = tourService.tourSearch(dto);
		
		dto.setLocalName(dto.getLocalName().replaceAll("%", ""));
		
		String menu = req.getParameter("menu");
		
		model.addAttribute("menu", menu);
		model.addAttribute("result", result);
		return "template/tour/TourResult";
	}
	
	@RequestMapping(value="/TourInfo", method = RequestMethod.GET)
	public String tourInfo(TourDTO tourDTO, CommentDTO commentDTO, Model model, HttpServletRequest req) {
		TourDTO result = tourService.tourInfo(tourDTO);
		
		String code = req.getParameter("localCode");
		commentDTO.setLocalCode(code);
		List<CommentDTO> comment = tourService.tourComment(commentDTO);
		
		/*String newComment = req.getParameter("commentAdd");
		System.out.println(newComment);*/
		
		model.addAttribute("result", result);
		model.addAttribute("comment", comment);
		return "template/tour/TourInfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/TourInfo", method = RequestMethod.POST)
	public HashMap<String, String> searchStation(@RequestParam HashMap<String, Object> param) {
		System.out.println(param);
		//HashMap<String, String> station = new HashMap<String, String>();

		/*Integer result = sessionRepository.insertComment(param);
		model.addAttribute("result", result);*/
		return null;
	}
	
	@RequestMapping(value="/TourAdd", method=RequestMethod.GET)
	public String tourAdd(Model model) {
		return "template/tour/TourAdd";
	}
}
