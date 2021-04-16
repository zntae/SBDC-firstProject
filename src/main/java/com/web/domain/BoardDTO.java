package com.web.domain;

import com.web.utils.PagingVO;

public class BoardDTO {
	private PagingVO vo;
	private String keywordInput;
	private String searchType;
	
	
	
	public BoardDTO(PagingVO vo, String keywordInput, String searchType) {
		super();
		this.vo = vo;
		this.keywordInput = keywordInput;
		this.searchType = searchType;
	}

	public PagingVO getVo() {
		return vo;
	}

	public String getKeywordInput() {
		return keywordInput;
	}
	
	public String getSearchType() {
		return searchType;
	}	

	

}
