package com.evaluation.entity;


import com.goods.entity.Goods;

public class Evaluation {
	private int e_id;
	private Goods goods= new Goods();
	private User seller = new User();
	private User buyer = new User();
	private String e_content;
	private int e_score;
	
	public Evaluation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Evaluation(int e_id, Goods goods, User seller, User buyer, String e_content, int e_score) {
		super();
		this.e_id = e_id;
		this.goods = goods;
		this.seller = seller;
		this.buyer = buyer;
		this.e_content = e_content;
		this.e_score = e_score;
	}
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
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
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public int getE_score() {
		return e_score;
	}
	public void setE_score(int e_score) {
		this.e_score = e_score;
	}
	
	
}
