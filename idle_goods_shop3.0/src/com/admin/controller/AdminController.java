package com.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.biz.AdminBiz;
import com.admin.entity.Admin;
import com.admin.entity.Goods;
import com.admin.entity.Type;


@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminBiz adminBiz;
	
	@RequestMapping(value="/login.do")
	@ResponseBody
	public int login(String a_name,String a_pwd,String checkNum,HttpSession session){
		int flag=-1;
		Admin a1=null;
		a1=adminBiz.findByName(a_name);
		Admin a2=null;
		a2=adminBiz.login(a_name, a_pwd);
		session.setAttribute("a_name",a_name);
		String key=session.getAttribute("RANDOMCODEKEY").toString();
		//System.out.println(checkNum+' '+key);
		if(checkNum.toLowerCase().equals(key.toLowerCase())){
			if(a1!= null){  //找到账户，账户存在
				if(a2!=null){ //账户密码验证成功，用户可登录
					flag=1;
				}if(a2==null){ //账号存在，密码不正确
					flag=2;
				}
			}else{
				flag=3; //账号不存在
			}
		}else{  //验证码错误
			flag=0;
		}
		
		return flag;
	}
	
	@RequestMapping(value="/manageGoods.do")
	public String manageGoods(Integer index1,Integer index2,ModelMap map){
		if (index1 == null) {
			index1 = 1;
		}
		if (index2 == null) {
			index2 = 1;
		}
		int size=4;
		
		int sumG=adminBiz.goodsCount();
		int sumT=adminBiz.typeCount();
		int totalGP = sumG % size == 0 ? sumG / size : sumG / size + 1;
		int totalTP=sumT%size==0?sumT/size:sumT/size+1;
		
		List<Goods> list1=adminBiz.checkGoods(index1,size);
		List<Type> list2 =adminBiz.findAllType(index2,size);
		
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("index1", index1);
		map.put("index2", index2);
		map.put("totalGP", totalGP);
		map.put("totalTP", totalTP);
		map.put("sumG", sumG);
		//System.out.println(list1);
		
		
		
		return "manageGoods";
	}
	
	@RequestMapping(value="/pass.do")
	public 	String pass(int g_id){
		adminBiz.pass(g_id);
		return "forward:manageGoods.do";
		
	}
	
	
	@RequestMapping(value="/changeType.do")
	@ResponseBody
	public int  changType(String t_name, int t_id){
		int flag=0;
		Type type=null;
		type=adminBiz.checkType(t_name);
		if(type !=null){
			flag=0;     //名字存在，不能改
		}else {
			
			adminBiz.changTypeName(t_name, t_id);
			flag=1;   //改
		}
		return flag;		
	}
	@RequestMapping(value="/addType.do")
	@ResponseBody
	public int addType(String t_name){
		System.out.println(t_name);
		int flag=0;
		Type type=null;
		type=adminBiz.checkType(t_name);
		if(type !=null){
			flag=0;     //名字存在，不能添加
		}else {
			System.out.println("可以");
			adminBiz.addType(t_name);     
			flag=1;  //可以添加
		}
		return flag;
		
	}
	
	
	
}
