package review.model.vo;

import java.sql.Date;

	/*
	 * 리뷰에 대한 vo
	 */

	public class Review {
		private int reviewNum;		// 리뷰 번호
		private int userNum;		// 회원 번호
		private int prodNum;			// 공간 번호
		private int orderNum;		// 주문 번호
		private String buyerName;	// 회원 프로필
		private String buyerNic;	// 회원 닉네임
		private String revContent;	// 리뷰 내용
		private String revTitle;	// 공간 명
		private String prodName;	// 공간 명
		private Date revDate;
		private int star;
		private double avgStar;
		private int countReview;
		
		
		public Review() {}

		public Review(int userNum, int prodNum, int orderNum, String buyerName, String buyerNic, String revContent,
				String revTitle, String prodName) {
			super();
			this.userNum = userNum;
			this.prodNum = prodNum;
			this.orderNum = orderNum;
			this.buyerName = buyerName;
			this.buyerNic = buyerNic;
			this.revContent = revContent;
			this.revTitle = revTitle;
			this.prodName = prodName;
		}
		
		
		public Review(int reviewNum, int userNum, int prodNum, int orderNum, String buyerName, String buyerNic,
				String revContent, String revTitle, String prodName, Date revDate, int star) {
			super();
			this.reviewNum = reviewNum;
			this.userNum = userNum;
			this.prodNum = prodNum;
			this.orderNum = orderNum;
			this.buyerName = buyerName;
			this.buyerNic = buyerNic;
			this.revContent = revContent;
			this.revTitle = revTitle;
			this.prodName = prodName;
			this.revDate = revDate;
			this.star = star;
		}
		
		public Review(int reviewNum, int userNum, int prodNum, int orderNum, String buyerName, String buyerNic,
				String revContent, String revTitle, String prodName, Date revDate, int star, double avgStar,
				int countReview) {
			super();
			this.reviewNum = reviewNum;
			this.userNum = userNum;
			this.prodNum = prodNum;
			this.orderNum = orderNum;
			this.buyerName = buyerName;
			this.buyerNic = buyerNic;
			this.revContent = revContent;
			this.revTitle = revTitle;
			this.prodName = prodName;
			this.revDate = revDate;
			this.star = star;
			this.avgStar = avgStar;
			this.countReview = countReview;
		}
		
		public double getAvgStar() {
			return avgStar;
		}

		public void setAvgStar(double avgStar) {
			this.avgStar = avgStar;
		}

		public int getCountReview() {
			return countReview;
		}

		public void setCountReview(int countReview) {
			this.countReview = countReview;
		}

		public Date getRevDate() {
			return revDate;
		}

		public void setRevDate(Date revDate) {
			this.revDate = revDate;
		}

		public int getStar() {
			return star;
		}

		public void setStar(int star) {
			this.star = star;
		}

		public int getReviewNum() {
			return reviewNum;
		}

		public void setReviewNum(int reviewNum) {
			this.reviewNum = reviewNum;
		}

		public int getUserNum() {
			return userNum;
		}

		public void setUserNum(int userNum) {
			this.userNum = userNum;
		}

		public int getProdNum() {
			return prodNum;
		}

		public void setProdNum(int prodNum) {
			this.prodNum = prodNum;
		}

		public int getOrderNum() {
			return orderNum;
		}

		public void setOrderNum(int orderNum) {
			this.orderNum = orderNum;
		}

		public String getBuyerName() {
			return buyerName;
		}

		public void setBuyerName(String buyerName) {
			this.buyerName = buyerName;
		}

		public String getBuyerNic() {
			return buyerNic;
		}

		public void setBuyerNic(String buyerNic) {
			this.buyerNic = buyerNic;
		}

		public String getRevContent() {
			return revContent;
		}

		public void setRevContent(String revContent) {
			this.revContent = revContent;
		}

		public String getRevTitle() {
			return revTitle;
		}

		public void setRevTitle(String revTitle) {
			this.revTitle = revTitle;
		}

		public String getProdName() {
			return prodName;
		}

		public void setProdName(String prodName) {
			this.prodName = prodName;
		}

		@Override
		public String toString() {
			return "Review [reviewNum=" + reviewNum + ", userNum=" + userNum + ", prodNum=" + prodNum + ", orderNum="
					+ orderNum + ", buyerName=" + buyerName + ", buyerNic=" + buyerNic + ", revContent=" + revContent
					+ ", revTitle=" + revTitle + ", prodName=" + prodName + "]";
		}

		
}