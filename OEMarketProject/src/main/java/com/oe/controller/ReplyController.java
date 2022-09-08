package com.oe.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.oe.domain.CriteriaVO;
import com.oe.domain.ReplyPageDTO;
import com.oe.domain.ReplyVO;
import com.oe.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*		   URL		HTTP 전송방식
 등록 : /replies/new : Post 
 조회 : /replies/:rno : Get
 삭제 : /replies/:rno : Delete
 수정 : /replies/:rno : PUT or PATCH
 
 페이지 처리 : /replies/pages/:bno/:page : GET 
 */


//@Controller
@RestController //@Controller + @ResponseBody
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	//클라이언트에서 서버전송 json, 서버에서 클라이언트 string
	//{속성:값, 속성:값} --> @RequestBody --> body에 값이 함께 넘어온다..?
	//{bno:값, reply:값, replyer:값} 식의 bno가 있고 값이 있는 식의 패턴으로 @RequestBody로 ReplyVO로 값을
	@PostMapping(value="/new", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplyVO : " + vo);
		int insertCount = service.register(vo);
		
		if(insertCount == 1) {	// 성공 여부 판별
			return new ResponseEntity<>("success", HttpStatus.OK); // 성공하면 reply.js의 success:~ 부분이 동작
		}else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 실패하면 reply.js의 error:~ 부분이 동작
		}
	}
	
	@GetMapping(value="/pages/{bo_num}/{page}", // 어떤 번호의 몇 페이지까지 들고올지 
			produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE}) // 반환 타입
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("bo_num")Long bo_num, @PathVariable("page") int page) {
		log.info("getList..." + bo_num + " : " + page);
		CriteriaVO cri = new CriteriaVO(page, 10);  // 10개 페이지씩
		log.info("cri : " + cri);
		
		return new ResponseEntity<>(service.getListPage(cri, bo_num), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{re_num}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("re_num")Long re_num) {
		
		if(service.remove(re_num) == 1) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(value="/get/{re_num}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("re_num")Long re_num){
		return new ResponseEntity<ReplyVO>(service.get(re_num), HttpStatus.OK);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{re_num}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@PathVariable("re_num")Long re_num, @RequestBody ReplyVO vo){
		vo.setRe_num(re_num);
		return service.modify(vo)==1? new ResponseEntity<String>("success", HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}

}
