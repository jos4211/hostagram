package insta.board;

public class BoardDTO {
	private int mcIdx;
	private int mcUseridx;
	private String mcContent;
	private String mcTaggedid;
	private String mcTaggedname;
	private String mcRegdate;
	private String mcLocation;
	private String mcFilepath;
	private String mcImageurl;
	public int getMcIdx() {
		return mcIdx;
	}
	public void setMcIdx(int mcIdx) {
		this.mcIdx = mcIdx;
	}
	public int getMcUseridx() {
		return mcUseridx;
	}
	public void setMcUseridx(int mcUseridx) {
		this.mcUseridx = mcUseridx;
	}
	public String getMcContent() {
		return mcContent;
	}
	public void setMcContent(String mcContent) {
		this.mcContent = mcContent;
	}
	public String getMcTaggedid() {
		return mcTaggedid;
	}
	public void setMcTaggedid(String mcTaggedid) {
		this.mcTaggedid = mcTaggedid;
	}
	public String getMcTaggedname() {
		return mcTaggedname;
	}
	public void setMcTaggedname(String mcTaggedname) {
		this.mcTaggedname = mcTaggedname;
	}
	public String getMcRegdate() {
		return mcRegdate;
	}
	public void setMcRegdate(String mcRegdate) {
		this.mcRegdate = mcRegdate;
	}
	public String getMcLocation() {
		return mcLocation;
	}
	public void setMcLocation(String mcLocation) {
		this.mcLocation = mcLocation;
	}
	public String getMcFilepath() {
		return mcFilepath;
	}
	public void setMcFilepath(String mcFilepath) {
		this.mcFilepath = mcFilepath;
	}
	public String getMcImageurl() {
		return mcImageurl;
	}
	public void setMcImageurl(String mcImageurl) {
		this.mcImageurl = mcImageurl;
	}
	@Override
	public String toString() {
		return "BoardDTO [mcIdx=" + mcIdx + ", mcUseridx=" + mcUseridx + ", mcContent=" + mcContent + ", mcTaggedid="
				+ mcTaggedid + ", mcTaggedname=" + mcTaggedname + ", mcRegdate=" + mcRegdate + ", mcLocation="
				+ mcLocation + ", mcFilepath=" + mcFilepath + ", mcImageurl=" + mcImageurl + "]";
	}
	
}
