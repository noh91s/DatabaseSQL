package org.web.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BoardService {
	void executeQueryService(HttpServletRequest request, HttpServletResponse reponse)
	throws ServletException,IOException;
}
