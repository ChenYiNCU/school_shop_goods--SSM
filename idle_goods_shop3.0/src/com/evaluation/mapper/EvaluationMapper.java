package com.evaluation.mapper;

import java.util.List;
import java.util.Map;

import com.evaluation.entity.Evaluation;

public interface EvaluationMapper {
	public List<Evaluation> findEvaBySeId(Map<String,Object> map);
	public List<Evaluation> findEvaByBuId(Map<String,Object> map);
	//总记录数
	public int count(Map<String,Object> map);
	public int count1(Map<String,Object> map);
	
	//发布评论
	public void addEva(Evaluation eva);
	
	//通过g_id查找评论
	public Evaluation findEvaByGid(int g_id);
	
}
