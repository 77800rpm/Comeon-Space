package review.model.vo;

import java.sql.Date;

/*
 * 리뷰에 대한 vo
 */

public class Review {
	private int reviewNum;		// 리뷰 번호
	private int userNum;		// 회원 번호
	private int pNum;			// 공간 번호
	private int reserNum
	private String userProfile;	// 회원 프로필
	private String userNick;	// 회원 닉네임
	private String revContent;	// 리뷰 내용
	private String pName;		// 공간 명
	private Date revDate;		// 리뷰 날짜
	
	public Review() {}

}
