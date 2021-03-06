package t4novel.azurewebsites.net.models;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import t4novel.azurewebsites.net.sercurities.Role;

public class Account implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private Timestamp dateCreate;
	private String displayedName, userName, gmail, password;
	private List<Message> messages;
	private List<BookMarkFolder> bookMarkFolders;
	private Role role;
	private boolean isAutoPassPushlishment;
	private boolean ban;
	private boolean pin;
	private List<Thread> threads;
	private List<Novel> ownNovels, follows;
	private List<Comment> comments;
	private List<Group> joinGroups;
	private List<Integer> novelFollowsId;

	public Account(int id) {
		this.id = id;
	};

	public Account() {
	};

	public Account(int id, Timestamp dateCreate, String displayedName, String userName, String gmail, List<Message> messages,
			List<BookMarkFolder> bookMarkFolders, Role role, boolean isAutoPassPushlishment, List<Thread> threads,
			List<Novel> ownNovels, List<Novel> follows, List<Comment> comments, boolean isBanned) {
		super();
		this.id = id;
		this.dateCreate = dateCreate;
		this.displayedName = displayedName;
		this.userName = userName;
		this.gmail = gmail;
		this.messages = messages;
		this.bookMarkFolders = bookMarkFolders;
		this.role = role;
		this.isAutoPassPushlishment = isAutoPassPushlishment;
		this.threads = threads;
		this.ownNovels = ownNovels;
		this.follows = follows;
		this.comments = comments;
		this.ban = isBanned;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getDateCreate() {
		return dateCreate;
	}

	public List<Integer> getNovelFollowsId() {
		return novelFollowsId;
	}

	public void setNovelFollowsId(List<Integer> novelFollowsId) {
		this.novelFollowsId = novelFollowsId;
	}

	public void setDateCreate(Timestamp dateCreate) {
		this.dateCreate = dateCreate;
	}

	public String getDisplayedName() {
		return displayedName;
	}

	public void setDisplayedName(String displayedName) {
		this.displayedName = displayedName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGmail() {
		return gmail;
	}

	public void setGmail(String gmail) {
		this.gmail = gmail;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		if (this.messages != null && !this.messages.isEmpty())
			this.messages.clear();
		for (Message msg : messages) {
			msg.setOwner(this);
		}
		this.messages = messages;
	}

	public List<BookMarkFolder> getBookMarkFolders() {
		return bookMarkFolders;
	}

	public void setBookMarkFolders(List<BookMarkFolder> bookMarkFolders) {
		this.bookMarkFolders = bookMarkFolders;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public boolean isAutoPassPushlishment() {
		return isAutoPassPushlishment;
	}

	public void setAutoPassPushlishment(boolean isAutoPassPushlishment) {
		this.isAutoPassPushlishment = isAutoPassPushlishment;
	}

	public List<Thread> getThreads() {
		return threads;
	}

	public void setThreads(List<Thread> threads) {
		this.threads = threads;
	}

	public List<Novel> getOwnNovels() {
		return ownNovels;
	}

	public void setOwnNovels(List<Novel> ownNovels) {
		this.ownNovels = ownNovels;
		for (Novel n : ownNovels) {
			n.setOwner(this);
		}
	}

	public List<Novel> getFollows() {
		return follows;
	}

	public void setFollows(List<Novel> follows) {
		this.follows = follows;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public boolean isBan() {
		return ban;
	}

	public boolean getBan() {
		return ban;
	}

	public boolean isPin() {
		return pin;
	}

	public void setPin(boolean pin) {
		this.pin = pin;
	}

	public void setBan(boolean isBanned) {
		this.ban = isBanned;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Group> getJoinGroup() {
		return joinGroups;
	}

	public void setJoinGroup(List<Group> jointGroup) {
		this.joinGroups = jointGroup;
	}

	public Group getGroup(int rootGroupId) {
		Group rs = null;
		for (Group gr : joinGroups) {
			if (rootGroupId == gr.getId()) {
				rs = gr;
				break;
			}
		}
		return rs;
	}

	public List<Group> getOwnerGroups() {
		List<Group> rs = new ArrayList<>(joinGroups.size());
		for (Group gr : joinGroups) {
			if (gr.getOwner().getId() == this.id) {
				rs.add(gr);
			}
		}
		return rs;
	}

	public Chap getOwnerChap(int chapID) {
		for (Novel ownNovel : getOwnNovels()) {
			for (Vol vol : ownNovel.getVols()) {
				for (Chap chap : vol.getChaps()) {
					if (chap.getId() == chapID) {
						return chap;
					}
				}
			}
		}
		return null;
	}

	public void setOwnerChap(Chap fixedChap) {
		for (Novel ownNovel : getOwnNovels()) {
			for (Vol vol : ownNovel.getVols()) {
				for (int i = 0; i < vol.getChaps().size(); i++) {
					if (vol.getChaps().get(i).getId() == fixedChap.getId()) {
						vol.getChaps().remove(i);
						vol.getChaps().add(i, fixedChap);
						break;
					}
				}
			}
		}
	}

	public Vol getOwnerVol(int volID) {
		for (Novel ownNovel : getOwnNovels()) {
			for (Vol vol : ownNovel.getVols()) {
				if (vol.getId() == volID) {
					return vol;
				}
			}
		}
		return null;
	}

	public void setOwnerVol(Vol fixedVol) {
		for (Novel ownNovel : getOwnNovels()) {
			for (int i = 0; i < ownNovel.getVols().size(); i++) {
				if (ownNovel.getVols().get(i).getId() == fixedVol.getId()) {
					ownNovel.getVols().remove(i);
					ownNovel.getVols().add(i, fixedVol);
					break;
				}
			}
		}
	}

	public Novel getANovel(int novelID) {
		for (Novel ownNovel : getOwnNovels()) {
			if (ownNovel.getId() == novelID) {
				return ownNovel;
			}
		}
		return null;
	}

	public void updateNovelInMyNovel(Novel novel) {
		for (int i = 0; i < ownNovels.size(); i++) {
			if (ownNovels.get(i).equals(novel)) {
				ownNovels.remove(i);
				ownNovels.add(i, novel);
				break;
			}
		}
	}

	public void addJoinGroup(Group g) {
		if (!this.joinGroups.contains(g))
			this.joinGroups.add(g);
	}

	public void addNewOwnerVol(Vol vol) {
		for (Novel novel : getOwnNovels()) {
			if (novel.getId() == vol.getNovelOwnerId()) {
				novel.addNewVol(vol);
				break;
			}
		}
	}

	public void addNewOwnerChap(Chap chapter) {
		for (Novel ownNovel : getOwnNovels()) {
			for (Vol vol : ownNovel.getVols()) {
				if (vol.getId() == chapter.getVolOwnerId()) {
					vol.addNewChappter(chapter);
					break;
				}
			}
		}
	}

	public void deleteOwnerChap(int chaptID) {
		for (Novel ownNovel : getOwnNovels()) {
			for (Vol vol : ownNovel.getVols()) {
				vol.deleteChapter(chaptID);
			}
		}
	}

	public void deleteVol(int volID) {
		for (Novel ownNovel : getOwnNovels()) {
			for (int i = 0; i < ownNovel.getVols().size(); i++) {
				if (ownNovel.getVols().get(i).getId() == volID) {
					ownNovel.getVols().remove(i);
					break;
				}
			}
		}
	}

	public void deleteNovel(int novelID) {
		if (ownNovels == null)
			return;
		for (int i = 0; i < ownNovels.size(); i++) {
			if (ownNovels.get(i).getId() == novelID) {
				ownNovels.remove(i);
				break;
			}
		}
	}

	public void addNewOwnerNovel(Novel n) {
		if (this.ownNovels == null)
			this.ownNovels = new LinkedList<>();
		if (!this.ownNovels.contains(n))
			this.ownNovels.add(n);
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof Account))
			return false;
		Account otherAcc = (Account) obj;
		return this.id == otherAcc.id;
	}

	public boolean isFollowNovel(int novelId) {
		if (this.novelFollowsId == null || this.novelFollowsId.isEmpty())
			return false;
		for (Integer f : this.novelFollowsId)
			if (novelId == f)
				return true;
		return false;
	}

	public void followNovel(int targetId) {
		if (this.novelFollowsId == null)
			this.novelFollowsId = new LinkedList<>();
		if (!this.novelFollowsId.contains(targetId))
			this.novelFollowsId.add(targetId);
	}

	public void unFollowNovel(int targetId) {
		if (this.novelFollowsId == null)
			return;
		novelFollowsId.remove(new Integer(targetId));
	}

	public void followThread(int targetId) {

	}

	public void unFollowThread(int targetId) {

	}

	public void addNewMessage(Message message) {
		this.messages.add(0, message);
	}
	@Override
	public String toString() {
		return "username: " + userName + ", password: " + password + ", displayName: " + displayedName + ", gmail: " + gmail;
	}
}
