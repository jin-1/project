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

import Model.MemberDAO;
import Model.MemberDTO;
import Model.TourDAO;
import Model.TourDTO;
import Model.TrainDAO;
import Model.TrainDTO;
import Model.TrainStationTimeDTO;
import service.TourService;


@Controller


public class AdminController {
	
	@Autowired
	TrainDAO traindao;
	@Autowired
	private TourDAO tourDAO;
	@Autowired
	private TourService tourService;
	
	
	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminIndex(HttpServletRequest req, Model model) {
	
		return "template/admin/adminIndex";
	}
	@RequestMapping(value = "/adminRent", method = RequestMethod.GET)
	public String adminRent(HttpServletRequest req, Model model) {
	
		return "template/admin/adminRent";
	}
	
	@RequestMapping(value = "/adminTour", method = RequestMethod.GET)
	public String viewAllForm(TourDTO dto, Model model) {
		List<TourDTO> result = tourDAO.viewAll(dto);
		
		model.addAttribute("result", result);
		return "template/admin/adminTour";
	}
	@ResponseBody
	@RequestMapping(value = "/DeleteView", method = RequestMethod.POST)
	public HashMap<String, String> searchStation(@RequestParam HashMap<String, Object> param) {
		System.out.println(param);
		int localCode = Integer.parseInt(String.valueOf(param.get("localCode")));
		int result = tourDAO.deleteTour(localCode);
		HashMap<String, String> delCode = new HashMap<String, String>();
		delCode.put("1", "삭제되었습니다");

		return delCode;
	}
	@RequestMapping(value="/ViewOne", method= RequestMethod.GET)
	public String viewOneForm(TourDTO dto, Model model, HttpServletRequest request) {
		int code = Integer.parseInt(request.getParameter("localCode"));
		dto.setLocalCode(code);
		
		TourDTO result = tourDAO.tourInfo(dto);
		model.addAttribute("result", result);
		return "template/admin/ViewOne";
	}
	@RequestMapping(value="/ViewOne", method= RequestMethod.POST)
	public String viewOne(@ModelAttribute("viewOne")TourDTO dto, Model model, HttpServletRequest request) {
		int result = tourService.viewOne(dto, request);
		if(result > 0) {
			return "redirect:ViewAll";
		} else {
			return "template/admin/ViewOne";
		}
	}
	@RequestMapping(value="/ViewAdd", method=RequestMethod.GET)
	public String viewAddForm(Model model) {
		return "template/admin/ViewAdd";
	}
	@RequestMapping(value="/ViewAdd", method=RequestMethod.POST)
	public String viewAdd(@ModelAttribute("localAdd") TourDTO dto, HttpSession session, HttpServletRequest request) throws IOException {
		int result = tourService.setTour(dto, session, request);
		if(result > 0) {
			return "template/admin/adminTour";
		} else {
			return "template/admin/ViewAdd";
		}
	}
	
	@RequestMapping(value = "/adminTrain", method = RequestMethod.GET)
	public String adminTrain(HttpServletRequest req, Model model) {
		List<TrainDTO> train = traindao.selectTrainAll();
		model.addAttribute("train", train);
		
		return "template/admin/adminTrain";
	}
	@RequestMapping(value = "/adminTrainD", method = RequestMethod.GET)
	public String adminTrainD(HttpServletRequest req, Model model) {
		String trainCode = req.getParameter("trainCode");
	
		List<TrainStationTimeDTO> time = traindao.selectTrainTimeAll(trainCode);

		model.addAttribute("time", time);

		return "template/admin/adminTrainD";
	}
	@RequestMapping(value = "/adminTrain", method = RequestMethod.POST)
	public String trainAdd(@ModelAttribute("trainAdd") TrainDTO trainDTO, @RequestParam("temp") String[] d) {
		String serviceDate ="";
		for(int i =0;i<d.length;i++) {
			serviceDate+=d[i]+",";
		}
		trainDTO.setServiceDate(serviceDate);
		traindao.insertTrain(trainDTO);
		return "redirect:adminTrain";
	}
	@RequestMapping(value = "/adminTrainD", method = RequestMethod.POST)
	public String timeAdd(@ModelAttribute("timeAdd") TrainStationTimeDTO trainStationTimeDTO, @RequestParam("startTrain") String d) {
		System.out.println(trainStationTimeDTO.getTime());
		
		traindao.insertTime(trainStationTimeDTO,d);
		return "redirect:adminTrainD?trainCode="+trainStationTimeDTO.getTrainCode();
	}
}
