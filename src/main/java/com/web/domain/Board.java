package com.web.domain;

import java.sql.Date;

public class Board {
	private int idx;
	private String title;
	private String contents;
	private String writer;
	private int count;
	private String reg_date;
	private String status;
	private int isdelete;
	private String file_path;
	
	
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(int isdelete) {
		this.isdelete = isdelete;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_fath(String file_fath) {
		this.file_path = file_path;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int idx, String title, String contents, String writer, int count,String reg_date, String status, int isdelete, String file_path) {
		super();
		this.idx = idx;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.count = count;
		this.reg_date = reg_date;
		this.status = status;
		this.isdelete = isdelete;
		this.file_path = file_path;
		
		
		
	}
}
