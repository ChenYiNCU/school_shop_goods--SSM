package com.admin.entity;

public class Admin {
	private int a_id;
	private String a_name;
	private String a_pwd;
	
	
	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_pwd() {
		return a_pwd;
	}

	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
	}

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(int a_id, String a_name, String a_pwd) {
		super();
		this.a_id = a_id;
		this.a_name = a_name;
		this.a_pwd = a_pwd;
	}
	
}
