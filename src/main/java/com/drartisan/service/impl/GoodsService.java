package com.drartisan.service.impl;


import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drartisan.dao.BaseDao;
import com.drartisan.entity.Goods;
import com.drartisan.entity.Subgood;
import com.drartisan.service.IGoodsService;
@Service
public class GoodsService implements IGoodsService {

	@Autowired
	private BaseDao<Goods> dao;
	@Autowired
	private BaseDao<Subgood> sdao;
	@Autowired
	private ExchangeRateService ers;
	
	public Map<String, Object> qryAll(int pageNo, int pageSize) {
		String hql = "FROM Goods ORDER BY id DESC";
		List<Goods> list = dao.findByPage(hql, pageNo, pageSize);
		
		for(int i=0;i<list.size();i++){
			Goods goods = list.get(i);
			
			double rate = ers.getRequest3(goods.getCurrency(), "CNY");
			
			if (!goods.getCurrency().equals("CNY")) {
				
				goods.setShipfee( (double)Math.round(rate * goods.getShipfee()));
				
				for(Subgood subgood : goods.getSubgoods()){
					subgood.setPrice(subgood.getOprice() * rate);
					sdao.update(subgood);
				}	
			}	
			
		}
		
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
	
	public Goods qryOne(int id){
		Goods goods = dao.get(Goods.class, id);
		double rate = ers.getRequest3(goods.getCurrency(), "CNY");
		
		if (!goods.getCurrency().equals("CNY")) {
			
			goods.setShipfee( (double)Math.round(rate * goods.getShipfee()));
			
			for(Subgood subgood : goods.getSubgoods()){
				subgood.setPrice((double)Math.round(subgood.getOprice() * rate));
			}	
		}	

		return goods;
	}
	
	
	public Serializable add(Goods goods) {
		goods.setDate(new Date());
		try {
			return dao.save(goods);
		} catch (Exception e) {
			return 0;
		}
		
	}
	
	
	public int update(Goods goods){
		try {
			dao.update(goods);
			return goods.getId();
		} catch (Exception e) {
			return 0;
		}
	}
	
	
	
}
