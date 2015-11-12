package com.drartisan.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
