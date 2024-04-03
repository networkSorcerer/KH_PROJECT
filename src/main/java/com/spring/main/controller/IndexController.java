package com.spring.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.animal.service.AnimalService;
import com.spring.animal.vo.AnimalVO;
import com.spring.volunteer.service.VolunteerService;
import com.spring.volunteer.vo.VolunteerVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/*")
@Controller
public class IndexController {
	
	@Autowired
	private VolunteerService volSer;
	@Autowired
	private AnimalService aniSer;
	
	@GetMapping("/")
	public String mainpage(Model model, VolunteerVO vvo, AnimalVO avo) {	
		if(vvo == null) {
			return "project/mainpage";
		}else {
			List<VolunteerVO> mainVol = volSer.mainVol(vvo);
			model.addAttribute("mainVol", mainVol);
		}
		if(avo == null) {
			return "project/mainpage";
		}else {
			List<AnimalVO> mainAni = aniSer.mainAni(avo);
			model.addAttribute("mainAni", mainAni);
		}
		return "project/mainpage";
	}		
	
	@GetMapping("admin")
	public String adminLogin() {
		return "admin/adminLogin";
	}	
	
//	@GetMapping("/randomImages")
//    @ResponseBody
//    public List<String> getRandomImages(Model model) {
//        // 이미지 파일이 있는 디렉토리 경로
//        String imageDirectoryPath = "/images/storage/volunteer";
//        System.out.println(imageDirectoryPath);
//        // 디렉토리에서 이미지 파일 목록을 가져옴
//        File imageDirectory = new File(imageDirectoryPath);
//        System.out.println(imageDirectory);
//        File[] imageFiles = imageDirectory.listFiles();
//        // 이미지 파일 경로를 저장할 리스트
//        List<String> imagePaths = new ArrayList<>();
//        // 랜덤하게 4개의 이미지 파일 선택
//        Random random = new Random();
//        for (int i = 0; i < 4; i++) {
//            File randomImageFile = imageFiles[random.nextInt(imageFiles.length)];
//            imagePaths.add(randomImageFile.getPath());
//        }
//        log.info("이미지 " + imagePaths.toString());
//        // 선택된 이미지 파일의 경로 리스트 반환
//        return imagePaths;
//    }
}