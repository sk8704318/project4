package in.co.pro4.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.pro4.utility.ServletUtility;

/**
 * 
 * Welcome functionality Controller.
 * Performs operation for Show Welcome page
 * 
 *
 */



/**
 * Servlet implementation class WelcomeCtl
 * @author Sanjay Kumar
 *
 */
@WebServlet(name = "WelcomeCtl", urlPatterns = { "/WelcomeCtl" })
public class WelcomeCtl extends BaseCtl {

	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(WelcomeCtl.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.co.pro4.controller.BaseCtl#getView()
	 */
	@Override
	protected String getView() {
		return ORSView.WELCOME_VIEW;
	}

	/**
	 * Contains display logic.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("WelcomeCtl Doget Method Started");

		ServletUtility.forward(getView(), request, response);
 
		log.debug("WelcomeCtl Doget Method Ended");

	}

}
