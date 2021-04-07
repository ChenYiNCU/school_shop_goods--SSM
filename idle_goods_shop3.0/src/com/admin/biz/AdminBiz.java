package com.admin.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.admin.entity.Admin;
import com.admin.entity.Goods;
import com.admin.entity.Type;


public interface AdminBiz {
	public Admin login(String a_name,String a_pwd);
	public Admin findByName(String a_name);
	public List<Goods> checkGoods(int index,int size);
	public void pass(int g_id);
	public int goodsCount();
	public List<Type> findAllType(int index,int size);
	public int typeCount();
	public Type checkType(String t_name);   //查找类型名字
	public void changTypeName(String t_name, int t_id);
	public void addType(String t_name);
	
}
