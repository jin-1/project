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
import Model.TrainDAO;
import Model.TrainDTO;
import Model.TrainRegistrationDTO;
import Model.TrainStatinDTO;
import service.TrainService;

@Controller
public class TrainController {

	@Autowired
	TrainService trainService;
	@Autowired
	TrainDAO traindao;

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
	public String TrainTicketMainPost( Model model , @ModelAttribute("CustomerTicket") CustomerTicketDTO customerTicketDTO) {
		
			List<TrainDTO> listTrain = trainService.getCustomerTicket(customerTicketDTO);
			
				if(listTrain != null) {

					model.addAttribute("listTrain",listTrain);
					model.addAttribute("custom", customerTicketDTO);
					return "template/train/TrainTicketList";
					
			} else {
				return "template/train/TrainTicketMain";
			}
			

	}
	
	@RequestMapping(value = "/Ticketing", method = RequestMethod.POST)
	public String Ticketing(HttpSession session, HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		String[] data = req.getParameterValues("data");
		
		
		List<TrainRegistrationDTO> seat = trainService.getTrainInfo(data);

		if(session.getAttribute("login")==null) {
			return "redirect:LoginForm";
		}
		else {
			session.setAttribute("trainTicket", data);
			model.addAttribute("menu", menu);
			model.addAttribute("img", img);
			model.addAttribute("seat", seat);
			return "template/train/TrainTicketReservation";
		}
	}
	
	@RequestMapping(value = "/trainPayment", method = RequestMethod.POST)
	public String trainPayment(HttpSession session, HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		String seat[] = req.getParameterValues("seat");
	
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		model.addAttribute("seat", seat);
		return "template/train/TrainTicketPayment";
	}
	
	
	@RequestMapping(value = "/trainTicketing", method = RequestMethod.POST)
	public String trainPaymentPost(HttpSession session, Model model , @ModelAttribute("trainPayment") TrainRegistrationDTO trainRegistrationDTO) {

			traindao.insertTicketing(trainRegistrationDTO);
			
			
				return "template/train/TrainTicketing";
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