package org.study.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.study.domain.UserVO;
import org.study.service.UserService;

@Controller
@RequestMapping("/user/*")
public class LoginController {
	
	@Inject
	UserService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
		
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<String> loginCheck(@RequestBody UserVO vo, HttpServletRequest request) {

		ResponseEntity<String> entity = null;
		try {
			UserVO user = service.loginCheck(vo);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("login", user);

				if (session.getAttribute("dest") == null) {
					session.setAttribute("dest", "/");
				}
				
				String root = (String) session.getAttribute("dest");
				entity = new ResponseEntity<String>(root, HttpStatus.OK);
				
			}
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/signUp", method= RequestMethod.GET)
	public void signUpGet(){

	}
	
	@RequestMapping(value="/signUpIdCheck", method = RequestMethod.POST)
	public ResponseEntity<String> signUpIdCheck(String uid) throws Exception{
			System.out.println(uid);
		
		 if(service.signUpIdCheck(uid)==null){
			 	return  new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		 }else{
			 return  new ResponseEntity<String>("BAD",HttpStatus.OK);
		 }
	}
	
	@RequestMapping(value="/signUp", method= RequestMethod.POST)
	public String signUpPost(UserVO vo) throws Exception{
		
		service.signUp(vo);
		return "redirect:/board/boardList";
	}
	
	
	@RequestMapping(value="/logout", method= RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		Object obj = session.getAttribute("login");
		
		if(obj!=null){
			session.removeAttribute("login");
			session.invalidate();
		}
		
		return "redirect:/board/boardList";
	}

}
