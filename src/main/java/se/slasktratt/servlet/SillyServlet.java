package se.slasktratt.servlet;

import java.io.IOException;
import java.net.InetAddress;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SillyServlet extends HttpServlet {

	private static final long serialVersionUID = -921677652584606111L;
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("host", InetAddress.getLocalHost().getHostName());
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);
	}

}
