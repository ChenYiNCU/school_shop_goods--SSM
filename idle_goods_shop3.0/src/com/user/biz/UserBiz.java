package com.user.biz;

import java.util.List;

import com.user.entity.User;

public interface UserBiz {
	//¸Ä
	public void updateUser(User user);
	public User findByuId(int id);
	public void registUser(User u);
	public User login(String u_sid,String u_pwd);
	public User findById(String u_sid);
	public List<User> findAllUsers(int index,int size);
	public int countUsers();
	public void examine(int u_id);
	public void reopen(int u_id);
	public void freeze(int u_id);
	public User findUserById(int u_id);
	public void update(User u);
	public void updatePwd(String u_sid,String u_pwd);
	public void del(int u_id);
	public List<User> findLike(String find,int index,int size);
	public int countUsersBySid(String find);
	public List<User> findFlag(int u_flag,int index,int size);
	public int countUsersByFlag(int u_flag);
}
