package com.ca.dormitory.student.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

public class StudentSessionInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ModelAndViewDefiningException {
		
		if(request.getSession().getAttribute("sessionStudentInfo") == null) {
			ModelAndView mv = new ModelAndView();
			
			System.out.println("학생 세션인터셉터 걸림");
			
			mv.setViewName("interceptor/loginSessionErrorPage");
			throw new ModelAndViewDefiningException(mv);
		}
		return true;
	}
}
