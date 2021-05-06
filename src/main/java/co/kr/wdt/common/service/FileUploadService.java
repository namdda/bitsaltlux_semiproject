package co.kr.wdt.common.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import co.kr.wdt.blog.vo.BlogVo;
import co.kr.wdt.post.vo.PostVo;
import net.coobird.thumbnailator.Thumbnails;

@Service
public class FileUploadService {
	private static final int THUMB_WIDTH = 250;
	private static final int THUMB_HEIGHT = 150;

	public List<String> uploadLogo(MultipartFile file, String uploadPath) {
		
		List<String> list = new ArrayList<>();
		
		UUID uid = UUID.randomUUID();
		
		String fileName = file.getOriginalFilename();
		
		String saveOriginName = uid + "_" + fileName;
		
		String saveThumbName = uid + "_thumb_" + fileName;
		
		String originPath = uploadPath + "\\" + saveOriginName;
		String thumbPath = uploadPath + "\\" + saveThumbName;
		
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

	public boolean blogDelete(BlogVo blogVo, String uploadPath) {
		String originPath = uploadPath + "\\" + blogVo.getOriginLogo();
		String thumbPath = uploadPath + "\\" + blogVo.getThumbLogo();
		
		File origin = new File(originPath);
		File thumbNail = new File(thumbPath);
		
		return origin.delete() && thumbNail.delete();
	}

	public List<String> uploadFile(MultipartFile file, String uploadPath) {
		
		List<String> list = new ArrayList<>();
		UUID uid = UUID.randomUUID();
		
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		
		String originName = file.getOriginalFilename();
		String storedName = uid + "." + ext;
		
		String savePath = uploadPath + "\\" + storedName;
		
		
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

	public boolean postDelete(PostVo postVo, String uploadPath) {
		String path = uploadPath + "\\" + postVo.getStoredFile();
		
		File file = new File(path);
		return file.delete();
	}

}
