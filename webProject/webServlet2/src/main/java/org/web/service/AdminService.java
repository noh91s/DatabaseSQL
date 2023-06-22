package org.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AdminService {
	void executeQuerySerivce(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException;
}
