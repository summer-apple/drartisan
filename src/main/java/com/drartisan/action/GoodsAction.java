package com.drartisan.action;

import java.io.Serializable;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.drartisan.entity.Goods;
import com.drartisan.service.impl.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsAction {
	@Autowired
	private GoodsService gs;
	Logger logger = Logger.getLogger(GoodsAction.class);
	
	
	@RequestMapping("/qry")
	@ResponseBody
	public Map<String,Object> qry(HttpServletRequest request,int pageNo,int pageSize){
		return gs.qryAll( pageNo, pageSize);
	}
	
	@RequestMapping("/qry-by-state")
	@ResponseBody
	public Map<String,Object> qryByState(HttpServletRequest request,int state,int pageNo,int pageSize){
		return gs.qryByState(state, pageNo, pageSize);
	}
	
	
	@RequestMapping("/qry-one")
	@ResponseBody
	public Goods qryOne(HttpServletRequest request,int id){
		return gs.qryOne(id);
	}
	
	
	@RequestMapping("/add")
	@ResponseBody
	public Serializable add(HttpServletRequest request,Goods goods){
		return gs.add(goods);
	}
	
	@RequestMapping("/change-state")
	@ResponseBody
	public boolean changeState(HttpServletRequest request,int id,int state){
		return gs.changeState(id, state);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Serializable update(HttpServletRequest request,Goods goods){
		return gs.update(goods);
	}
	
}
