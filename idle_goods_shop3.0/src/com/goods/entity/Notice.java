package com.goods.entity;

import java.sql.Date;

public class Notice {
	private int n_id;
	private String n_content;
	private Date time;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Notice(int n_id, String n_content, Date time) {
		super();
		this.n_id = n_id;
		this.n_content = n_content;
		this.time = time;
	}

	public int getN_id() {
		return n_id;
	}

	public void setN_id(int n_id) {
		this.n_id = n_id;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
	
	
}
