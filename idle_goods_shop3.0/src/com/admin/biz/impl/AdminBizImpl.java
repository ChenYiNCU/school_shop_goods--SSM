package com.admin.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.admin.biz.AdminBiz;
import com.admin.entity.Admin;
import com.admin.entity.Goods;
import com.admin.entity.Type;
import com.admin.mapper.AdminMapper;



@Service("adminBiz")
public class AdminBizImpl implements AdminBiz{
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public Admin login(String a_name, String a_pwd) {
		return adminMapper.login(a_name, a_pwd);
	}

	@Override
	public Admin findByName(String a_name) {
		return adminMapper.findByName(a_name);
	}

	@Override
	public List<Goods> checkGoods(int index,int size) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("index", index);
		map.put("size", size);
		System.out.println(index+size);
		return adminMapper.checkGoods(map);
	}

	@Override
	public void pass(int g_id) {
		// TODO Auto-generated method stub
		adminMapper.pass(g_id);
		
	}

	@Override
	public int goodsCount() {
		// TODO Auto-generated method stub
		return adminMapper.goodsCount();
	}

	@Override
	public List<Type> findAllType(int index,int size) {
		// TODO Auto-generated method stub
		List<Type> list=adminMapper.findAllType(index,size);
		return list;
	}

	@Override
	public int typeCount() {
		// TODO Auto-generated method stub
		return adminMapper.typeCount();
	}

	@Override
	public Type checkType(String t_name) {      
		// TODO Auto-generated method stub
		
		return adminMapper.checkType(t_name);
	}

	@Override
	public void changTypeName(String t_name, int t_id) {
		// TODO Auto-generated method stub
		adminMapper.changTypeName(t_name, t_id);
		
	}

	@Override
	public void addType(String t_name) {
		// TODO Auto-generated method stub
		//System.out.println(t_name);
		adminMapper.addType(t_name);
		
		
	}
}
