package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TourController {
	@RequestMapping(value = "/TourMain", method = RequestMethod.GET)
	public String tourMain(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		return "template/menu/TourMain";
	}

	@RequestMapping(value = "/TourResult", method = RequestMethod.POST)
	public String tourResult(HttpServletRequest req, Model model) {
		String menu = req.getParameter("menu");
		model.addAttribute("menu", menu);
		return "template/menu/TourResult";
	}
}
