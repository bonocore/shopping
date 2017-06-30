package it.rh.demo.model;

import java.io.Serializable;

public class Product implements Serializable{
	
	private String id;
	private String description;
	private String price;
	private String icon;
	
	
	
	public Product() {
		super();
	}
	public Product(String id, String description, String price, String icon) {
		super();
		this.id = id;
		this.description = description;
		this.price = price;
		this.icon = icon;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", description=" + description + ", price=" + price + ", icon=" + icon + "]";
	}
	
	
	
	

}
