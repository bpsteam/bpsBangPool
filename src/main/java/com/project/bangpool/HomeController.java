package com.project.bangpool;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("home.do")
	public String home() {
		return "home";
	}
	
	@RequestMapping("about.do")
	public String about() {
		return "common/footer/about";
	}
	
	@RequestMapping("provision.do")
	public String provision() {
		return "common/footer/provision";
	}
	
	@RequestMapping("rejection.do")
	public String rejection() {
		return "common/footer/rejection";
	}
	
	@RequestMapping("responsibility.do")
	public String responsibility() {
		return "common/footer/responsibility";
	}
}
