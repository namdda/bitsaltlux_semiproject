package co.kr.wdt.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.post.vo.PostVo;
import net.coobird.thumbnailator.Thumbnails;

@Component("fileUtils") 
public class FileUtils { 
	
	private static final int THUMB_WIDTH = 250;
	private static final int THUMB_HEIGHT = 150;
	private String filePath = null;
	
	public void getFilepath() {
		String path = this.getClass().getResource("").getPath().toString();
		path = path.replace("/", "\\");
		int point = path.indexOf("\\.metadata");
		String path2 = path.substring(1, point);
		
		// ProjectName 구하기
		String text = "\\wtpwebapps";
		int point2 = path.indexOf(text);
		String path3 = path.substring(point2 + text.length()+1, path.indexOf("\\WEB-INF"));
		
		
		String projectInnerPath = "\\src\\main\\webapp\\resources\\upload\\";
		filePath = path2 + File.separator + path3 + projectInnerPath;
	}
	
	public void getFilepath(HttpServletRequest request) {
		
		// WorkSpack 경로 구하기
		String path = request.getSession().getServletContext().getRealPath(".");
		int point = path.indexOf("\\.metadata");
		String path2 = path.substring(0, point);
		
		// ProjectName 구하기
		String text = "\\wtpwebapps";
		int point2 = path.indexOf(text);
		String path3 = path.substring(point2 + text.length()+1, path.length());
		
		// Project 내부 경로
		String projectInnerPath = "\\src\\main\\webapp\\resources\\upload\\";
		filePath = path2 + File.separator + path3 + projectInnerPath;
	}
	
	
	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{ 

		String uuid = UUID.randomUUID().toString().replaceAll("-", "");

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request; 
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
		MultipartFile multipartFile = null; 
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(); 
		Map<String, Object> listMap = null; 
		String courseIdx = (String)map.get("courseIdx");
		String courseName = (String)map.get("courseName");
		
		getFilepath(request);
		
		File file = new File(filePath); 
		if(file.exists() == false){ 
			file.mkdirs(); 
		} 

		while(iterator.hasNext()){ 
			multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			if(multipartFile.isEmpty() == false){ 
				originalFileName = multipartFile.getOriginalFilename(); 
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
				storedFileName = uuid + originalFileExtension; 
				file = new File(filePath + storedFileName); 
				multipartFile.transferTo(file); 
				listMap = new HashMap<String,Object>(); 
				listMap.put("courseIdx", courseIdx); 
				listMap.put("courseName", courseName);
				listMap.put("originalFileName", originalFileName); 
				listMap.put("storedFileName", storedFileName); 
				listMap.put("fileSize", multipartFile.getSize()); 
				list.add(listMap); 
			} 
		} 

		return list; 
	} 
	

	public List<String> uploadLogo(MultipartFile file) {
		getFilepath();
		
		List<String> list = new ArrayList<>();
		
		UUID uid = UUID.randomUUID();
		
		String fileName = file.getOriginalFilename();
		
		String saveOriginName = uid + "_" + fileName;
		
		String saveThumbName = uid + "_thumb_" + fileName;
		
		String originPath = filePath + "\\" + saveOriginName;
		String thumbPath = filePath + "\\" + saveThumbName;
		
		try {
			
			File origin = new File(originPath);
			file.transferTo(origin);
			
			File thumbNail = new File(thumbPath);
			file.transferTo(thumbNail);
			if(origin.exists()) {
				Thumbnails.of(origin).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbNail);
			}
			
		} catch (IllegalStateException e) {
			System.out.println("IllegalStateException : " +e.getMessage());
		} catch (IOException e) {
			System.out.println("IOException : " + e.getMessage());
		}	
		
		list.add(saveOriginName);
		list.add(saveThumbName);
		
		
		return list;
	}

	public boolean blogDelete(BlogVo blogVo) {
		getFilepath();
		String originPath = filePath + "\\" + blogVo.getOriginLogo();
		String thumbPath = filePath + "\\" + blogVo.getThumbLogo();
		
		File origin = new File(originPath);
		File thumbNail = new File(thumbPath);
		
		return origin.delete() && thumbNail.delete();
	}

	public List<String> uploadFile(MultipartFile file) {
		getFilepath();
		
		List<String> list = new ArrayList<>();
		UUID uid = UUID.randomUUID();
		
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		
		String originName = file.getOriginalFilename();
		String storedName = uid + "." + ext;
		
		String savePath = filePath + "\\" + storedName;
		
		
		try {
			File saveFile = new File(savePath);
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			System.out.println("IllegalStateException : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("IOException : " + e.getMessage());
		}
		
		list.add(originName);
		list.add(storedName);
		
		return list;
	}

	public boolean postDelete(PostVo postVo) {
		getFilepath();
		String path = filePath + "\\" + postVo.getStoredFile();
		
		File file = new File(path);
		return file.delete();
	}

}

























