package com.goods.biz;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.goods.entity.Goods;
import com.goods.entity.Notice;
import com.goods.entity.Type;

public interface GoodsBiz {
	public List<Type> findAllType();
	public List<Notice> findAllNotices();
	public List<Goods> findAllGoods(int index,int size);
	public List<Goods> findGoods(String g_name);
	public List<Goods> findGoodsByType(int t_id);
	public int count();
	public Goods findByGId(int g_id);
	public Goods checkGoods(int g_id,int u_id);
	public void inCard(int g_id,int u_id);
	public List<Goods> card(int u_id);
	
	public  int cardNum(int u_id);
	
	public void cardDelete(int g_id);
	public void pay(int g_id);
	//查询我的发布订单
	public List<Goods> findGoodsBySeller(int u_id,int index,int size);
	//查询发布订单数量
	public int countGoods(int u_id);
	//查询购买订单数量
	public int countBuyGoods(int u_id);
	//删除我的发布订单
	public void delGoods(int g_id);
	//根据编号查询我发布的物品信息
	public Goods findGoodsById(int g_id);
	//修改我发布的物品信息
	public void updateGoods(Goods g);
	//添加我的发布
	public void addGoods(Goods goods);
	//模糊查询
	public List<Goods> findGoodsLike(int find_id,String find,int u_id,int index,int size);
	//模糊查询购买订单
	public List<Goods> findGoodsLike2(int find_id,String find,int u_id,int index,int size);
	//查询我购买的订单
	public List<Goods> findGoodsByBuyer(int u_id,int index,int size);
	//搜索的发布记录数
	public int countByFind(int find_id,String find,int u_id);
	//搜索的发布记录数
	public int countByBuyFind(int find_id,String find,int u_id);
	//查询我卖出的订单
	public List<Goods> findGoodsBySelled(int u_id,int index,int size);
	//查询我的发布订单
	public List<Goods> findGoodsBySeller2(int u_id,int index,int size);
}
