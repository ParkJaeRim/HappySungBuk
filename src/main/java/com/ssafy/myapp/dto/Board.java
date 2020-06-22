package com.ssafy.myapp.dto;

public class Board  {

	private int no;
	/** 아이디 */
	private String id;
	/** 이름 */
	private String title;
	/** 주소 */
	private String content;
	/** 번호 */
	private String dates;

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

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

	public Board(int no, String id, String title, String content, String dates) {
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.dates = dates;
	}

	public Board() {
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", id=" + id + ", title=" + title + ", content=" + content + ", dates=" + dates
				+ "]";
	}

}
