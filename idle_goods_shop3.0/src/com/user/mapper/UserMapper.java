package com.user.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.user.entity.User;

public interface UserMapper {	
	//修改
	public void updateUser(User user);
	//通过id查
	public User findByuId(int id);
	//注册
	public void registUser(User u);
	//登入
	public User login(@Param("u_sid") String u_sid,@Param("u_pwd") String u_pwd);
	//通过sid查
	public User findById(String u_sid);
	//查找所有
	public List<User> findAllUsers(Map<String,Object> map);
	
	public void examine(int u_id);	
	public int countUsers();
	public void reopen(int u_id);
	public void freeze(int u_id);
	//根据用户编号查找用户
	public User findUserById(int u_id);
	//修改用户信息
	public void update(User u);
	//修改密码
	public void updatePwd(Map<String,Object> map);
	//删除用户
	public void del(int u_id);
	//模糊查询用户
	public List<User> findLike(Map<String,Object> map);
	public int countUsersBySid(String find);
	//按账号类型查询用户
	public List<User> findFlag(Map<String,Object> map);
	public int countUsersByFlag(int u_flag);
}
