package insta.board;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class FileService {
	private BoardDAO boardDAO =null;
	public static String SAVE_PATH = "C:/jos421/jsp/myInsta/src/main/webapp/uploads";
	public FileService() {
		boardDAO = new BoardDAO();
	}
	
	public static String getToday() {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(c.getTime());
	}
	
	public boolean  fileUpload(int mc_useridx, String mc_content, String mc_taggedid, String mc_taggedname, File file)  {
		System.out.println("dddd");
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setMcUseridx(mc_useridx);
		boardDTO.setMcContent(mc_content);
		boardDTO.setMcTaggedid(mc_taggedid);
		boardDTO.setMcTaggedname(mc_taggedname);
		boardDTO.setMcImageurl(file.getName());
		boardDTO = boardDAO.insertBoard(boardDTO);
		System.out.println("최종 파일 정보 : " + boardDTO);
		if(boardDTO != null) {
			moveFile(boardDTO, file);
		}
		return true;
	}
	
	public void moveFile(BoardDTO boardDTO, File file) {
		File dir = new File(SAVE_PATH + "/" + getToday());
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		if(file.isFile()) {
			File newFile = new File(SAVE_PATH + boardDTO.getMcFilepath());
			file.renameTo(newFile);
		}
	}
}
