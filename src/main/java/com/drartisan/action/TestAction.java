package com.drartisan.action;

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
@RequestMapping("/test")
public class TestAction {

	@Autowired
	private GoodsService gs;
	Logger logger = Logger.getLogger(TestAction.class);
	
	
	@RequestMapping("/fuck")
	@ResponseBody
	public Map<String,Object> qry(HttpServletRequest request){
		return gs.qryAll(0,10);
	}
}
