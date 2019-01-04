package t4novel.azurewebsites.net.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import t4novel.azurewebsites.net.DAO.AccountDAO;
import t4novel.azurewebsites.net.DAO.GroupDAO;
import t4novel.azurewebsites.net.models.Account;
import t4novel.azurewebsites.net.models.Group;

@WebServlet("/manage/account/dashboard-groups")
public class AccountDashBoardGroups extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AccountDashBoardGroups() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection cnn = (Connection) request.getAttribute("connection");
		GroupDAO groupDao = new GroupDAO(cnn);
		try {
			Account account = (Account) request.getSession().getAttribute("account");
			List<Group> groups = groupDao.getAllGroupsByOwnerID(account.getId());
			AccountDAO accDao = new AccountDAO(cnn);
			for (Group g : groups) {
				g.setOwner(accDao.getAccountByID(g.getOwnerId()));
				g.setAccounts(groupDao.getAllMemberFromGroup(g.getId()));
				for (int i = 0; i < g.getAccounts().size(); i++) {
					Account member = accDao.getAccountByID(g.getAccounts().get(i).getId());
					g.getAccounts().remove(i);
					g.getAccounts().add(i, member);
				}
			}
			request.setAttribute("groups", groups);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getServletContext().getRequestDispatcher("/jsps/pages/account-new.all-group.jsp").forward(request,
				response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection cnn = (Connection) request.getAttribute("connection");
		GroupDAO groupDao = new GroupDAO(cnn);
		AccountDAO accDao = new AccountDAO(cnn);

		int groupID = Integer.parseInt(request.getParameter("groupID"));
		int memberID = Integer.parseInt(request.getParameter("memberID"));

		try {
			groupDao.removeMemberFromGroup(accDao.getAccountByID(memberID), groupDao.getGroup(groupID));
		} catch (Exception e) {
			e.printStackTrace();
		}

		doGet(request, response);
	}

}
