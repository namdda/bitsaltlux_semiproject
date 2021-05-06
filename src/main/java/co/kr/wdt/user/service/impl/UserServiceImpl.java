package co.kr.wdt.user.service.impl;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
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

		int no = userDao.joinProc(userVo);
		no = userDao.maxNo();
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
					userVo.setNo(no);
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

	@SuppressWarnings("unlikely-arg-type")
	@Override
	public void updateProc(UserVo userVo, MultipartHttpServletRequest req) {
		if(!"".equals(req.getFileNames())) { 
			// 기존의 파일을 어떻게 알 수 있을까
			// 기존 파일 삭제 및 파일 재 업로드 로직
			
			// 삭제를 위한 어떤한 방법 1
			// 그 방법을 이용하여 파일폴더 에 해당 파일은 삭제해야되면 알아서 upload폴더에 수정페이지에서 첨부한 파일로 교체 됨
			/*
			  private String fullName; // 암호화 되거나 식별되기 위한 코드까지 있음 
			  private String originalName; //원본 이름 
			 * */
			//1. formatName 안 쓰이니까 이걸로 삭제를 위한 어떤 방법으로 써야 할 것 같다 
			
			//String fileName = userVo.getFullName(); //NULL 값 나온다  아니 왜... 왜!
			// 그 유저의 파일 네임을 가지고 와야 하는데. 
			//no 안 쓰는걸 유의하라 했다.
			String fileName = userDao.selectUserProfileFullName(userVo.getNo()); // 그니까 여기에 파일 이름만 들어가면 된다. fullname 이어야 한다 
			
			// String fileName = "/2021/05/05/rantualla.jpg";
			//실험하는 파일도 안 지워진다 슬프다 머리 빠질 것 같다 
			//근데 userVo.getFullname 하면 안 나온다 돌아버리겠다
				
			// String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); // 파일의 타입을 알 수 있게 해주는 애(파일이면 .jpg, .png 같은게 찍히겠지) 
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete(); 
				
			//뭔가 정의했잖아. 밑에는 삭제했잖아. 여기에 그 뭔가가 들어간다  내 감이 말해준다
			//새 파일을 만들고 지운다고? 어 그렇게 해야 한다고 하네
			userDao.imageDelete(userVo.getNo());
			
			// System.out.println("new file: "+f1); // 아니 왜
			//삭제하는 메소드. 원래 경로까지 써야 삭제가 되는데, uploadPath가 해주고 있다.
			
			//건들지 마! 삭제하고 올리는거니까 건들지 마! 	
			//여기서부터 업로드 
			Iterator<String> iterator = req.getFileNames();
			MultipartFile multipartFile = null;
			while(iterator.hasNext()){
				multipartFile = req.getFile(iterator.next());
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
		String hashPassword = BCrypt.hashpw(userVo.getUserPw(), BCrypt.gensalt());
		userVo.setUserPw(hashPassword);
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
