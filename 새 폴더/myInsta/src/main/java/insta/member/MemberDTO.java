package insta.member;

public class MemberDTO {
	private int m_idx;
	private String m_userid;
	private String m_password;
	private String m_username;
	private String m_email;
	private String m_filepath;
	private String m_intro;
	private String m_number;
	private String m_site;
	private String m_gender;
	public String getM_filepath() {
		return m_filepath;
	}
	public String getM_number() {
		return m_number;
	}
	public void setM_number(String m_number) {
		this.m_number = m_number;
	}
	public String getM_intro() {
		return m_intro;
	}

	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}

	public String getM_site() {
		return m_site;
	}

	public void setM_site(String m_site) {
		this.m_site = m_site;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public void setM_filepath(String m_filepath) {
		this.m_filepath = m_filepath;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getM_userid() {
		return m_userid;
	}

	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_username() {
		return m_username;
	}

	public void setM_username(String m_username) {
		this.m_username = m_username;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
}
