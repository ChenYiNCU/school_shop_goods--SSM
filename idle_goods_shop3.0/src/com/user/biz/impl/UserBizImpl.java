package com.user.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.biz.UserBiz;
import com.user.entity.User;
import com.user.mapper.UserMapper;


@Service("userBiz")
public class UserBizImpl implements UserBiz{
	@Autowired
	private UserMapper userMapper;

	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}
	
	@Override
	public User findByuId(int id) {
		User user = userMapper.findByuId(id);
		return user;
	}
	
	@Override
	public void registUser(User u) {
		userMapper.registUser(u);
	}

	@Override
	public User login(String u_sid, String u_pwd) {
		return userMapper.login(u_sid, u_pwd);
	}

	@Override
	public User findById(String u_sid) {
		return userMapper.findById(u_sid);
	}

	@Override
	public List<User> findAllUsers(int index,int size) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("index", index);
		map.put("size", size);
		return userMapper.findAllUsers(map);
	}

	@Override
	public void examine(int u_id) {
		userMapper.examine(u_id);
	}
	@Override
	public void reopen(int u_id) {
		userMapper.reopen(u_id);
		
	}

	@Override
	public void freeze(int u_id) {
		userMapper.freeze(u_id);
	}

	@Override
	public User findUserById(int u_id) {
		return userMapper.findUserById(u_id);
	}

	@Override
	public void update(User u) {
		userMapper.update(u);
	}

	@Override
	public int countUsers() {
		return userMapper.countUsers();
	}

	@Override
	public void updatePwd(String u_sid, String u_pwd) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("u_sid", u_sid);
		map.put("u_pwd", u_pwd);
		userMapper.updatePwd(map);
	}

	@Override
	public void del(int u_id) {
		userMapper.del(u_id);
	}

	@Override
	public List<User> findLike(String find, int index, int size) {
		// TODO Auto-generated method stub
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("find", find);
		map.put("index", index);
		map.put("size",size);
		return userMapper.findLike(map);
	}

	@Override
	public int countUsersBySid(String find) {
		// TODO Auto-generated method stub
		return userMapper.countUsersBySid(find);
	}

	@Override
	public List<User> findFlag(int u_flag, int index, int size) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("u_flag", u_flag);
		map.put("index", index);
		map.put("size",size);
		return userMapper.findFlag(map);
	}

	@Override
	public int countUsersByFlag(int u_flag) {
		return userMapper.countUsersByFlag(u_flag);
	}
}
