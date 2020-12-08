package com.koreait;

public class Content {
	private int mc_idx;
	private int m_idx;
	private String mc_useridx;
	private String mc_content;
	private String mc_taggedid;
	private String mc_taggedname;
	private String mc_regdate;
	private String mc_location;
	private String mc_imageurl;
	private int cntLikes;
	private String m_filepath;

	public String getM_filepath() {
		return m_filepath;
	}

	public void setM_filepath(String m_filepath) {
		this.m_filepath = m_filepath;
	}

	public Content() {

	}

	public Content(int mc_idx, String mc_useridx, String mc_content, String mc_taggedid, String mc_taggedname,
			String mc_regdate, String mc_location, String mc_imageurl) {

		this.mc_idx = mc_idx;
		this.mc_useridx = mc_useridx;
		this.mc_content = mc_content;
		this.mc_taggedid = mc_taggedid;
		this.mc_taggedname = mc_taggedname;
		this.mc_regdate = mc_regdate;
		this.mc_location = mc_location;
		this.mc_imageurl = mc_imageurl;
	}

	public int getMc_idx() {
		return mc_idx;
	}

	public void setMc_idx(int mc_idx) {
		this.mc_idx = mc_idx;
	}

	public String getMc_useridx() {
		return mc_useridx;
	}

	public void setMc_useridx(String mc_useridx) {
		this.mc_useridx = mc_useridx;
	}

	public String getMc_content() {
		return mc_content;
	}

	public void setMc_content(String mc_content) {
		this.mc_content = mc_content;
	}

	public String getMc_taggedid() {
		return mc_taggedid;
	}

	public void setMc_taggedid(String mc_taggedid) {
		this.mc_taggedid = mc_taggedid;
	}

	public String getMc_taggedname() {
		return mc_taggedname;
	}

	public void setMc_taggedname(String mc_taggedname) {
		this.mc_taggedname = mc_taggedname;
	}

	public String getMc_regdate() {
		return mc_regdate;
	}

	public void setMc_regdate(String mc_regdate) {
		this.mc_regdate = mc_regdate;
	}

	public String getMc_location() {
		return mc_location;
	}

	public void setMc_location(String mc_location) {
		this.mc_location = mc_location;
	}

	public String getMc_imageurl() {
		return mc_imageurl;
	}

	public void setMc_imageurl(String mc_imageurl) {
		this.mc_imageurl = mc_imageurl;
	}

	@Override
	public String toString() {
		return "Content [mc_idx=" + mc_idx + ", mc_useridx=" + mc_useridx + ", mc_content=" + mc_content
				+ ", mc_taggedid=" + mc_taggedid + ", mc_taggedname=" + mc_taggedname + ", mc_regdate=" + mc_regdate
				+ ", mc_location=" + mc_location + ", mc_imageurl=" + mc_imageurl + "]";
	}

	public int getCntLikes() {
		return cntLikes;
	}

	public void setCntLikes(int cntLikes) {
		this.cntLikes = cntLikes;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

}
