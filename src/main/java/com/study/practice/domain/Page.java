package com.study.practice.domain;

public class Page {
	
	// 현제 페이지 번호
	private int num;
	
	// 게시물 총 갯수
	private int count;
	
	// 한 페이지에 출력할 게시물 갯수
	private int postNum = 5;
	
	// 하단 페이징 번호([ 게시물 총 갯수 % 한 페이지에 출력할 갯수]의 올림)
	private int pageNum;
	
	// 출력할 게시물
	private int displayPost;
	
	// 한번에 표시할 페이징 번호의 갯수
	int pageNum_count = 5;
	
	// 표시되는 페이지 번호 중 첫번째 번호
	int startPageNum;
	
	// 표시되는 페이지 번호 중 마지막 번호
	int endPageNum;
	
	// 다음/이전 표시 여부
	private boolean prev;
	private boolean next;
	
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public void setCount(int count) {
		this.count = count;
		dataCalc();
	}
	
	public int getCount() {
		return count;
	}
	
	public int getPostNum() {
		return postNum;
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public int getDisplayPost() {
		return displayPost;
	}
	public int getPageNum_count() {
		return pageNum_count;
	}
	public int getEndPageNum() {
		return endPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public boolean getPrev() {
		return prev;
	}
	public boolean getNext() {
		return next;
	}
	
	// 데이터들을 계산하는 메서드
	private void dataCalc() {
		
		// 마지막 번호
		endPageNum = (int)(Math.ceil((double)num / (double)pageNum_count) * pageNum_count);
		
		// 시작 번호
		startPageNum = endPageNum - (pageNum_count - 1);
		
		// 마지막 번호 재계산
		int endPageNum_count = (int)(Math.ceil( (double)count / (double)pageNum_count ) );
		
		if (endPageNum > endPageNum_count) {
			endPageNum = endPageNum_count;
		}
		
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * pageNum_count >= count ? false : true;
		
		displayPost = (num - 1) * postNum;
	}
	
	
	// 검색 타입과 검색어 
	/*
	private String searchTypeKeyword;
	
	public void setSearchTypeKeyword(String searchType, String keyword) {
		if(searchType.equals("") || keyword.equals("")) 
			searchTypeKeyword = "";
		searchTypeKeyword = "&searchType=" + searchType + "&keyword=" + keyword;
	}
	*/
	
	private String searchType;
	private String keyword;
	
	public String getSearchTypeKeyword() {
		
		if (searchType.equals("") || keyword.equals("")) 
			return "";
		return "&searchType=" + searchType + "&keyword=" + keyword;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getSearchType() {
		return searchType;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getKeyword() {
		return keyword;
	}
}
