package in.co.pro4.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.pro4.bean.BaseBean;
import in.co.pro4.bean.CollegeBean;
import in.co.pro4.bean.CourseBean;
import in.co.pro4.bean.FacultyBean;
import in.co.pro4.bean.SubjectBean;
import in.co.pro4.exception.ApplicationException;
import in.co.pro4.exception.DuplicateRecordException;
import in.co.pro4.model.CollegeModel;
import in.co.pro4.model.CourseModel;
import in.co.pro4.model.FacultyModel;
import in.co.pro4.model.SubjectModel;
import in.co.pro4.utility.DataUtility;
import in.co.pro4.utility.DataValidator;
import in.co.pro4.utility.PropertyReader;
import in.co.pro4.utility.ServletUtility;

/**
 * Faculty functionality Controller. 
 * 
 *
 */



/**
 * Servlet implementation class FacultyCtl
 */
/**
 * @author Sanjay Kumar
 *
 */
@WebServlet(name = "FacultyCtl", urlPatterns = { "/ctl/FacultyCtl" })
public class FacultyCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(FacultyCtl.class);

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * in.co.pro4.controller.BaseCtl#preload(javax.servlet.http.HttpServletRequest)
	 */
	protected void preload(HttpServletRequest request) {

		System.out.println("preload  in ");

		CourseModel cmodel = new CourseModel();
		CollegeModel comodel = new CollegeModel();
		SubjectModel smodel = new SubjectModel();

		List<CourseBean> clist = new ArrayList<CourseBean>();
		List<CollegeBean> colist = new ArrayList<CollegeBean>();
		List<SubjectBean> slist = new ArrayList<SubjectBean>();

		try {
			clist = cmodel.list();
			request.setAttribute("CourseList", clist);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			colist = comodel.list();
			request.setAttribute("CollegeList", colist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {

			slist = smodel.list();
			request.setAttribute("SubjectList", slist);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * in.co.pro4.controller.BaseCtl#validate(javax.servlet.http.HttpServletRequest)
	 */
	protected boolean validate(HttpServletRequest request) {

		System.out.println("validate  in ");

		log.debug("Validate Method of Faculty Ctl Started");
		boolean pass = true;
		if (DataValidator.isNull(request.getParameter("firstname"))) {
			request.setAttribute("firstname", PropertyReader.getValue("error.require", "First Name "));
			pass = false;
		} else if (!DataValidator.isName(request.getParameter("firstname"))) {
			request.setAttribute("firstname", "First Name contains alphabet only");
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("lastname"))) {
			request.setAttribute("lastname", PropertyReader.getValue("error.require", "Last Name "));
			pass = false;
		} else if (!DataValidator.isName(request.getParameter("lastname"))) {
			request.setAttribute("lastname", "Last Name contains alphabet only");
			pass = false;

		}
		if (DataValidator.isNull(request.getParameter("gender"))) {
			request.setAttribute("gender", PropertyReader.getValue("error.require", "Gender "));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("loginid"))) {
			request.setAttribute("loginid", PropertyReader.getValue("error.require", "Login Id "));
			pass = false;
		} else if (!DataValidator.isEmail(request.getParameter("loginid"))) {
			request.setAttribute("loginid", "Login Id is invalid Email Id");
			pass = false;
		}
		if (DataValidator.isNull(request.getParameter("mobileno"))) {
			request.setAttribute("mobileno", PropertyReader.getValue("error.require", "MobileNo "));
			pass = false;
		} else if (!DataValidator.isMobileNo(request.getParameter("mobileno"))) {
			request.setAttribute("mobileno", "Mobile No. must be 10 Digit and No. Series start with 6-9");
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("dob"))) {
			request.setAttribute("dob", PropertyReader.getValue("error.require", "Date Of Birth "));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("collegeid"))) {
			request.setAttribute("collegeid", PropertyReader.getValue("error.require", "College Name "));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("courseid"))) {
			request.setAttribute("courseid", PropertyReader.getValue("error.require", "Course Name "));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("subjectid"))) {
			request.setAttribute("subjectid", PropertyReader.getValue("error.require", "Subject Name "));
			pass = false;
		}

		// System.out.println("validate out ");
		log.debug("validate Ended");
		return pass;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.co.pro4.controller.BaseCtl#populatebean(javax.servlet.http.
	 * HttpServletRequest)
	 */
	protected BaseBean populateBean(HttpServletRequest request) {
		log.debug("populate bean faculty ctl started");
		// System.out.println(" populate bean ctl in ");
		FacultyBean bean = new FacultyBean();

		bean.setId(DataUtility.getLong(request.getParameter("id")));
		bean.setFirstName(DataUtility.getString(request.getParameter("firstname")));
		bean.setLastName(DataUtility.getString(request.getParameter("lastname")));
		bean.setGender(DataUtility.getString(request.getParameter("gender")));
		bean.setEmailId(DataUtility.getString(request.getParameter("loginid")));
		bean.setMobileNo(DataUtility.getString(request.getParameter("mobileno")));
		bean.setDob(DataUtility.getDate(request.getParameter("dob")));
		bean.setCollegeId(DataUtility.getLong(request.getParameter("collegeid")));
		bean.setCourseId(DataUtility.getLong(request.getParameter("courseid")));
		bean.setSubjectId(DataUtility.getLong(request.getParameter("subjectid")));
		
		
		//bean.setCollegeName(DataUtility.getString(request.getParameter("collegeid")));
		//bean.setCourseName(DataUtility.getString(request.getParameter("coursename")));
		//bean.setSubjectName(DataUtility.getString(request.getParameter("subjectname")));

		
		populateDTO(bean, request);
		log.debug("populate bean faculty ctl Ended");
		// System.out.println(" populate bean ctl out ");
		return bean;
	}

	/**
	 * Contains display logic.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log.debug("Do get of faculty ctl Started");
		String op = DataUtility.getString(request.getParameter("operation"));

		// Get Model
		FacultyModel model = new FacultyModel();
		Long id = DataUtility.getLong(request.getParameter("id"));

		if (id > 0 || op != null) {
			FacultyBean bean;
			try {
				bean = model.findByPK(id);
				ServletUtility.setBean(bean, request);

			} catch (ApplicationException e) {
				e.printStackTrace();
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			}
		}
		// System.out.println(" do get out ");
		log.debug("Do get of  faculty ctl Ended");
		ServletUtility.forward(getView(), request, response);
	}

	/**
	 * Contains submit logic.
	 *
	 * @param request  the request
	 * @param response the response
	 * @throws ServletException the servlet exception
	 * @throws IOException      Signals that an I/O exception has occurred.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		log.debug("Do post of  faculty ctl Started");
		// System.out.println("Do post of faculty ctl Started ");

		String op = DataUtility.getString(request.getParameter("operation"));
		long id = DataUtility.getLong(request.getParameter("id"));

		// Get Model
		FacultyModel model = new FacultyModel();
		if (OP_SAVE.equalsIgnoreCase(op) || OP_UPDATE.equalsIgnoreCase(op)) {
			FacultyBean bean = (FacultyBean) populateBean(request);

			try {
				if (id > 0) {
					model.update(bean);
					ServletUtility.setBean(bean, request);
					ServletUtility.setSuccessMessage("Faculty Successfully Updated", request);

				} else {
					long pk = model.add(bean);
					ServletUtility.setBean(bean, request);
					ServletUtility.setSuccessMessage("Faculty Successfully Added", request);

					// bean.setId(pk);
				}
				ServletUtility.setBean(bean, request);

			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			} catch (DuplicateRecordException e) {
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage("Faculty already Exist", request);
			}
		} else if (OP_RESET.equalsIgnoreCase(op)) {
			ServletUtility.redirect(ORSView.FACULTY_CTL, request, response);
			return;
		} else if (OP_CANCEL.equalsIgnoreCase(op)) {
			ServletUtility.redirect(ORSView.FACULTY_LIST_CTL, request, response);
			return;
		}
		// System.out.println(" do post out ");
		ServletUtility.forward(getView(), request, response);
		log.debug("Do post of  faculty ctl Ended");
		// System.out.println(" Do post of faculty ctl Ended ");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see in.co.pro4.controller.BaseCtl#getView()
	 */
	@Override
	protected String getView() {
		return ORSView.FACULTY_VIEW;
	}
}
