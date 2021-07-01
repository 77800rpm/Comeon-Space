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