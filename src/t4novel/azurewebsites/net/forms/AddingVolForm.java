package t4novel.azurewebsites.net.forms;

import java.util.Arrays;
import java.util.LinkedList;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import t4novel.azurewebsites.net.models.Vol;
import t4novel.azurewebsites.net.utils.StringUtil;

public class AddingVolForm extends AbstractMappingForm {
	private String title, description;
	private int novelOwnerId;

	public AddingVolForm(HttpServletRequest request) {
		setTitle(request.getParameter("title"));
		setDescription(request.getParameter("description"));
		if (request.getParameter("action") == null)
			setNovelOwnerId(request.getParameter("in-novel"));
		else {
			setNovelOwnerId(0);
		}

	}

	public AddingVolForm() {

	}

	private void setNovelOwnerId(String parameter) {
		try {
			setNovelOwnerId(Integer.parseInt(parameter));
		} catch (NumberFormatException e) {
			errors.put("novelOwnerIdNotFount", "Unknow owner novel id!");
		}
	}

	@Override
	public String toString() {
		return title + ", " + description + ", " + novelOwnerId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		if (title == null || title.isEmpty()) {
			errors.put("titleEmpty", "Tên tập không được bỏ trống!");
		} else if (StringUtil.isAllSpace(title)) {
			errors.put("titleAllSpace", "Tên tập không được là ký tự trắng!");
		} else {
			this.title = title.trim();
		}

	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		if (description == null || description.isEmpty())
			this.description = "";
		else
			this.description = description.trim();
	}

	public int getNovelOwnerId() {
		return novelOwnerId;
	}

	public void setNovelOwnerId(int novelOwnerId) {
		this.novelOwnerId = novelOwnerId;
	}

	@Override
	protected void assignDefaultErrorType() {
		errorTypes = Arrays.asList("title", "novelOwnerId");
	}

	@Override
	public Object getMappingData() {
		if (isOnError())
			throw new IllegalArgumentException(
					"User form's data is invalid, so cannot extract to JAVA DATA CLASS! AT AddingVolForm, getMappingData()");
		Vol rs = new Vol();
		rs.setDateUp(new Timestamp(100));
		rs.setDescription(getDescription());
		rs.setTitle(getTitle());
		rs.setNovelOwnerId(getNovelOwnerId());
		rs.setChaps(new LinkedList<>());
		return rs;
	}

}
