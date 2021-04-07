package com.notice.mapper;

import java.util.List;
import java.util.Map;

import com.notice.entity.Notice;
import com.user.entity.User;

public interface NoticeMapper {
	//增
	public void addNotice(Notice notice);
	//删
	public void delNotice(int id);
	//改
	public void updateNotice(Notice notice);
	
	//分页查询
	public List<Notice> findNoPage(Map<String,Object> map);
	
	//模糊查询
	public List<Notice> findBycontent(Map<String,Object> map);
	
	//总记录数
	public int countPage();
	public int count(Map<String,Object> map);
	
	public Notice findByNoId(int id);
}
