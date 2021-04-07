package com.notice.biz;

import java.util.List;

import com.notice.entity.Notice;

public interface NoticeBiz {
	//增
	public void addNotice(Notice notice); 
	
	//删
	public void delNotice(int id);
	
	//分页查所有
	public List<Notice> findNoPage(int index,int size);
	
	//总记录数
	public int countPage();
	public int count(String n_content);
	
	//模糊查询
	public List<Notice> findBycontent (int index,int size,String n_content);
	
	//改
	public void updateNotice(Notice notice);

	public Notice findByNoId(int n_id);
}
