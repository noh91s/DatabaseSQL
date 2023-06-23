package org.web.dto;

import java.util.Date;

public class EmployeeDto {
	private long emp_id;
	private String emp_name;
	private String emp_depart;
	private String emp_email;
	private Date create_date;
	
	
	public EmployeeDto() {
		super();
	}


	public EmployeeDto(long emp_id, String emp_name, String emp_depart, String emp_email, Date create_date) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.emp_depart = emp_depart;
		this.emp_email = emp_email;
		this.create_date = create_date;
	}


	public long getEmp_id() {
		return emp_id;
	}


	public void setEmp_id(long emp_id) {
		this.emp_id = emp_id;
	}


	public String getEmp_name() {
		return emp_name;
	}


	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}


	public String getEmp_depart() {
		return emp_depart;
	}


	public void setEmp_depart(String emp_depart) {
		this.emp_depart = emp_depart;
	}


	public String getEmp_email() {
		return emp_email;
	}


	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}


	public Date getCreate_date() {
		return create_date;
	}


	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	
	
	
	
}
