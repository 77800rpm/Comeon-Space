package enroll.model.vo;

public class Enroll {
	private int pNum;
	private String pName;
	private int pLimit;
	private int productPrice;
	private String pCategory;
	private String pIntro;
	private String pDetail;
	private String pLocation;
	private String pFacility;
	private int pCount;
	private String pApprove;
	private String status;
	private String holiday;
	private int userNum;
	
	public Enroll() {}
	
	public Enroll(int pNum, String pName, int pLimit, int productPrice, String pCategory, String pIntro, String pDetail,
			String pLocation, String pFacility, int pCount, String pApprove, String status, String holiday,
			int userNum) {
		super();
		this.pNum = pNum;
		this.pName = pName;
		this.pLimit = pLimit;
		this.productPrice = productPrice;
		this.pCategory = pCategory;
		this.pIntro = pIntro;
		this.pDetail = pDetail;
		this.pLocation = pLocation;
		this.pFacility = pFacility;
		this.pCount = pCount;
		this.pApprove = pApprove;
		this.status = status;
		this.holiday = holiday;
		this.userNum = userNum;
	}
	
	
	
	public Enroll(int pNum, String pName, int pLimit, int productPrice, String pCategory, String pIntro, String pDetail,
			String pLocation, String pFacility, int pCount, String holiday) {
		super();
		this.pNum = pNum;
		this.pName = pName;
		this.pLimit = pLimit;
		this.productPrice = productPrice;
		this.pCategory = pCategory;
		this.pIntro = pIntro;
		this.pDetail = pDetail;
		this.pLocation = pLocation;
		this.pFacility = pFacility;
		this.pCount = pCount;
		this.holiday = holiday;
	}

	public Enroll(int pNum, String pName, int productPrice, String pCategory, String pIntro, String pLocation,
			int pCount) {
		super();
		this.pNum = pNum;
		this.pName = pName;
		this.productPrice = productPrice;
		this.pCategory = pCategory;
		this.pIntro = pIntro;
		this.pLocation = pLocation;
		this.pCount = pCount;
	}
	

	

	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpLimit() {
		return pLimit;
	}
	public void setpLimit(int pLimit) {
		this.pLimit = pLimit;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	public String getpIntro() {
		return pIntro;
	}
	public void setpIntro(String pIntro) {
		this.pIntro = pIntro;
	}
	public String getpDetail() {
		return pDetail;
	}
	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}
	public String getpLocation() {
		return pLocation;
	}
	public void setpLocation(String pLocation) {
		this.pLocation = pLocation;
	}
	public String getpFacility() {
		return pFacility;
	}
	public void setpFacility(String pFacility) {
		this.pFacility = pFacility;
	}
	public int getpCount() {
		return pCount;
	}
	public void setpCount(int pCount) {
		this.pCount = pCount;
	}
	public String getpApprove() {
		return pApprove;
	}
	public void setpApprove(String pApprove) {
		this.pApprove = pApprove;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	@Override
	public String toString() {
		return "Enroll [pNum=" + pNum + ", pName=" + pName + ", pLimit=" + pLimit + ", productPrice=" + productPrice
				+ ", pCategory=" + pCategory + ", pIntro=" + pIntro + ", pDetail=" + pDetail + ", pLocation="
				+ pLocation + ", pFacility=" + pFacility + ", pCount=" + pCount + ", pApprove=" + pApprove + ", status="
				+ status + ", holiday=" + holiday + ", userNum=" + userNum + "]";
	}
	
	
}
