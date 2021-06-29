package common;

import java.util.HashMap;

public class PagingUtil {
	//현재 페이지 번호
	private int nowPageNo=0;
	//총 게시글 갯수
	private int totalCount=0;
	//총 게시글 페이징 갯수
	private int totalPageCount=0;
	//시작 페이지 번호
	private int startPage=0;
	//종료 페이지 번호
	private int endPage=0;
	//한 페이지당 노출되는 글 갯수
	private int rowCount=10;
	private int startNo=0;
	private int startTopNo=0;

	public PagingUtil(int nowPageNo, int totalCount){
		this.nowPageNo=nowPageNo;
		this.totalCount=totalCount;
		pagingUtilSet();
	}

	public PagingUtil(int nowPageNo, int totalCount, int rowCount){
		this.nowPageNo=nowPageNo;
		this.totalCount=totalCount;
		this.rowCount=rowCount;
		pagingUtilSet();
	}

	public void pagingUtilSet(){
		//총 페이지 갯수=총 글 갯수/페이지당 보여줄 글 갯수
		totalPageCount=totalCount/rowCount;

		if(totalCount%rowCount > 0){ //총 글 갯수 / 페이지당 보여줄 글 갯수의 나머지가 0보다 큰 경우
			totalPageCount++; //총 페이지 갯수에 1을 더한다.
		}

		if(totalPageCount<nowPageNo){ //총 페이지 갯수보다 현재 페이지 번호가 큰 경우 
			nowPageNo=totalPageCount; //현재 페이지 번호=총 페이지 갯수
			//pageNo 요청에 과다한 숫자를 고의적으로 넣는 현상 방지

		}

		//페이지 그룹에서 맨 처음 표시될 페이지 번호
		startPage=((nowPageNo-1)/10)*10+1;

		//페이지 그룹에서 맨 마지막에 표시될 페이지 번호
		endPage=startPage+rowCount-1;  //시작페이지+페이지당 보여줄 글 갯수 - 1

		if(endPage>totalPageCount){ //마지막에 표시될 페이지 번호가 전체 글 갯수보다 작다면
			endPage=totalPageCount; //마지막 페이지 번호=총 페이지 갯수
		}

		//해당 페이지 시작 넘버 세팅
		startTopNo=totalCount-((nowPageNo-1)*rowCount);
	}

	public Integer queryPageNoSet(Integer pageNo){
		return (Math.abs(nowPageNo-1))*this.rowCount;
	}

	public HashMap<String, Object> getPagingInfo(){
		HashMap<String, Object> pagingInfo=new HashMap<String, Object>();
		pagingInfo.put("nowPageNo", this.nowPageNo);
		pagingInfo.put("rowCount", this.rowCount);
		pagingInfo.put("startNo", (Math.abs(this.nowPageNo-1))*this.rowCount);
		pagingInfo.put("totalCount", this.totalCount);
		pagingInfo.put("totalPageCount", this.totalPageCount);
		pagingInfo.put("startPage", this.startPage);
		pagingInfo.put("endPage", this.endPage);
		return pagingInfo;
	}

	@Override

	public String toString(){
		return "PagingUtil [nowPageNo=" + nowPageNo + ", startNo=" + startNo + ", totalCount=" + totalCount + ", totalPageCount=" + totalPageCount + ", startPage=" + startPage + ", endPage=" + endPage + ", rowCount=" + rowCount + ", startTopNo=" + startTopNo + "]";
	}
}