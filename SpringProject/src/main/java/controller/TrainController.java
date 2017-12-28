package controller;

import java.text.ParseException;
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
import Model.TrainPurchaseDTO;
import Model.TrainRegistrationDTO;
import Model.TrainStatinDTO;
import service.TrainService;

@Controller
public class TrainController {

	@Autowired
	TrainService trainService;
	TrainRegistrationDTO trdto;
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
	public String TrainTicketMainPost( Model model , @ModelAttribute("CustomerTicket") CustomerTicketDTO customerTicketDTO) throws ParseException {
		
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
		System.out.println(seat[1]+" 가격");
		String[] s = (String[])session.getAttribute("trainTicket");
		s[11] = seat[1];
		session.setAttribute("trainTicket", s);
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		model.addAttribute("seat", seat);
		return "template/train/TrainTicketPayment";
	}
	
	
	@RequestMapping(value = "/trainTicketing", method = RequestMethod.POST)
	public String trainPaymentPost(HttpSession session, Model model , @ModelAttribute("trainPayment") TrainRegistrationDTO trainRegistrationDTO) {
			
			traindao.insertTicketing(trainRegistrationDTO);
			trainRegistrationDTO.setTrainRegCode("A"+trainRegistrationDTO.getTrainRegCode());
			trdto = trainRegistrationDTO;
			trainService.setPurchase(session,trdto);
			model.addAttribute("trDTO", trainRegistrationDTO);
				return "template/train/TrainTicketing";
	}

	@RequestMapping(value = "/TicketReservationChange", method = RequestMethod.GET)
	public String TicketReservationChangeGet(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		HttpSession session = req.getSession();
		List<TrainRegistrationDTO> pList = traindao.selectTrainPuchase(session);
		
		model.addAttribute("list", pList);
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		return "template/train/TicketReservationChange";
	}
	@RequestMapping(value = "/trainTicketHistory", method = RequestMethod.GET)
	public String trainHistoryGet(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		HttpSession session = req.getSession();
		List<TrainRegistrationDTO> pList = traindao.selectTrainPuchase(session);
		model.addAttribute("list", pList);
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		return "template/train/TicketingHistory";
	}
	
	@RequestMapping(value = "/TrainUsagehistory", method = RequestMethod.GET)
	public String TrainUsagehistoryGet(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		HttpSession session = req.getSession();
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		return "template/train/TrainUsagehistory";
	}
	
	@RequestMapping(value = "/TicketReservationChangeView", method = RequestMethod.GET)
	public String TicketReservationChangeViewyGet(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		String img = req.getParameter("img");
		HttpSession session = req.getSession();
		HashMap<String, Object> h = (HashMap<String, Object>) session.getAttribute("ticket");
		TrainRegistrationDTO d = (TrainRegistrationDTO) h.get("train1");
		List<TrainRegistrationDTO> list = trainService.getTrainInfo1(d);
		model.addAttribute("dto", d);
		model.addAttribute("seat", list);
		model.addAttribute("menu", menu);
		model.addAttribute("img", img);
		session.removeAttribute("ticket");
		
		return "template/train/TicketReservationChangeView";
	}
	
	@RequestMapping(value = "/trainRefundC", method = RequestMethod.POST)
	public String trainRefundC(HttpServletRequest req, Model model) {
			
			String trCode = req.getParameter("TicketCodevalue");
			System.out.println(trCode);
			traindao.updetePurchase(trCode);
			return "redirect:trainTicketHistory?menu=TRAIN&img=trainbg";
	}	
	@RequestMapping(value = "/trainSeatChange", method = RequestMethod.POST)
	public String trainSeatChange(HttpServletRequest req, Model model) {
		
		String val[] = req.getParameterValues("val");
		
		traindao.updateSeat(val);
		return "redirect:TicketReservationChange?menu=TRAIN&img=trainbg";
}

	@ResponseBody
	@RequestMapping(value = "/selectTicketing", method = RequestMethod.POST)
	public HashMap<String, TrainRegistrationDTO> selectTicketing(HttpSession session, @RequestParam HashMap<String, Object> param) {

	
		
		HashMap<String, TrainRegistrationDTO> ticketingD = new HashMap<String, TrainRegistrationDTO>();
		ticketingD = trainService.getTicketingD(param);

		return ticketingD;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectTicketing1", method = RequestMethod.POST)
	public HashMap<String, TrainRegistrationDTO> selectTicketing1(HttpSession session, @RequestParam HashMap<String, Object> param) {

	
		
		HashMap<String, TrainRegistrationDTO> ticketingD = new HashMap<String, TrainRegistrationDTO>();
		ticketingD = trainService.getTicketingD(param);
		session.setAttribute("ticket", ticketingD);
		return ticketingD;
	}
	@ResponseBody
	@RequestMapping(value = "/useSearch", method = RequestMethod.POST)
	public HashMap<String, TrainRegistrationDTO> useSearch(HttpSession session, @RequestParam HashMap<String, Object> param) {

	
		
		HashMap<String, TrainRegistrationDTO> ticketingD = new HashMap<String, TrainRegistrationDTO>();
		ticketingD = trainService.getTicketingDD(session, param);

		return ticketingD;
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