package in.co.pro4.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.co.pro4.utility.ServletUtility;

/**
 * 
 * Main Controller performs session checking and logging operations before
 * calling any application controller. It prevents any user to access
 * application without login.
 * 
 *
 */



/**
 * Servlet implementation class FrontControlerCtl
 */
/**
 * @author Sanjay Kumar
 *
 */
@WebFilter(filterName = "FrontCtl", urlPatterns = { "/ctl/*", "/doc/*" })
public class FrontControler implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();

		if (session.getAttribute("user") == null) {
			ServletUtility.setErrorMessage("Your Session has been Expired...... Please Login Again", req);

	
			 String str = req.getRequestURI();

			req.setAttribute("uri", str);
			ServletUtility.forward(ORSView.LOGIN_VIEW, req, resp);
			return;
		} else {
			chain.doFilter(req, resp);			
		}
	}

	@Override
	public void destroy() {

	}

}
