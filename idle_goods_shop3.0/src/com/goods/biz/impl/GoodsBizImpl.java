package com.goods.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goods.biz.GoodsBiz;
import com.goods.entity.Goods;
import com.goods.entity.Notice;
import com.goods.entity.Type;
import com.goods.mapper.GoodsMapper;

@Service("goodsBiz")
public class GoodsBizImpl implements GoodsBiz{
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public List<Type> findAllType() {
		// TODO Auto-generated method stub
		List<Type> list=goodsMapper.findAllType();
		return list;
	}

	@Override
	public List<Notice> findAllNotices() {
		// TODO Auto-generated method stub
		
		List<Notice> list=goodsMapper.findAllNotices();
		return list;
	}

	@Override
	public List<Goods> findAllGoods(int index,int size) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("index", index);
		map.put("size", size);
		List<Goods> list=goodsMapper.findAllGoods(map);
		return list;
	}
	
	@Override
	public List<Goods> findGoods(String g_name) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("g_name", g_name);
		
		List<Goods> list=goodsMapper.findGoods(map);
		return list;
	}
	

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return goodsMapper.count();
	}

	@Override
	public Goods findByGId(int g_id) {
		// TODO Auto-generated method stub
		Goods goods=goodsMapper.findByGId(g_id);
		return goods;
	}
	
	@Override
	public Goods checkGoods(int g_id, int u_id) {
		// TODO Auto-generated method stub
		return goodsMapper.checkGoods(g_id, u_id);
		
	}

	@Override
	public void inCard(int g_id, int u_id) {
		// TODO Auto-generated method stub
		goodsMapper.inCard(g_id, u_id);
	}

	@Override
	public List<Goods> card(int u_id) {
		// TODO Auto-generated method stub
		List<Goods> list=goodsMapper.card(u_id);
		System.out.println(list);
		return list;
	}

	@Override
	public void cardDelete(int g_id) {
		goodsMapper.cardDelete(g_id);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void pay(int g_id) {
		// TODO Auto-generated method stub
		goodsMapper.pay(g_id);
		
	}
	
	@Override
	public List<Goods> findGoodsBySeller(int u_id, int index, int size) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("u_id", u_id);
		map.put("index", index);
		map.put("size", size);
		List<Goods> list=goodsMapper.findGoodsBySeller(map);
		return list;
	}
	
	@Override
	public void delGoods(int g_id) {
		goodsMapper.delGoods(g_id);
	}

	@Override
	public Goods findGoodsById(int g_id) {
		return goodsMapper.findGoodsById(g_id);
	}

	@Override
	public void updateGoods(Goods g) {
		goodsMapper.updateGoods(g);
	}

	@Override
	public void addGoods(Goods goods) {
		goodsMapper.addGoods(goods);
	}

	@Override
	public List<Goods> findGoodsByBuyer(int u_id, int index, int size) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("u_id", u_id);
		map.put("index", index);
		map.put("size", size);
		List<Goods> list=goodsMapper.findGoodsByBuyer(map);
		return list;
	}

	@Override
	public List<Goods> findGoodsBySelled(int u_id, int index, int size) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("u_id", u_id);
		map.put("index", index);
		map.put("size", size);
		List<Goods> list=goodsMapper.findGoodsBySelled(map);
		return list;
	}
	
	@Override
	public List<Goods> findGoodsLike(int find_id, String find,int u_id, int index,
			int size) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("find_id", find_id);
		map.put("find", find);
		map.put("u_id", u_id);
		map.put("index", index);
		map.put("size", size);
		List<Goods> list=goodsMapper.findGoodsLike(map);
		return list;
	}
	
	@Override
	public List<Goods> findGoodsLike2(int find_id, String find,int u_id, int index,
			int size) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("find_id", find_id);
		map.put("find", find);
		map.put("u_id", u_id);
		map.put("index", index);
		map.put("size", size);
		List<Goods> list=goodsMapper.findGoodsLike2(map);
		return list;
	}
	
	@Override
	public int countGoods(int u_id) {
		return goodsMapper.countGoods(u_id);
	}
	
	@Override
	public int countBuyGoods(int u_id) {
		return goodsMapper.countBuyGoods(u_id);
	}

	@Override
	public int countByFind(int find_id, String find, int u_id) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("find_id", find_id);
		map.put("find", find);
		map.put("u_id", u_id);
		return goodsMapper.countByFind(map);
	}
	
	@Override
	public int countByBuyFind(int find_id, String find, int u_id) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("find_id", find_id);
		map.put("find", find);
		map.put("u_id", u_id);
		return goodsMapper.countByBuyFind(map);
	}

	@Override
	public List<Goods> findGoodsByType(int t_id) {
		// TODO Auto-generated method stub
		
		return goodsMapper.findGoodsByType(t_id);
	}

	@Override
	public int cardNum(int u_id) {
		// TODO Auto-generated method stub
		
		return goodsMapper.cardNum(u_id);
	}
	
	@Override
	public List<Goods> findGoodsBySeller2(int u_id, int index, int size) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("u_id", u_id);
		map.put("index", index);
		map.put("size", size);
		List<Goods> list=goodsMapper.findGoodsBySeller2(map);
		return list;
	}

}
