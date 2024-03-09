package com.fp.shuttlecock.tradeboard;

import lombok.Builder;
import lombok.Data;

@Data
public class PageRequestDTO {

	// 현재 페이지 번호
	private int pageNum;

	// 페이지당 출력할 데이터 개수
	private int amount;

	// 검색 키워드
	private String searchKeyword;
	
	//검색 방식 title or user_userId
	private String category;
	
	// 지역번호
	private int region;

	public PageRequestDTO() {
		this(1, 10);
	}

	public PageRequestDTO(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	@Builder
	public PageRequestDTO(int pageNum, int amount, String searchKeyword) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.searchKeyword = searchKeyword;
	}

	@Builder
	public PageRequestDTO(int pageNum, int amount, String searchKeyword, String category) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.searchKeyword = searchKeyword;
		this.category = category;
	}
	
	@Builder
	public PageRequestDTO(int pageNum, int amount, String searchKeyword, String category, int region) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.searchKeyword = searchKeyword;
		this.category = category;
		this.region = region;
	}

}
