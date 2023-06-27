package org.web.dto;

import java.sql.Date;

public class BoardDto {

	private Long board0626_id;
	private String board_title;
	private String content;
	private String board_writer;
	private Date create_date;
	
	public BoardDto() {
		// TODO Auto-generated constructor stub
	}


	public BoardDto(Long board0626_id, String board_title, String content, String board_writer, Date create_date) {
		super();
		this.board0626_id = board0626_id;
		this.board_title = board_title;
		this.content = content;
		this.board_writer = board_writer;
		this.create_date = create_date;
	}


	public Long getBoard0626_id() {
		return board0626_id;
	}


	public void setBoard0626_id(Long board0626_id) {
		this.board0626_id = board0626_id;
	}


	public String getBoard_title() {
		return board_title;
	}


	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getBoard_writer() {
		return board_writer;
	}


	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}


	public Date getCreate_date() {
		return create_date;
	}


	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	
}
