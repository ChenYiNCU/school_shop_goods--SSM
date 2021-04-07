package com.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.admin.entity.Admin;
import com.admin.entity.Goods;
import com.admin.entity.Type;


public interface AdminMapper {
	public Admin login(@Param("a_name") String a_name,@Param("a_pwd") String a_pwd);
	public Admin findByName(String name);
	public List<Goods> checkGoods(Map<String, Object> map);
	public void pass(int g_id);
	public int goodsCount();
	public List<Type> findAllType(@Param("index") int index,@Param("size") int size);
	public int typeCount();
	public Type checkType(String t_name);
	public void changTypeName(@Param("t_name") String t_name,@Param("t_id") int t_id);
	public void addType(String t_name);
}
