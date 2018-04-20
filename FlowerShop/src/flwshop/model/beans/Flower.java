package flwshop.model.beans;

import java.io.Serializable;

public class Flower implements Serializable {
	private int id;
	private String name;
	private int price;
	private String detail;
	private String description;
	private String review;
	private String imgPath;
	private int cateID;
	public Flower(int id, String name, int price, String detail, String description, String review, String imgPath,
			int cateID) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.detail = detail;
		this.description = description;
		this.review = review;
		this.imgPath = imgPath;
		this.cateID = cateID;
	}
	public Flower() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getCateID() {
		return cateID;
	}
	public void setCateID(int cateID) {
		this.cateID = cateID;
	}
	
}
