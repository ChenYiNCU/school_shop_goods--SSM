package com.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	//拦截的是控制器中的请求
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		   	  System.out.println("进入拦截器");
		      String u_name=(String)request.getSession().getAttribute("u_name");
		      String a_name=(String)request.getSession().getAttribute("a_name");
		      String url=request.getRequestURI();
		      if(url.indexOf("checkCode.do")>0){
		    	  return true;
		      }
		      if(url.indexOf("index.do")>0){
		    	  return true;
		      }
		      if(url.indexOf("login.do")>0){
		    	  return true;
		      }
		      if(url.indexOf("reg.do")>0){
		    	  return true;
		      } 
		      if(url.indexOf("findByGId.do")>0){
		    	  return true;
		      } 
		      if(url.indexOf("allGoods.do")>0){
		    	  return true;
		      } 
		      if(url.indexOf("findById.do")>0){
		    	  return true;
		      } 
		      if(url.indexOf("updatePwd.do")>0){
		    	  return true;
		      }
		      if(u_name!=null){
		    	  return true;
		      }
		      if(a_name!=null){
		    	  return true;
		      }
		      response.sendRedirect("/idle_goods_shop3/login&regist.jsp");
		      return false;
	}

}
