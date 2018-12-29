package t4novel.azurewebsites.net.filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import t4novel.azurewebsites.net.DAO.NovelDAO;
import t4novel.azurewebsites.net.DAO.ViewDAO;
import t4novel.azurewebsites.net.models.Account;
import t4novel.azurewebsites.net.models.Novel;

public class DetailFilter implements Filter {
	public DetailFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		chain.doFilter(request, response);
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		int responseStatus = servletResponse.getStatus();
		if (responseStatus == 200) {
			Connection cnn = (Connection) request.getAttribute("connection");
			Novel novel = (Novel) request.getAttribute("novel");
			NovelDAO novelDao = new NovelDAO(cnn);
			ViewDAO viewDao = new ViewDAO(cnn);
			try {
				novelDao.increaseView(novel);
				Account acc = (Account) ((HttpServletRequest) request).getSession().getAttribute("account");
				viewDao.inserNewView(acc == null ? -1 : acc.getId(), "novel", novel.getId());
			} catch (SQLException e) {
				System.out.println(e.getMessage() + " At DetailFilter");
				System.out.println("canot increase view of " + novel.getId() + " " + novel.getName());
			}
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
