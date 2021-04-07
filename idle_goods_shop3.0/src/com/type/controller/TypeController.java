package com.type.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.type.biz.TypeBiz;


@Controller
@RequestMapping("type")
public class TypeController {
	@Autowired
	private TypeBiz typeBiz;
}
