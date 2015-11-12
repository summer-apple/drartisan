package com.drartisan.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drartisan.dao.BaseDao;
import com.drartisan.entity.Goods;
import com.drartisan.service.IGoodsService;
@Service
public class GoodsService implements IGoodsService {

	@Autowired
	private BaseDao<Goods> dao;
	
	
	public Map<String, Object> qryAll(int pageNo, int pageSize) {
		String hql = "FROM Goods ORDER BY id DESC";
		List<Goods> list = dao.findByPage(hql, pageNo, pageSize);
		long amount = dao.findCount("SELECT COUNT(*) " + hql);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		if (amount == 0) {
			map.put("amount", 0);
		} else if (amount <= pageSize) {
			map.put("amount", 1);
		}else if (amount%pageSize==0) {
			map.put("amount", amount/pageSize);
		} else {
			map.put("amount", amount / pageSize + 1);
		}
		return map;
	}
	
	
	
	
	
}
