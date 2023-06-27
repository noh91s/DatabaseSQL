package org.web.dto;

import java.sql.Date;

public class MemberDto {

	private Long member0626_id;
	private String name;
	private String password;
	private String email;
	private Date create_date;

	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	public MemberDto(Long member0626_id, String name, String password, String email, Date create_date) {
		super();
		this.member0626_id = member0626_id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.create_date = create_date;
	}

	public Long getMember0626_id() {
		return member0626_id;
	}

	public void setMember0626_id(Long member0626_id) {
		this.member0626_id = member0626_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

}
