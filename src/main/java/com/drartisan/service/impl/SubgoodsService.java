package com.drartisan.service.impl;


import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drartisan.dao.BaseDao;
import com.drartisan.entity.Subgood;
import com.drartisan.service.ISubgoodsService;
@Service
public class SubgoodsService implements ISubgoodsService {

	@Autowired
	private BaseDao<Subgood> dao;
	
	
	public List<Subgood> qryAll(int pageNo, int pageSize) {
		String hql = "FROM Subgood ORDER BY id DESC";
		List<Subgood> list = dao.findByPage(hql, pageNo, pageSize);
		return list;
	}
	
	public Subgood qryOne(int id){
		return dao.get(Subgood.class, id);
	}
	
	
	public Serializable add(Subgood subgood) {
		try {
			return dao.save(subgood);
		} catch (Exception e) {
			return 0;
		}
		
	}
	
	
	public int update(Subgood subgood){
		try {
			dao.update(subgood);
			return subgood.getId();
		} catch (Exception e) {
			return 0;
		}
	}
	
	
	
}
