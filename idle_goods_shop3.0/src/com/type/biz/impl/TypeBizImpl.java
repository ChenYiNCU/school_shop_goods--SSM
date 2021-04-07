package com.type.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.type.biz.TypeBiz;
import com.type.mapper.TypeMapper;


@Service("typeBiz")
public class TypeBizImpl implements TypeBiz{
	@Autowired
	private TypeMapper typeMapper;
}
