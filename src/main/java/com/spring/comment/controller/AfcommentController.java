package com.spring.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.comment.service.AfcommentService;
import com.spring.comment.vo.AfcommentVO;
import com.spring.comment.vo.FcommentVO;

import lombok.extern.slf4j.Slf4j;

/***************************************************************************************
 * 참고 : @RestController (@Controller + @ResponesBody)
 * Controller가 REST 방식을 처리하기 위한 것임을 명시. (기존의 특정한 JSP와 같은 뷰를 만들어 
 * 내는 것이 목적이 아닌 REST 방식의 데이터 처리를 위해서 사용하는(데이터 자체를 반환) 어노테이션이다.
 * @ResponesBody: 일반적인 JSP와 같은 뷰로 전달되는 게 아니라 데이터 자체를 전달하기 위한 용도이다.
 * @PathVariable: URL 경로에 있는 값을 파라미터로 추출하려고 할 때 사용한다.
 * @RequestBody: JSON 데이터를 원하는 타입으로 바인딩 처리한다.{name:value}
 ***************************************************************************************/

@RestController
@RequestMapping("/afcomment/*")
@Slf4j
public class AfcommentController {
	
	@Autowired
	private AfcommentService afcommentService;

	@GetMapping(value = "all/{afboardId}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<AfcommentVO> afcommentList(@PathVariable("afboardId") int afboardId, AfcommentVO afcommentvo) {
		log.info("afcommentList 호출");
		
		List<AfcommentVO> afcommentlist = null;
		afcommentvo.setAfboardId(afboardId);
		afcommentlist = afcommentService.afcommentList(afcommentvo);
		return afcommentlist;
	}
	
	
	
/**************************************************************
* 댓글 글쓰기 구현하기
* @return String
* 참고 : @RequestBody: JSON 데이터를 원하는 타입으로 바인딩 처리한다.{name:value} 
* 		consumes 속성을 이용하면 사용자가 Request Body에 담는 타입을 제한할 수 있으며 
* 		만약 요청 데이터가 JSON이라면 요청시 헤더에 반드시 application/json이 존재해야 한다.
* 
* 		produces 속성을 추가하고 dataType을 지정하면 해당 데이터타입으로만 
* 		사용자에게 응답하겠다는 의미로 해석하면 된다.
* 현재 요청 URL : http://localhost:8080/replies/replyInsert
**************************************************************/	
	
	@PostMapping(value = "afcommentInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String afcommentInsert(@RequestBody AfcommentVO afcommentvo) {
		log.info("afcommentInsert 호출 성공");
		log.info("AfcommentVO : " + afcommentvo);
		int result = 0;
		
		result = afcommentService.afcommentInsert(afcommentvo);
		return(result==1) ? "SUCCESS":"FAILURE";
	}
	
	@DeleteMapping(value = "/{afcommentId}", produces = MediaType.TEXT_PLAIN_VALUE)
	public String afcommentDelete(@PathVariable("afcommentId") int afcommentId, AfcommentVO afcommentvo) {
		afcommentvo.setAfcommentId(afcommentId);
		int result = afcommentService.afcommentDelete(afcommentvo);
		return(result==1)?"SUCCESS":"FAILURE";
	}
	
	@PutMapping(value = "/{afcommentId}",
			consumes = "application/json",
			produces = MediaType.TEXT_PLAIN_VALUE)
	public String afcommentUpdate(@PathVariable("afcommentId") int afcommentId, @RequestBody AfcommentVO afcommentvo) {
		afcommentvo.setAfcommentId(afcommentId);
		int result = afcommentService.afcommentUpdate(afcommentvo);
		return(result==1)?"SUCCESS":"FAILURE";
	}
	
	@GetMapping("afcommentDetail")
	public AfcommentVO fcommentDetail(Model model, AfcommentVO fvo) {
//		System.out.println("test call");
		AfcommentVO detail = afcommentService.afcommentDetail(fvo);
//		System.out.println("detai:" + detail);

		model.addAttribute("detail", detail);
		return detail;
	}

}