package org.study.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("login") == null){
			System.out.println("login please");
			System.out.println(request);
			saveDest(request);
			response.sendRedirect("/user/login");
			return false;
		}
		return true;
	}


	public void saveDest(HttpServletRequest req) {
		
		String uri = req.getRequestURI();
		String query = req.getQueryString();
	
		if (uri == null || query==null) {
			query = "";
		} else {
			query = "?" + query;
		}
		
	
		if (req.getMethod().equals("GET")) {
	
			req.getSession().setAttribute("dest", uri + query);
		}

	}

}
