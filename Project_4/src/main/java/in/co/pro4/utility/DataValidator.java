package in.co.pro4.utility;

import java.util.Date;

/**
 * This class validates input data.
 * @author Sanjay Kumar
 *
 */
public class DataValidator {

	/**
	 * Checks if value is Null
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isNull(String val) {
		if (val == null || val.trim().length() == 0) {
			return true;
		} else {
			return false;
			
		}
	}

	/**
	 * Checks if value is Not Null
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isNotNull(String val) {
		return !isNull(val);

	}

	/**
	 * Checks if value is Integer
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isInteger(String val) {
		if (isNotNull(val)) {
			try {
				int i = Integer.parseInt(val);
				return true;
			} catch (NumberFormatException e) {
				return false;
			}
		} else {
			return false;
		}
	}

	/**
	 * Checks if value is Long
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isLong(String val) {
		if (isNotNull(val)) {
			try {
				long i = Long.parseLong(val);
				return true;
			} catch (NumberFormatException e) {
				return false;
			}
		} else {
			return false;
		}
	}

	/**
	 * Checks if value is valid Email
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isEmail(String val) {

		String emailreg = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

		if (isNotNull(val)) {
			try {
				return val.matches(emailreg);
			} catch (NumberFormatException e) {
				return false;
			}

		} else {
			return false;
		}
	}

	/**
	 * Checks if value is valid Date
 	 * 
	 * @param val
	 * @return
	 */
	public static boolean isDate(String val) {
		Date d = null;
		if (isNotNull(val)) {
			d = DataUtility.getDate(val);
		}
		return d != null;
	}

	/**
	 * Checks if value is valid Name
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isName(String val) {

		String namereg = "^[^-\\s][\\p{L} .'-]+$";

		if (isNotNull(val)) {
			try {
				return val.matches(namereg);
			} catch (NumberFormatException e) {
				return false;
			}

		} else {
			return false;
		}
	}

	/**
	 * Checks if value is valid Password
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isPassword(String val) {
   
		String passreg = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,12}";

		if (isNotNull(val)) {
			try {
				return val.matches(passreg);
			} catch (NumberFormatException e) {
				return false;
			}

		} else {
			return false;
		}
	}

	public static boolean isPasswordLength(String val) {

		if (isNotNull(val) && val.length() >= 8 && val.length() <= 12) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Checks if value is valid Phone No.
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isPhoneNo(String val) {

		String phonereg = "^[6-9][0-9]{9}$";

		if (isNotNull(val)) {
			try {
				return val.matches(phonereg);
			} catch (NumberFormatException e) {
				return false;
			}

		} else {
			return false;
		}
	}

	public static boolean isPhoneLength(String val) {

		if (isNotNull(val) && val.length() == 10) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Checks if value is valid RollNo
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isRollNo(String val) {

		String rollreg = "[a-zA-Z]{2}[0-9]{3}";

		if (isNotNull(val)) {
			try {
				return val.matches(rollreg);
			} catch (NumberFormatException e) {
				return false;
			}

		} else {
			return false;
		}
	}

	/**
	 * Checks if value is valid Age
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isAge(String val) {

		Date today = new Date();
		Date enterDate = DataUtility.getDate(val);

		int age = today.getYear() - enterDate.getYear();

		if (age > 18 && isNotNull(val)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Checks if value is valid Modebile No.
	 * 
	 * @param val
	 * @return
	 */
	public static boolean isMobileNo(String val) {

		String mobreg = "^[6-9][0-9]{9}$";

		if (isNotNull(val) && val.matches(mobreg)) {

			return true;
		} else {
			return false;
		}
	}

	public static void main(String[] args) {
		System.out.println("Not null 2 " + isNotNull("4567"));
		System.out.println("Not null 3 " + isNotNull(null));
		System.out.println("Not null 4 " + isNull(""));

		System.out.println("Is int " + isInteger("12340"));
		System.out.println("Is int " + isInteger(null));
		System.out.println("Is int " + isInteger("2000"));
		System.out.println("Is int " + isNotNull("2000"));

	}
}
