package com.koreait;

public class SearchDTO {
	private int mc_idx;
	private String mc_imageurl;
	private String mc_likes;
	private String mc_cmts;
	public int getMc_idx() {
		return mc_idx;
	}
	public void setMc_idx(int mc_idx) {
		this.mc_idx = mc_idx;
	}
	public String getMc_imageurl() {
		return mc_imageurl;
	}
	public void setMc_imageurl(String mc_imageurl) {
		this.mc_imageurl = mc_imageurl;
	}
	
	public String getMc_cmts() {
		return mc_cmts;
	}
	public void setMc_cmts(String mc_cmts) {
		this.mc_cmts = mc_cmts;
	}
	public String getMc_likes() {
		return mc_likes;
	}
	public void setMc_likes(String mc_likes) {
		this.mc_likes = mc_likes;
	}
	@Override
	public String toString() {
		return "SearchDTO [mc_idx=" + mc_idx + ", mc_imageurl=" + mc_imageurl + ", mc_likes=" + mc_likes + ", mc_cmts="
				+ mc_cmts + "]";
	}
}
