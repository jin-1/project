package controller;

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

import Model.MemberDAO;
import Model.MemberDTO;
import Model.TrainDAO;
import Model.TrainDTO;
import Model.TrainStationTimeDTO;


@Controller


public class AdminController {
	
	@Autowired
	TrainDAO traindao;
	
	
	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminIndex(HttpServletRequest req, Model model) {
	
		return "template/admin/adminIndex";
	}
	@RequestMapping(value = "/adminRent", method = RequestMethod.GET)
	public String adminRent(HttpServletRequest req, Model model) {
	
		return "template/admin/adminRent";
	}
	@RequestMapping(value = "/adminTour", method = RequestMethod.GET)
	public String adminTour(HttpServletRequest req, Model model) {
	
		return "template/admin/adminTour";
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
