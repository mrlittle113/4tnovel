package t4novel.azurewebsites.net.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.Arrays;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import t4novel.azurewebsites.net.DAO.AccountDAO;
import t4novel.azurewebsites.net.DAO.CensoredChapDAO;
import t4novel.azurewebsites.net.DAO.ChapDAO;
import t4novel.azurewebsites.net.DAO.GroupDAO;
import t4novel.azurewebsites.net.DAO.NovelDAO;
import t4novel.azurewebsites.net.DAO.VolDAO;
import t4novel.azurewebsites.net.models.Account;
import t4novel.azurewebsites.net.models.Novel;
import t4novel.azurewebsites.net.models.Vol;

@WebServlet("/manage/account/dashboard-chaps")
public class AccountDashBoardChaps extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AccountDashBoardChaps() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection cnn = (Connection) request.getAttribute("connection");
		NovelDAO novelDao = new NovelDAO(cnn);
		Account ac = (Account) request.getSession().getAttribute("account");
		try {
			List<Novel> novels = novelDao.getNovels(null, "IDOWNER=" + ac.getId(), 0, Integer.MAX_VALUE);
			AccountDAO accDao = new AccountDAO(cnn);
			VolDAO volDao = new VolDAO(cnn);
			ChapDAO chapDao = new CensoredChapDAO(cnn);
			GroupDAO groupDao = new GroupDAO(cnn);
			for (Novel n : novels) {
				n.setOwner(accDao.getAccountByID(n.getAccountOwnerId()));
				n.setGroup(groupDao.getGroup(n.getGroupId()));
				n.setVols(volDao.getVolsOfNovel(n.getId()));
				for (Vol v : n.getVols()) {
					v.setChaps(chapDao.getPartOfChapsByVolId(v.getId()));
				}
			}
			request.setAttribute("novels", novels);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getServletContext().getRequestDispatcher("/jsps/pages/account-new.all-chap.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
