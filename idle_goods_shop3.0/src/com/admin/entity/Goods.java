package com.admin.entity;

public class Goods {
	private int g_id;
	private String g_name;
	private User seller = new User();
	private User buyer = new User();
	private String g_detail;
	private float g_price;
	private int flag;
	private Type type = new Type();
	private String url;
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Goods(int g_id, String g_name, User seller, User buyer,
			String g_detail, float g_price, int flag, Type type, String url) {
		super();
		this.g_id = g_id;
		this.g_name = g_name;
		this.seller = seller;
		this.buyer = buyer;
		this.g_detail = g_detail;
		this.g_price = g_price;
		this.flag = flag;
		this.type = type;
		this.url = url;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int g_id) {
		this.g_id = g_id;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public User getSeller() {
		return seller;
	}
	public void setSeller(User seller) {
		this.seller = seller;
	}
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
	public String getG_detail() {
		return g_detail;
	}
	public void setG_detail(String g_detail) {
		this.g_detail = g_detail;
	}
	public float getG_price() {
		return g_price;
	}
	public void setG_price(float g_price) {
		this.g_price = g_price;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
}
