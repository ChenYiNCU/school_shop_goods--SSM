package com.goods.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.goods.biz.GoodsBiz;
import com.goods.entity.Goods;
import com.goods.entity.Notice;
import com.goods.entity.Type;
import com.goods.entity.User;

@Controller
// @RequestMapping("goods")
public class GoodsController {
	@Autowired
	private GoodsBiz goodsBiz;

	@RequestMapping(value = "/index.do")
	public String index(Integer index,HttpSession session, ModelMap map) {
		int u_id;
		if( session.getAttribute("u_id")==null){
			u_id=0;			
		}
		else {
			u_id=(int) session.getAttribute("u_id");
		}
		
		
		System.out.println(u_id);
		int cardnum=0;
		cardnum= goodsBiz.cardNum(u_id);
		System.out.println("购物车：   "+cardnum);
		session.setAttribute("cardnum", cardnum);
		List<Type> list = goodsBiz.findAllType();
		List<Notice> list2 = goodsBiz.findAllNotices();
		if (index == null) {
			index = 1;
		}
		int size = 12;
		int sum = goodsBiz.count();
		int total = sum % size == 0 ? sum / size : sum / size + 1;
		List<Goods> list3 = goodsBiz.findAllGoods(index, size);
		map.put("list1", list);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("index", index);
		map.put("total", total);
		//map.put("cardnum", cardnum);
		// System.out.println(list.toArray());
		return "index";
	}

	@RequestMapping(value = "/findByGId.do")
	public String findByGId(Integer g_id, ModelMap map) {
		Goods goods = goodsBiz.findByGId(g_id);
		map.put("goods", goods);
		return "buy";

	}

	@RequestMapping(value = "/allGoods.do")
	public String allGoods(Integer index, Integer flag, String g_name,Integer t_id, ModelMap map) {
		if (index == null) {
			index = 1;
		}
		int size = 12;
		int sum;
		int total;
		List<Goods> list3;

		if (flag == 0) {                        //查所有商品
			sum = goodsBiz.count();
			total = sum % size == 0 ? sum / size : sum / size + 1;
			list3 = goodsBiz.findAllGoods(index, size);
			map.put("index", index);
			map.put("total", total);

		}else if(flag==1){                    //按名字查询
			//sum = goodsBiz.countG(g_name);
			//total = sum % size == 0 ? sum / size : sum / size + 1;
			list3 = goodsBiz.findGoods(g_name);
		}else{                  //按类型查询
			list3=goodsBiz.findGoodsByType(t_id);
		}

		map.put("list3", list3);
		map.put("flag", flag);
		
		return "allGoods";

	}

	@RequestMapping(value = "/inCard.do")
	@ResponseBody
	public int inCard(int g_id, Integer u_id) {
		int flag;
		Goods goods=goodsBiz.checkGoods(g_id, u_id);
		if(goods!=null){
			//不能加购
			flag=0;
		}else {
			//可以加购
			goodsBiz.inCard(g_id, u_id);
			flag=1;
		}

		
		//System.out.println(g_id + u_id);
		return flag;

	}

	@RequestMapping(value = "/card.do")
	public String card(String u_id, ModelMap map) {
		//System.out.println(u_id);
		if (u_id.equals("null")) {
			u_id = "0";
		}

		int foo = Integer.parseInt(u_id);
		float total_money = 0;
		List<Goods> list = goodsBiz.card(foo);
		for (Goods g : list) {
			total_money += g.getG_price();
		}

		map.put("list", list);
		map.put("total_money", total_money);
		map.put("num", list.size());
		//System.out.println(list);
		return "card";

	}

	@RequestMapping(value = "/cardDelete.do")
	@ResponseBody
	public String cardDelete(int g_id) {
		goodsBiz.cardDelete(g_id);
		return "从购物车 删除成功";
	}

	@RequestMapping(value = "/pay.do")
	@ResponseBody
	public String pay(int g_id) {
		goodsBiz.pay(g_id);
		return "已生成订单";
	}

	@RequestMapping(value = "/addGoods.do")
	public String addGoods(String g_name, int t_id, float g_price,
			String g_detail, @RequestParam("file") MultipartFile file,
			HttpSession session, ModelMap map) throws IllegalStateException,
			IOException {
		String se_id = session.getAttribute("u_id").toString();
		int u_id = Integer.parseInt(se_id);
		String fileName = file.getOriginalFilename();
		System.out.println("文件名:" + fileName);
		List<Type> list = goodsBiz.findAllType();
		map.put("list", list);
		if (!fileName.equals("")) {
			// 获取上传的路径
			String str = "H:\\大三下\\idle_goods_shop3.0\\WebContent\\img";
			// 重新定义文件的全路径
			File f = new File(str + "\\" + u_id +fileName);
			// 将文件读入磁盘
			file.transferTo(f);
			Type type = new Type();
			type.setT_id(t_id);
			User seller = new User();
			seller.setU_id(u_id);
			String url = "./img/" + u_id +fileName;
			// Goods goods = new
			// Goods(0,g_name,seller,seller,g_detail,g_price,0,type,url);
			Goods g = new Goods();
			g.setG_name(g_name);
			g.setSeller(seller);
			g.setType(type);
			g.setG_price(g_price);
			g.setG_detail(g_detail);
			g.setUrl(url);
			goodsBiz.addGoods(g);
		}
		return "forward:findGoodsBySeller.do";
	}

