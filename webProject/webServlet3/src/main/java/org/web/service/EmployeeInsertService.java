package org.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.web.dao.EmployeeDao;

public class EmployeeInsertService implements EmployeeService{
	@Override
	public void executeQueryService(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
			System.out.println("직원등록");
			
			String emp_name=request.getParameter("emp_name");
			String emp_depart=request.getParameter("emp_depart");
			String emp_email=request.getParameter("emp_email");
			
			EmployeeDao dao= EmployeeDao.getInstance();
			int rs=dao.insert(emp_name,emp_depart,emp_email);

			String returnURL="";
			if(rs!=1) {
				System.out.println("Fail!");
				returnURL="/joinfail.jsp";
			}else {
				System.out.println("Success!");
				returnURL="/joinsuccess.jsp";
			}
			
			request.setAttribute("returnURL", returnURL);
	}
}
