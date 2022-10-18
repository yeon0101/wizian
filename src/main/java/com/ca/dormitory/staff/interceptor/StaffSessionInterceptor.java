package com.ca.dormitory.staff.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

public class StaffSessionInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ModelAndViewDefiningException {
		
		if(request.getSession().getAttribute("sessionStaffInfo") == null) {
			ModelAndView mv = new ModelAndView();
			
			System.out.println("직원 세션인터셉터 걸림");
						
			mv.setViewName("interceptor/loginSessionErrorPage");
			throw new ModelAndViewDefiningException(mv);
		}
		return true;
	}
}
