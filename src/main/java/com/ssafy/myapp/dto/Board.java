package com.ssafy.myapp.dto;

import java.sql.Timestamp;
import java.util.Date;

public class Board {

	private int no;
	/** 아이디 */
	private String id;
	/** 이름 */
	private String title;
	/** 주소 */
	private String content;
	/** 번호 */
	private Timestamp date;

	public Board(int no, String id, String title, String content, Timestamp date) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public Board() {
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", id=" + id + ", title=" + title + ", content=" + content + ", date=" + date + "]";
	}

}
