package org.study.controller;

import java.util.Locale;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.study.domain.MailVO;
import org.study.service.BoardService;
import org.study.service.MailService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	
	
	@Inject
	MailService service;
	
	@Inject
	BoardService boardService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		model.addAttribute("list",boardService.mainBoardList());
		return "index";
	}
	
	@RequestMapping(value="/contact",method=RequestMethod.GET)
	   public String contact(Model model)throws Exception{
	      return "contact";
	   }
	
	   @RequestMapping(value="/contact", method=RequestMethod.POST)
	   public String contactPOST(MailVO email, RedirectAttributes rttr)throws Exception{
	      System.out.println("메일 잘들어왔나 :"+email);
	      service.sendMailTest(email.getName(),email.getMessage(),email.getEmailaddress());
	      rttr.addFlashAttribute("msg","SUCCESS");
	      return "redirect:/contact";
	   }
	
	   @RequestMapping(value="/intro",method=RequestMethod.GET)
	   public void intro(){
		   
	   }

	
}
