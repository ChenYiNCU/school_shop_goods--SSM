 package com.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.notice.biz.NoticeBiz;
import com.notice.entity.Notice;


@Controller
public class NoticeController {
	@Autowired
	private NoticeBiz noticeBiz;
	
	@RequestMapping(value="/addNotice.do")
	public String addNotice(String n_content,HttpSession session) {
		Notice notice = new Notice();
		notice.setN_content(n_content);
		noticeBiz.addNotice(notice);
		return "forward:findNoPage.do";
	}
	
	
		//分页查所有
		@RequestMapping(value="/findNoPage.do")
		public String findNoPage(Integer index,ModelMap map) {
			if(index==null) {
				index = 1;
			}
			int size = 8;
			List<Notice> list = noticeBiz.findNoPage(index, size);
			int count = noticeBiz.countPage();
			
			System.out.print(list.size());
			int total = count%size == 0?count/size:count/size+1;
			map.put("list",list);
			map.put("index",index);
			//将总记录数存入作用域
			map.put("total",total);
			return "notice";
		}
		
		//删除公告
		@RequestMapping(value="/delNotice.do")
		public String delNotice(Integer n_id,HttpSession session) {
			noticeBiz.delNotice(n_id);
			return "forward:findNoPage.do";
		}
		
		//模糊查询
		@RequestMapping(value="/findBycontent.do")
		public String findBycontent(Integer index,String n_content,ModelMap map) {
			if(index==null) {
				index = 1;
			}
			int size = 8;
			List<Notice> list = noticeBiz.findBycontent(index, size, n_content);
			//总记录数
			int count = noticeBiz.count(n_content);
			
			System.out.print(list.size());
			int total = count%size == 0?count/size:count/size+1;
			map.put("list",list);
			map.put("index",index);
			map.put("n_content",n_content);
			//将总记录数存入作用域
			map.put("total",total);
			return "notice";
		}
		
		//改
		@RequestMapping(value="/updateNotice.do")
		public String updateNotice(int n_id,String n_content) {
			Notice notice = new Notice();
			notice.setN_id(n_id);
			notice.setN_content(n_content);
			noticeBiz.updateNotice(notice);
			return "forward:findNoPage.do";
		}
		
		@RequestMapping(value="/findByNoId.do")
		@ResponseBody
		public Notice findByNoId(int n_id) {
			Notice notice = noticeBiz.findByNoId(n_id);
			return notice;
		}
}
