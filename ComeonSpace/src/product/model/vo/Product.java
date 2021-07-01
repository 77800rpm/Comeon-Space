package product.model.vo;

public class Product {
	private Integer productNum;
	private String productName;
	private Integer productPrice;
	private String productCategory;
	private String productIntro;
	private String productDetail;
	private String productLocation;
	private String productFac;
	private Integer productCount;
	private Integer productVisit;
	private String productApprove;
	private String productStatus;
	private Integer userNum;
	private Integer latitude;
	private Integer logitude;
	private Integer productLimit;
	private String productHoliday;
	
	//이미지 정보 전용
	private Integer imgNum;
	private String imgTitle;
	private Integer imgLevel;
	private String imgCategory;
	private String imgOrigin;
	private String imgChange;
	private String imgPath;
	private String imgStatus;
	private Integer imgBoardId;
	private Integer imgUserNum;
	
	public Product(){
		
	}
	
	public Product(Integer productNum, String productName){
		super();
		this.productNum = productNum;
		this.productName = productName;
	}
	
	public Product(Integer productNum, String productName, Integer productPrice, String productCategory,
			String productIntro, String productDetail, String productLocation, String productFac, Integer productCount,
			Integer productVisit, String productApprove, String productStatus, Integer userNum, Integer latitude,
			Integer logitude, Integer productLimit, String productHoliday) {
		super();
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productCategory = productCategory;
		this.productIntro = productIntro;
		this.productDetail = productDetail;
		this.productLocation = productLocation;
		this.productFac = productFac;
		this.productCount = productCount;
		this.productVisit = productVisit;
		this.productApprove = productApprove;
		this.productStatus = productStatus;
		this.userNum = userNum;
		this.latitude = latitude;
		this.logitude = logitude;
		this.productLimit = productLimit;
		this.productHoliday = productHoliday;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductIntro() {
		return productIntro;
	}
	public void setProductIntro(String productIntro) {
		this.productIntro = productIntro;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public String getProductLocation() {
		return productLocation;
	}
	public void setProductLocation(String productLocation) {
		this.productLocation = productLocation;
	}
	public String getProductFac() {
		return productFac;
	}
	public void setProductFac(String productFac) {
		this.productFac = productFac;
	}
	public Integer getProductCount() {
		return productCount;
	}
	public void setProductCount(Integer productCount) {
		this.productCount = productCount;
	}
	public Integer getProductVisit() {
		return productVisit;
	}
	public void setProductVisit(Integer productVisit) {
		this.productVisit = productVisit;
	}
	public String getProductApprove() {
		return productApprove;
	}
	public void setProductApprove(String productApprove) {
		this.productApprove = productApprove;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public Integer getUserNum() {
		return userNum;
	}
	public void setUserNum(Integer userNum) {
		this.userNum = userNum;
	}
	public Integer getLatitude() {
		return latitude;
	}
	public void setLatitude(Integer latitude) {
		this.latitude = latitude;
	}
	public Integer getLogitude() {
		return logitude;
	}
	public void setLogitude(Integer logitude) {
		this.logitude = logitude;
	}
	public Integer getProductLimit() {
		return productLimit;
	}
	public void setProductLimit(Integer productLimit) {
		this.productLimit = productLimit;
	}
	public String getProductHoliday() {
		return productHoliday;
	}
	public void setProductHoliday(String productHoliday) {
		this.productHoliday = productHoliday;
	}
	
	//IMG 전용
	public Integer getImgNum() {
		return imgNum;
	}

	public void setImgNum(Integer imgNum) {
		this.imgNum = imgNum;
	}

	public String getImgTitle() {
		return imgTitle;
	}

	public void setImgTitle(String imgTitle) {
		this.imgTitle = imgTitle;
	}

	public Integer getImgLevel() {
		return imgLevel;
	}

	public void setImgLevel(Integer imgLevel) {
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

	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}

	public Integer getImgBoardId() {
		return imgBoardId;
	}

	public void setImgBoardId(Integer imgBoardId) {
		this.imgBoardId = imgBoardId;
	}

	public Integer getImgUserNum() {
		return imgUserNum;
	}

	public void setImgUserNum(Integer imgUserNum) {
		this.imgUserNum = imgUserNum;
	}

	@Override
	public String toString() {
		return "Product [productNum=" + productNum + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productCategory=" + productCategory + ", productIntro=" + productIntro + ", productDetail="
				+ productDetail + ", productLocation=" + productLocation + ", productFac=" + productFac
				+ ", productCount=" + productCount + ", productVisit=" + productVisit + ", productApprove="
				+ productApprove + ", productStatus=" + productStatus + ", userNum=" + userNum + ", latitude="
				+ latitude + ", logitude=" + logitude + ", productLimit=" + productLimit + ", productHoliday="
				+ productHoliday + ", imgNum=" + imgNum + ", imgTitle=" + imgTitle + ", imgLevel=" + imgLevel
				+ ", imgCategory=" + imgCategory + ", imgOrigin=" + imgOrigin + ", imgChange=" + imgChange
				+ ", imgPath=" + imgPath + ", imgStatus=" + imgStatus + ", imgBoardId=" + imgBoardId + ", imgUserNum="
				+ imgUserNum + "]";
	}
}