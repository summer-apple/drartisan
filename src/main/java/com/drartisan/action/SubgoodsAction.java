package com.drartisan.action;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drartisan.entity.Subgood;
import com.drartisan.service.impl.SubgoodsService;

@Controller
@RequestMapping("/subgoods")
public class SubgoodsAction {
	@Autowired
	private SubgoodsService sgs;
	Logger logger = Logger.getLogger(SubgoodsAction.class);
	
	
	@RequestMapping("/qry")
	@ResponseBody
	public List<Subgood> qry(HttpServletRequest request,int pageNo,int pageSize){
		return sgs.qryAll( pageNo, pageSize);
	}
	
	
	@RequestMapping("/qry-one")
	@ResponseBody
	public Subgood qryOne(HttpServletRequest request,int id){
		return sgs.qryOne(id);
	}
	
	
	@RequestMapping("/add")
	@ResponseBody
	public Serializable add(HttpServletRequest request,Subgood subgoods){
		return sgs.add(subgoods);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Serializable update(HttpServletRequest request,Subgood subgoods){
		return sgs.update(subgoods);
	}
	
}
