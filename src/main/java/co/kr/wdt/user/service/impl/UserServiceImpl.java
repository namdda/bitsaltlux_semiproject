package co.kr.wdt.user.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.kr.wdt.user.dao.UserDao;
import co.kr.wdt.user.service.UserService;
import co.kr.wdt.user.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {
	
	private Log log = LogFactory.getLog(UserServiceImpl.class);
	
	@Autowired
	/*@Qualifier("uploadPath")*/	//강제로 id를 찾아서 주입
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
		
		//Iterator는 어떤 데이터들의 집합체에서 컬렉션(Collection)으로부터 정보를 얻어올 수 있는 인터페이스다.
		//Iterator를 사용하면 집합체와 개별원소들을 분리시켜서 생각할 수가 있는데, 그 집합체가 어떤 클래스의 인스턴스인지 신경쓰지 않아도 되는 장점이 있다.
		Iterator<String> iterator = request.getFileNames();
		MultipartFile multipartFile = null;
		while(iterator.hasNext()){
			multipartFile = request.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				log.info("------------- file start -------------");
				log.info("name : " + multipartFile.getName());
				log.info("filename : " + multipartFile.getOriginalFilename());
				log.info("size : " + multipartFile.getSize());
				log.info("-------------- file end --------------\n");
				imageBorVo.setFullName(UploadFileUtils3.uploadFile(uploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes()));
				imageBorVo.setOriginalName(multipartFile.getOriginalFilename());
				imageBorVo.setFileSize((int) multipartFile.getSize());
				imageDao.imageFileBoardInsert(imageBorVo);
			}
		}

		Map<String, Object> list = new HashMap<String, Object>();

		int freeBorIdx = imageDao.imageBoardIdex();
		imageBorVo.setFreeBorIdx(freeBorIdx);
		List<ImageBorVo> addFiles = imageDao.selectAddImageFilesList(imageBorVo);
		list.put("addFiles", addFiles);
		userDao.joinProc(userVo);
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
}
