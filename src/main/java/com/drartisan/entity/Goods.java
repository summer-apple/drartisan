package com.drartisan.entity;
// Generated 2015-11-12 18:43:46 by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.aspectj.weaver.tools.Trace;

/**
 * Goods generated by hbm2java
 */
@Entity
@Table(name = "goods", catalog = "drartisan")
public class Goods implements java.io.Serializable {

	private Integer id;
	private String name;
	private String headimg;
	private String site;
	private String location;
	private Double shipfee;
	private String currency;
	private String type;
	private String clas;
	private String link;
	private Date date;
	private String brief;
	private String description;
	private Integer state;
	private Set<Subgood> subgoods = new LinkedHashSet<>();

	public Goods() {
	}

	public Goods(String name, String headimg, String site, String location, Double shipfee,String currency, String type, String clas,
			String link,Date date,String brief,String description,Integer state) {
		this.name = name;
		this.headimg = headimg;
		this.site = site;
		this.location = location;
		this.shipfee = shipfee;
		this.currency = currency;
		this.type = type;
		this.clas = clas;
		this.link = link;
		this.date = date;
		this.brief = brief;
		this.description = description;
		this.state = state;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "headimg", length = 200)
	public String getHeadimg() {
		return this.headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}

	@Column(name = "site", length = 45)
	public String getSite() {
		return this.site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	@Column(name = "location", length = 45)
	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Column(name = "shipfee", precision = 22, scale = 0)
	public Double getShipfee() {
		return this.shipfee;
	}

	public void setShipfee(Double shipfee) {
		this.shipfee = shipfee;
	}
	
	@Column(name = "currency", length = 45)
	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	@Column(name = "type", length = 45)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "clas", length = 45)
	public String getClas() {
		return this.clas;
	}

	public void setClas(String clas) {
		this.clas = clas;
	}

	@Column(name = "link", length = 200)
	public String getLink() {
		return this.link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@OneToMany(targetEntity=Subgood.class,fetch=FetchType.EAGER)
	@JoinColumn(name="goodsid" , referencedColumnName="id",unique=true)
	public Set<Subgood> getSubgoods() {
		return subgoods;
	}

	public void setSubgoods(Set<Subgood> subgoods) {
		this.subgoods = subgoods;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date", length = 19 , updatable=false)
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Column(name = "description", length = 6000)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name = "brief", length = 300)
	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}
	@Column(name = "state")
	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}
