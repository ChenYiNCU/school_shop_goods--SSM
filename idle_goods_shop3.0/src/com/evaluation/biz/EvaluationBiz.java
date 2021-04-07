package com.evaluation.biz;

import java.util.List;

import com.evaluation.entity.Evaluation;

public interface EvaluationBiz {
	public List<Evaluation> findEvaBySeId(int index,int size,int se_id);
	public List<Evaluation> findEvaByBuId(int index,int size,int bu_id);
	public int count(int u_id);
	public int count1(int u_id);
	//·¢²¼ÆÀÂÛ
	public void addEva(Evaluation eva);
	
	public Evaluation findEvaByGid(int g_id);
}
