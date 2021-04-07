package com.goods.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.goods.entity.Goods;
import com.goods.entity.Notice;
import com.goods.entity.Type;


public interface GoodsMapper {
	public List<Type> findAllType();
	public List<Notice> findAllNotices();
	public List<Goods> findAllGoods(Map<String, Object> map);
	public List<Goods> findGoods(Map<String, Object> map);
	public List<Goods> findGoodsByType(int t_id);
	public int count();
	
	public Goods findByGId(int g_id);
	public Goods checkGoods(@Param("g_id") int g_id,@Param("u_id") int u_id);
	public void inCard(@Param("g_id") int g_id,@Param("u_id") int u_id);
	public List<Goods> card(int u_id);
	public  int cardNum(int u_id);
	public void cardDelete(int g_id);
	public void pay(int g_id);
	//查询我的发布订单
	public List<Goods> findGoodsBySeller(Map<String, Object> map);
	//查询发布订单数量
	public int countGoods(int u_id);
	//查询购买订单数量
	public int countBuyGoods(int u_id);
	//取消/删除我发布的订单
	public void delGoods(int g_id);
	//按商品编号查询我的发布信息
	public Goods findGoodsById(int g_id);
	//修改我的发布信息内容
	public void updateGoods(Goods g);
	//添加我的发布
	public void addGoods(Goods goods);
	//查询所有类型
	public List<Goods> findGoodsLike(Map<String,Object> map);
	//模糊查询购买订单（按照编号/物品名称/物品类别）
	public List<Goods> findGoodsLike2(Map<String,Object> map);
	//查询搜索商品的订单数量
	public int countByFind(Map<String,Object> map);
	//查询搜索商品的购买订单数量
	public int countByBuyFind(Map<String,Object> map);
	//查询我买到的
	public List<Goods> findGoodsByBuyer(Map<String, Object> map);
	//查询我卖出的
	public List<Goods> findGoodsBySelled(Map<String, Object> map);
	//查询我的出售订单
	public List<Goods> findGoodsBySeller2(Map<String, Object> map);
}
