package com.user.entity;

public class User {
	private int u_id;
	private String u_name;
	private String u_pwd;
	private String u_sid;
	private String u_class;
	private String u_margin;
	private int u_flag;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int u_id, String u_name, String u_pwd, String u_sid,
			String u_class, String u_margin, int u_flag) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_pwd = u_pwd;
		this.u_sid = u_sid;
		this.u_class = u_class;
		this.u_margin = u_margin;
		this.u_flag = u_flag;
	}
	/**
	 * @return the u_id
	 */
	public int getU_id() {
		return u_id;
	}
	/**
	 * @param u_id the u_id to set
	 */
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	/**
	 * @return the u_name
	 */
	public String getU_name() {
		return u_name;
	}
	/**
	 * @param u_name the u_name to set
	 */
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	/**
	 * @return the u_pwd
	 */
	public String getU_pwd() {
		return u_pwd;
	}
	/**
	 * @param u_pwd the u_pwd to set
	 */
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	/**
	 * @return the u_sid
	 */
	public String getU_sid() {
		return u_sid;
	}
	/**
	 * @param u_sid the u_sid to set
	 */
	public void setU_sid(String u_sid) {
		this.u_sid = u_sid;
	}
	/**
	 * @return the u_class
	 */
	public String getU_class() {
		return u_class;
	}
	/**
	 * @param u_class the u_class to set
	 */
	public void setU_class(String u_class) {
		this.u_class = u_class;
	}
	/**
	 * @return the u_margin
	 */
	public String getU_margin() {
		return u_margin;
	}
	/**
	 * @param u_margin the u_margin to set
	 */
	public void setU_margin(String u_margin) {
		this.u_margin = u_margin;
	}
	/**
	 * @return the u_flag
	 */
	public int getU_flag() {
		return u_flag;
	}
	/**
	 * @param u_flag the u_flag to set
	 */
	public void setU_flag(int u_flag) {
		this.u_flag = u_flag;
	}
	
}