	// 通过goodsid查商品
	@RequestMapping(value = "/findGoodsById1.do")
	@ResponseBody
	public Goods findGoodsById(Integer g_id, HttpSession session) {
		String id = session.getAttribute("u_id").toString();
		Integer id1 = Integer.valueOf(id);
		int u_id = id1.intValue();
		Goods goods = goodsBiz.findGoodsById(g_id);
		goods.getBuyer().setU_id(u_id);
		return goods;
	}

	/*
	 * @RequestMapping(value="/findGoodsById.do")
	 * 
	 * @ResponseBody public Goods findGoodsById(Integer g_id){ return
	 * goodsBiz.findGoodsById(g_id); }
	 */

	@RequestMapping(value = "/findGoodsById.do")
	public String findGoodsById(Integer g_id, ModelMap map,HttpSession session) {
		Goods g = goodsBiz.findGoodsById(g_id);
		List<Type> list = goodsBiz.findAllType();
		session.setAttribute("pic", g.getUrl());
		session.setAttribute("type", g.getType().getT_id());
		map.put("list", list);
		map.put("goods", g);
		return "updateGoods";
	}

	@RequestMapping(value = "/findGoodsBySeller.do")
	public String findGoodsBySeller(Integer index, ModelMap map,
			HttpSession session) {
		if (index == null) {
			index = 1;
		}
		int size = 5;
		String id = session.getAttribute("u_id").toString();
		Integer id1 = Integer.valueOf(id);
		int u_id = id1.intValue();
		int count = goodsBiz.countGoods(u_id);
		int total = count % size == 0 ? count / size : count / size + 1;
		List<Goods> list = goodsBiz.findGoodsBySeller(u_id, index, size);
		map.put("list", list);
		map.put("index", index);
		map.put("total", total);
		// System.out.print(list);
		return "mySales";
	}

	// 删除goods
	@RequestMapping(value = "/delGoods.do")
	public String delGoods(Integer g_id) {
		goodsBiz.delGoods(g_id);
		return "forward:findGoodsBySeller.do";
	}

	/*
	 * @RequestMapping(value="/updateGoods.do") public String updateGoods(int
	 * g_id,String g_name,int g_type,float g_price,String g_detail){ return
	 * "userIndex"; }
	 */

	@RequestMapping(value = "/updateGoods.do")
	public String updateGoods(int g_id, String g_name,
			@RequestParam("file") MultipartFile file, int t_id, float g_price,
			String g_detail,HttpSession session) throws IllegalStateException, IOException {
		String fileName = file.getOriginalFilename();
		int u_id=(int) session.getAttribute("u_id");
		System.out.println("文件名:" + fileName);
		String url=null;
		int type_id=(int) session.getAttribute("type");
		Type type = new Type();
		if (!fileName.equals("")) {
			// 获取上传的路径
			String str = "H:\\大三下\\idle_goods_shop3.0\\WebContent\\img";
			// 重新定义文件的全路径
			File f = new File(str + "\\" + u_id +fileName);
			// 将文件读入磁盘
			file.transferTo(f);	
			url = "./img/" + u_id + fileName;
		}else{
			url=session.getAttribute("pic").toString();
		}
		//System.out.print(url+' '+t_id+' '+type_id);
		if(t_id!=0){
			type.setT_id(t_id);
		}else{
			type.setT_id(type_id);
		}
		Goods g = new Goods();
		g.setG_id(g_id);
		g.setG_name(g_name);
		g.setType(type);
		g.setG_price(g_price);
		g.setG_detail(g_detail);
		g.setUrl(url);
		goodsBiz.updateGoods(g);
		return "forward:findGoodsBySeller.do";
	}


	@RequestMapping(value = "/findGoodsByBuyer.do")
	public String findGoodsByBuyer1(Integer index, ModelMap map,
			HttpSession session) {
		if (index == null) {
			index = 1;
		}
		int size = 5;
		String id = session.getAttribute("u_id").toString();
		Integer id1 = Integer.valueOf(id);
		int u_id = id1.intValue();
		int count = goodsBiz.countBuyGoods(u_id);
		int total = count % size == 0 ? count / size : count / size + 1;
		List<Goods> list = goodsBiz.findGoodsByBuyer(u_id, index, size);
		map.put("list", list);
		map.put("index", index);
		map.put("total", total);
		return "myOrder";
	}

	
	

