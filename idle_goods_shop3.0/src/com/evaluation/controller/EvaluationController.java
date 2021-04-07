package com.evaluation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.evaluation.biz.EvaluationBiz;
import com.evaluation.entity.Evaluation;
import com.evaluation.entity.User;
import com.goods.entity.Goods;


//通过卖家查找
@Controller
public class EvaluationController {
	@Autowired
	private EvaluationBiz evaluationBiz;
	
	
	@RequestMapping(value="/findEvaBySeId.do")
	@ResponseBody
//	public String findEvaBySeId(Integer index,int se_id,ModelMap map) {
	public Map<String,Object> findEvaBySeId(Integer se_id,Integer index,ModelMap map,HttpSession session) {
		if(index==null) {
			index = 1;
		}
		int size = 8;
		String id="";
		if(se_id==1){
			id = session.getAttribute("se_id").toString();
		}
		else{
			id = session.getAttribute("u_id").toString();
		}
		Integer id1=Integer.valueOf(id);
		se_id=id1.intValue();
		List<Evaluation> list = evaluationBiz.findEvaBySeId(index, size, se_id);
		int count = evaluationBiz.count(se_id);
		int total = count%size == 0?count/size:count/size+1;
	
		map.put("list",list);
		map.put("index",index);
		map.put("se_id",se_id);
		map.put("total",total);
		return map;
	}
	
//通过买家id查找
	@RequestMapping(value="/findEvaByBuId.do")
	@ResponseBody
//	public String findEvaBySeId(Integer index,int bu_id,ModelMap map) {
	public String findEvaByBuId(Integer index,ModelMap map,HttpSession session) {
		if(index==null) {
			index = 1;
		}
		int size = 8;
		String id=session.getAttribute("u_id").toString();
		Integer id1=Integer.valueOf(id);
		int bu_id=id1.intValue();
		List<Evaluation> list = evaluationBiz.findEvaByBuId(index, size, bu_id);
		int count = evaluationBiz.count1(bu_id);
		int total = count%size == 0?count/size:count/size+1;
		map.put("list_1",list);
		map.put("index_1",index);
		map.put("bu_id",bu_id);
		map.put("total_1",total);
		return "personal";
	}
	
	@RequestMapping(value="/addEva.do")
	public String addEva(int g_id,int se_id,int bu_id,String e_content,int e_score) {
		Evaluation eva = new Evaluation();
		Goods goods = new Goods();
		User seller = new User();
		User buyer = new User();
		goods.setG_id(g_id);
		seller.setU_id(se_id);
		buyer.setU_id(bu_id);
		eva.setGoods(goods);
		eva.setSeller(seller);
		eva.setBuyer(buyer);
		eva.setE_content(e_content);
		eva.setE_score(e_score);
		evaluationBiz.addEva(eva);
		return "forward:findGoodsByBuyer.do";
	}
	
	@RequestMapping(value="/findEvaByGid.do")
	@ResponseBody
	public Map<String,Object> findEvaByGid(int g_id,ModelMap map) {
		Evaluation eva = evaluationBiz.findEvaByGid(g_id);
		map.put("eva",eva);
		return map;
	}
}
