package com.oe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.oe.api.KakaoProfile;
import com.oe.api.OAuthToken;
import com.oe.domain.MarketUserVO;
import com.oe.service.MarketUserService;
import com.oe.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/")
@AllArgsConstructor
public class LoginController {

	private MarketUserService userService;
	private MyPageService mypageService;
	// 로그인 login.jsp로 이동하는 매핑
//	@GetMapping({ "login.do", "board/login.do" })
	@GetMapping("login")
	public String login(Model model) {

		return "user/login";
	}
	//http://localhost:8080/naverLogin?code=xCnHic7Yfxiyk6cAcH&state=
	
	@GetMapping("kakaoLogin")
	public String kakaoCallback(String code, RedirectAttributes rttr, HttpServletRequest request) {
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "d91ab7aadf761b0a9b0838e797372e06");
		params.add("redirect_uri", "http://localhost:8080/kakaoLogin");
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<>(params ,headers);
		
		// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
				ResponseEntity<String> response = rt.exchange(
						"https://kauth.kakao.com/oauth/token",
						HttpMethod.POST,
						kakaoTokenRequest,
						String.class
				);
				
				// Gson, Json Simple, ObjectMapper
				ObjectMapper objectMapper = new ObjectMapper();
				OAuthToken oauthToken = null;
				try {
					oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
				} catch (JsonMappingException e) {
					e.printStackTrace();
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
			
			RestTemplate rt2 = new RestTemplate();
			
			// HttpHeader 오브젝트 생성
			HttpHeaders headers2 = new HttpHeaders();
			headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
			headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			
			// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
			HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = 
					new HttpEntity<>(headers2);
			
			// Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
			ResponseEntity<String> response2 = rt2.exchange(
					"https://kapi.kakao.com/v2/user/me",
					HttpMethod.POST,
					kakaoProfileRequest2,
					String.class
			);
			System.out.println(response2.getBody());
			
			ObjectMapper objectMapper2 = new ObjectMapper();
			KakaoProfile kakaoProfile = null;
			try {
				kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
//			log.info("카카오 아이디(번호) : " + kakaoProfile.getId());
//			log.info("이메일 : " + kakaoProfile.getKakao_account().getEmail());
			
//			MarketUserVO vo = new MarketUserVO();
//			
//			vo.setUs_id(kakaoProfile.getId());
//			vo.setUs_pass("kakaopass");
//			vo.setUs_name(kakaoProfile.getProperties().getNickname());
//			vo.setUs_nickname(kakaoProfile.getProperties().getNickname());
//			vo.setUs_address1("카카오");
//			vo.setUs_address2("카카오동");
//			vo.setUs_phone("010-0000-0000");
			
			String us_id = kakaoProfile.getId();
			String us_name = kakaoProfile.getProperties().getNickname();
			log.info("======================kakaoProfile.getId()"+us_id);
			log.info("======================userService.getId(uskakao_id)"+userService.checkID(us_id));
			
			if(userService.checkID(us_id) == null) {
				rttr.addAttribute("us_id",us_id);
				rttr.addAttribute("us_name",us_name);
				return "redirect:/user/joinKakao";
			}else {
				MarketUserVO vo =  userService.kakaologinUser(us_id);
				HttpSession session = request.getSession();
				session = request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("login", vo);
				session.setAttribute("mypage", mypageService.get(vo.getUs_id()));
				return "redirect:/";
			}
			
			
			
	}//@GetMapping("kakaoLogin")
	
	
	@PostMapping({ "loginUser", "board/loginUser" })
	public String loginUser(MarketUserVO vo, HttpServletRequest request, Model model) {
		MarketUserVO userVO = userService.userCheck(vo);
		log.info(vo);

		if (userVO != null && userVO.getUs_id() != null) {
			log.info(userVO);
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("login", userVO);
			session.setAttribute("mypage", mypageService.get(vo.getUs_id()));
//	         model.addAttribute("result","yes" );
			return "redirect:/";
		} else {
			model.addAttribute("result", "no");
			return "/user/login";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("login");
		return "redirect:/";
	}
}
