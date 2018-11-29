package t4novel.azurewebsites.net.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import t4novel.azurewebsites.net.DAO.AccountDAO;
import t4novel.azurewebsites.net.DAOService.DAOService;
import t4novel.azurewebsites.net.DAOService.ExistedPasswordCheckingService;
import t4novel.azurewebsites.net.forms.AbstractMappingForm;
import t4novel.azurewebsites.net.forms.ChangePasswordForm;
import t4novel.azurewebsites.net.models.Account;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/jsps/pages/account-manage-password.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection cnn =(Connection) request.getAttribute("connection");
		DAOService existedPasswordChecker = new ExistedPasswordCheckingService(cnn);
		AbstractMappingForm changePasswordForm = new ChangePasswordForm(request, existedPasswordChecker);
		if(!changePasswordForm.isOnError()) {
			String newPassword = (String)changePasswordForm.getMappingData();
			// TODO write newPassword to database
			AccountDAO accountDAO = new AccountDAO(cnn);
			Account account = (Account) request.getSession().getAttribute("account");
			account.setPassword(newPassword);
			accountDAO.updateAccount(account);
			request.getSession().setAttribute("account", account);
			System.out.println("changing ");
			// TODO print success message to user interface
			request.setAttribute("sucessed", "Changed password successfully!");
			response.sendRedirect("manage");
		}
		//mapping loi toi user interface
		else {
			changePasswordForm.applyErrorsToUI(request);
			getServletContext().getRequestDispatcher("/jsps/pages/account-manage-password.jsp").forward(request, response);
		}
	}

}
