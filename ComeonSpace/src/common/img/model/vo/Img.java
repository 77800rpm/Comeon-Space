package common.img.model.vo;

public class Img {
	private int imgNum;
	private int userNum;
	private int imgLevel;
	private String imgCategory;
	private String imgOrigin;
	private String imgChange;
	private String imgPath;
	private String status;
	
	public Img() {}

	public Img(int imgNum, int userNum, int imgLevel, String imgCategory, String imgOrigin, String imgChange,
			String imgPath, String status) {
		super();
		this.imgNum = imgNum;
		this.userNum = userNum;
		this.imgLevel = imgLevel;
		this.imgCategory = imgCategory;
		this.imgOrigin = imgOrigin;
		this.imgChange = imgChange;
		this.imgPath = imgPath;
		this.status = status;
	}

	public int getImgNum() {
		return imgNum;
	}

	public void setImgNum(int imgNum) {
		this.imgNum = imgNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getImgLevel() {
		return imgLevel;
	}

	public void setImgLevel(int imgLevel) {
		this.imgLevel = imgLevel;
	}

	public String getImgCategory() {
		return imgCategory;
	}

	public void setImgCategory(String imgCategory) {
		this.imgCategory = imgCategory;
	}

	public String getImgOrigin() {
		return imgOrigin;
	}

	public void setImgOrigin(String imgOrigin) {
		this.imgOrigin = imgOrigin;
	}

	public String getImgChange() {
		return imgChange;
	}

	public void setImgChange(String imgChange) {
		this.imgChange = imgChange;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
