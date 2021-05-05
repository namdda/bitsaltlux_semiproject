package co.kr.wdt.user.service.impl;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.kr.wdt.user.dao.UserDao;
import co.kr.wdt.user.service.UserService;
import co.kr.wdt.user.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {

	private Log log = LogFactory.getLog(UserServiceImpl.class);

	@Autowired
	private String uploadPath;

	@Autowired
	private UserDao userDao;

	@Override
	public int checkExistid(String inputId) {
		return userDao.checkExistid(inputId);
	}

	@Override
	public void joinProc(UserVo userVo, MultipartHttpServletRequest request) {
//		if("STUDENT".equals(userVo.getLevel())) userDao.joinProc(userVo);
//		else userDao.joinProc(userVo);

		userDao.joinProc(userVo);

		Iterator<String> iterator = request.getFileNames();
		MultipartFile multipartFile = null;
		while(iterator.hasNext()){
			multipartFile = request.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				log.info("------------- file start -------------");
				log.info("name : " + multipartFile.getName());
				log.info("filename : " + multipartFile.getOriginalFilename());
				log.info("size : " + multipartFile.getSize());
				log.info("-------------- file end --------------\n");
				try {
					userVo.setFullName(uploadFile(uploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes()));
					userVo.setOriginalName(multipartFile.getOriginalFilename());
					userVo.setFileSize((int) multipartFile.getSize());
					userDao.imageUserInsert(userVo);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public UserVo userUpdate(String inputId) {
		return userDao.userUpdate(inputId);
	}

	@Override
	public void updateProc(UserVo userVo) {
		userDao.updateProc(userVo);
	}

	@Override
	public void deleteProc(UserVo userVo) {
		userDao.deleteProc(userVo);
	}


	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String dayPath = monthPath + File.separator +new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, dayPath);
		return dayPath;
	}

	private static void makeDir(String uploadPath, String... paths) {
		if(new File(paths[paths.length - 1]).exists()) {
			return;
		}
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}

	private static String makeIcon(String uploadPath, String path, String fileNm) {
		String iconNm = uploadPath + path + File.separator + fileNm;
		return iconNm.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedNm = uid.toString() + "_" + originalName;
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath + savedPath, savedNm);
		FileCopyUtils.copy(fileData, target);
		String uploadedFileNm = null;
		uploadedFileNm = makeIcon(uploadPath, savedPath, savedNm);
		return uploadedFileNm;
	}
}
