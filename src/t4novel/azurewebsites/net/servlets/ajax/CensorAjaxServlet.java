package t4novel.azurewebsites.net.servlets.ajax;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import t4novel.azurewebsites.net.DAO.CensoringDAO;
import t4novel.azurewebsites.net.DAO.FollowDAO;
import t4novel.azurewebsites.net.censoring.CensorEntity;
import t4novel.azurewebsites.net.censoring.MessageBuilderFactory;
import t4novel.azurewebsites.net.models.Message;
import t4novel.azurewebsites.net.ws.notifycation.EntityAcceptByCensoringMessageBuilder;
import t4novel.azurewebsites.net.ws.notifycation.MessageBuilder;
import t4novel.azurewebsites.net.ws.notifycation.NotifycationSystem;

/**
 * Servlet implementation class CensorAjaxServlet
 */
@WebServlet("/ajax-censor")
public class CensorAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CensorAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idEntity = Integer.parseInt(request.getParameter("id"));
		int isAccept = Integer.parseInt(request.getParameter("isAccept"));
		String stream = request.getParameter("stream");
		if ("chap".equalsIgnoreCase(stream))
			stream = "chapter";
		Connection cnn = (Connection) request.getAttribute("connection");
		CensoringDAO censorDao = new CensoringDAO(cnn);
		CensorEntity censorEntity = null;
		try {
			censorEntity = censorDao.getCensorEntityByIdAndStream(idEntity, stream);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		MessageBuilder msgBuilder = new EntityAcceptByCensoringMessageBuilder(censorEntity);
		Message msg = msgBuilder.getData();
		NotifycationSystem.notifyToUser(censorEntity.getOwnerAccountId(), msg, cnn);

		if (isAccept == 0) 
			try {
				censorEntity.setAcceptedByCensorSystem(false);
				censorDao.onCensoringEventUpdate(censorEntity);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if (isAccept == 1)
			try {
				censorEntity.setAcceptedByCensorSystem(true);
				censorDao.onCensoringEventUpdate(censorEntity);
				FollowDAO followDao = new FollowDAO(cnn);
				List<Integer> followersId = null;
				try {
					followersId = followDao.getFollowersId(censorEntity.getOwnerTargetId());
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (!followersId.isEmpty()) {
					msgBuilder = MessageBuilderFactory.create(censorEntity);
					msg = msgBuilder.getData();
					NotifycationSystem.notifyToListUser(followersId, msg);
					System.out.println("notify to follower: with ownertarget : " + censorEntity.getOwnerTargetId()
							+ " with msg \n " + msg.getContent());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		System.out.println(isAccept);
	
	}
}