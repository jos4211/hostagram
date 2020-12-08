package com.koreait;

public class CommentDTO {
	private long coIdx;
	private long coMcidx;
	private String coUserid;
	private String coText;
	private String coRegdate;
	public long getCoIdx() {
		return coIdx;
	}
	public void setCoIdx(long coIdx) {
		this.coIdx = coIdx;
	}
	public long getCoMcidx() {
		return coMcidx;
	}
	public void setCoMcidx(long coMcidx) {
		this.coMcidx = coMcidx;
	}
	public String getCoUserid() {
		return coUserid;
	}
	public void setCoUserid(String coUserid) {
		this.coUserid = coUserid;
	}
	public String getCoText() {
		return coText;
	}
	public void setCoText(String coText) {
		this.coText = coText;
	}
	public String getCoRegdate() {
		return coRegdate;
	}
	public void setCoRegdate(String coRegdate) {
		this.coRegdate = coRegdate;
	}
	@Override
	public String toString() {
		return "CommentDTO [coIdx=" + coIdx + ", coMcidx=" + coMcidx + ", coUserid=" + coUserid + ", coText=" + coText
				+ ", coRegdate=" + coRegdate + "]";
	}
	
	
	
}
