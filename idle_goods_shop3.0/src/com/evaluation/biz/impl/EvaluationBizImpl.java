package com.evaluation.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.evaluation.biz.EvaluationBiz;
import com.evaluation.entity.Evaluation;
import com.evaluation.mapper.EvaluationMapper;


@Service("evaluationBiz")
public class EvaluationBizImpl implements EvaluationBiz{
	@Autowired
	private EvaluationMapper evaluationMapper;

	@Override
	public List<Evaluation> findEvaBySeId(int index, int size, int se_id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("index",index);
		map.put("size",size);
		map.put("u_id",se_id);
		List<Evaluation> list = evaluationMapper.findEvaBySeId(map);
		return list;
	}

	@Override
	public List<Evaluation> findEvaByBuId(int index, int size, int bu_id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("index",index);
		map.put("size",size);
		map.put("u_id",bu_id);
		List<Evaluation> list = evaluationMapper.findEvaByBuId(map);
		return list;
	}

	@Override
	public int count(int u_id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("u_id",u_id);
		int count = evaluationMapper.count(map);
		return count;
	}
	@Override
	public int count1(int u_id) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("u_id",u_id);
		int count = evaluationMapper.count(map);
		return count;
	}

	@Override
	public void addEva(Evaluation eva) {
		evaluationMapper.addEva(eva);
	}

	@Override
	public Evaluation findEvaByGid(int g_id) {
		Evaluation eva = evaluationMapper.findEvaByGid(g_id);
		return eva;
	}
}