	// 我买到的
	@RequestMapping(value = "/findGoodsByBuyer1.do")
	@ResponseBody
	public Map<String, Object> findGoodsByBuyer(int se_id,Integer index, ModelMap map,
			HttpSession session) {
		if (index == null) {
			index = 1;
		}
		int size = 5;
		String id="";
		if(se_id==1){
			id = session.getAttribute("se_id").toString();
		}
		else{
			id = session.getAttribute("u_id").toString();
		}
		Integer id1=Integer.valueOf(id);
		int u_id=id1.intValue();
		List<Goods> list = goodsBiz.findGoodsByBuyer(u_id, index, size);
		map.put("list", list);
		map.put("index", index);

		return map;
	}

	
	// 我发布的
	@RequestMapping(value = "/findGoodsBySeller1.do")
	@ResponseBody
	public Map<String, Object> findGoodsBySeller1(int se_id,Integer index, ModelMap map,
			HttpSession session) {
		if (index == null) {
			index = 1;
		}
		int size = 5;
		String id="";
		if(se_id==1){
			id = session.getAttribute("se_id").toString();
		}
		else{
			id = session.getAttribute("u_id").toString();
		}
		Integer id1=Integer.valueOf(id);
		int u_id=id1.intValue();
		List<Goods> list = goodsBiz.findGoodsBySeller(u_id, index, size);
		map.put("list", list);
		map.put("index", index);
		return map;
	}

	// 我卖出的商品
	@RequestMapping(value = "/findGoodsBySelled.do")
	@ResponseBody
	public Map<String, Object> findGoodsBySelled(int se_id,Integer index, ModelMap map,
			HttpSession session) {
		if (index == null) {
			index = 1;
		}
		int size = 5;
		String id="";
		if(se_id==1){
			id = session.getAttribute("se_id").toString();
		}
		else{
			id = session.getAttribute("u_id").toString();
		}
		Integer id1=Integer.valueOf(id);
		int u_id=id1.intValue();
		List<Goods> list = goodsBiz.findGoodsBySelled(u_id, index, size);
		map.put("list", list);
		map.put("index", index);
		return map;
	}




	@RequestMapping(value = "/findAllType.do")
	public String findAllType(ModelMap map) {
		List<Type> list = goodsBiz.findAllType();
		map.put("list", list);
		return "AddGoods";
	}

	@RequestMapping(value = "/findGoodsLike.do")
	public String findGoodsLike(Integer find_id, String find, Integer index,
			ModelMap map, HttpSession session) {
		if (index == null) {
			index = 1;
		}
		int size = 5;
		String id = session.getAttribute("u_id").toString();
		Integer id1 = Integer.valueOf(id);
		int u_id = id1.intValue();
		// System.out.print(find_id+find);
		int count = goodsBiz.countByFind(find_id, find, u_id);
		int total = count % size == 0 ? count / size : count / size + 1;
		List<Goods> list = goodsBiz.findGoodsLike(find_id, find, u_id, index,
				size);
		map.put("list", list);
		map.put("index", index);
		map.put("find_id", find_id);
		map.put("find", find);
		map.put("total", total);
		return "mySales";
	}

	@RequestMapping(value = "/findGoodsLike2.do")
	public String findGoodsLike2(Integer find_id, String find, Integer index,
			ModelMap map, HttpSession session) {
		if (index == null) {
			index = 1;
		}
		int size = 5;
		String id = session.getAttribute("u_id").toString();
		Integer id1 = Integer.valueOf(id);
		int u_id = id1.intValue();
		// System.out.print(find_id+find);
		int count = goodsBiz.countByBuyFind(find_id, find, u_id);
		int total = count % size == 0 ? count / size : count / size + 1;
		List<Goods> list = goodsBiz.findGoodsLike2(find_id, find, u_id, index,
				size);
		map.put("list", list);
		map.put("index", index);
		map.put("find_id", find_id);
		map.put("find", find);
		map.put("total", total);
		return "myOrder";
	}
	
	// 正在出售的
		@RequestMapping(value = "/findGoodsBySeller2.do")
		@ResponseBody
		public Map<String, Object> findGoodsBySeller2(int se_id,Integer index, ModelMap map,
				HttpSession session) {
			if (index == null) {
				index = 1;
			}
			int size = 5;
			String id = session.getAttribute("se_id").toString();
			Integer id1=Integer.valueOf(id);
			int u_id=id1.intValue();
			List<Goods> list = goodsBiz.findGoodsBySeller2(u_id, index, size);
			map.put("list", list);
			map.put("index", index);
			return map;
		}
	
	@RequestMapping(value="/personal.do")
	public String personal(){
		return "forward:personal.jsp";
	}
	
	@RequestMapping(value="/Out.do")
	public String Out(HttpSession session){
		session.removeAttribute("u_name");
		session.removeAttribute("u_id");
		return "forward:index.do";
	}
	
	@RequestMapping(value="/setUs.do")
	public String setUs(int se_id,HttpSession session){
		System.out.print(se_id);
		session.setAttribute("se_id", se_id);
		return "personal2";
	}
}
