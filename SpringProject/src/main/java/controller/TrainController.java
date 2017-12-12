package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import Model.CustomerTicketDTO;
import Model.MemberDTO;
import Model.TrainDTO;
import Model.TrainStatinDTO;
import service.TrainService;

@Controller
public class TrainController {

	@Autowired
	TrainService trainService;

	@RequestMapping(value = "/TrainInfoKTX", method = RequestMethod.GET)
	public String traininfo(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		return "template/train/TrainInfoKTX";
	}

	@RequestMapping(value = "/TrainInfoMain", method = RequestMethod.GET)
	public String TrainInfoMain(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		return "template/train/TrainInfoMain";
	}

	@RequestMapping(value = "/TrainTicketMain", method = RequestMethod.GET)
	public String TrainTicketMain(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		return "template/train/TrainTicketMain";
	}
	@RequestMapping(value = "/TrainTicketMain", method = RequestMethod.POST)
	public String TrainTicketMainPost(@ModelAttribute("CustomerTicket") CustomerTicketDTO customerTicketDTO) {
		
			List<TrainDTO> listTrain = trainService.getCustomerTicket(customerTicketDTO);
			
			if(listTrain != null) {
				return "index";
			} else {
				return "template/train/TrainTicketMain";
			}
			

	}

	@ResponseBody
	@RequestMapping(value = "/startTrain", method = RequestMethod.POST)
	public HashMap<String, String> searchStation(@RequestParam HashMap<String, Object> param) {

		String stationName = (String) param.get("startTrain") + "%";

		HashMap<String, String> station = new HashMap<String, String>();
		station = trainService.getSearchTrain(stationName);

		return station;
	}

}