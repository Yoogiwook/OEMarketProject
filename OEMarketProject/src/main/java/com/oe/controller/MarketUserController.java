package com.oe.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oe.domain.MarketUserVO;
import com.oe.service.MarketUserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class MarketUserController {

	private MarketUserService userService;

	private JavaMailSender mailSender;



	// ==============================================
	@GetMapping("join")
	public void joinUser() {
	}
	
	@GetMapping("joinKakao")
	public void joinKakaOUser(String us_id, String us_name, Model model) {
		model.addAttribute("us_id",us_id);
		model.addAttribute("us_name",us_name);
	}

	@PostMapping("join")
	public String joinUser(MarketUserVO vo, RedirectAttributes rttr) {
		log.info("vo : " + vo);
		userService.register(vo);
		userService.MyRegister(vo);
		rttr.addFlashAttribute("result", vo.getUs_id());
		return "redirect:/";
	}

	@GetMapping({ "get", "update" })
	public void getUser(String us_id, Model model) {
		log.info("getUser : " + us_id);
		model.addAttribute("user", userService.get(us_id));

	}

	@PostMapping("update")
	public String updateUser(MarketUserVO vo, RedirectAttributes rttr) {
		log.info("update vo : " + vo);
		userService.modify(vo);
		userService.modifyAdrr(vo);
		rttr.addAttribute("my_id", vo.getUs_id());
		return "redirect:/mypage/mypage";
	}

	@ResponseBody
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public String emailAuth(String email) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		/* 이메일 보내기 */
		String setFrom = "jinaa0103@gmail.com";
		String toMail = email;
		String title = "아이디/비밀번호찾기 인증 이메일 입니다..";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Integer.toString(checkNum);
		
	}

	@GetMapping("findId")
	public String findId(String us_id, Model model) {
		if(us_id == null) {
			us_id = "";
		}
		log.info("get : " + us_id);
		model.addAttribute("us_id", us_id);
		return "user/findId";
	}

	@PostMapping("findId")
	public String findId(MarketUserVO vo, RedirectAttributes rttr) {
		
		rttr.addAttribute("us_id", userService.findId(vo));
		log.info("post : " + userService.findId(vo));
		return "redirect:/user/findId";
	}
	
	@GetMapping("findPass")
	public String findPass(String us_pass, Model model) {
		if(us_pass == null) {
			us_pass = "";
		}
		log.info("get : " + us_pass);
		model.addAttribute("us_pass", us_pass);
		return "user/findPass";
	}
	
	@PostMapping("findPass")
	public String findPass(MarketUserVO vo, RedirectAttributes rttr) {
		
		rttr.addAttribute("us_pass", userService.findPass(vo));
		log.info("post : " + userService.findPass(vo));
		return "redirect:/user/findPass";
	}

	@GetMapping("idCheck")
	public void checkID(Model model, String us_id, String result) {
		log.info("idCheck=============================");
		log.info(us_id);
		if (result != null) {
			model.addAttribute("result", result);
		} else {
			result = "";
			model.addAttribute("result", result);
		}

		model.addAttribute("user", us_id);
	}

	@PostMapping("idCheck")
	public String checkID(RedirectAttributes rttr, String us_id) {
		String result;
		if (userService.checkID(us_id) != null) {
			result = "N";
		} else {
			result = "Y";
		}
		rttr.addAttribute("result", result);
		rttr.addAttribute("us_id", us_id);

		log.info(us_id);
		log.info(result);
		return "redirect:/user/idCheck";
	}

	@GetMapping("nicknameCheck")
	public void checkNickname(Model model, String us_nickname, String result) {
		log.info("nicknameCheck=============================");
		log.info(us_nickname);
		if (result != null) {
			model.addAttribute("result", result);
		} else {
			result = "";
			model.addAttribute("result", result);
		}

		model.addAttribute("nickname", us_nickname);
	}

	@PostMapping("nicknameCheck")
	public String checkNickname(RedirectAttributes rttr, String us_nickname) {
		String result;
		if (userService.checkNickname(us_nickname) != null) {
			result = "N";
		} else {
			result = "Y";
		}
		rttr.addAttribute("result", result);
		rttr.addAttribute("us_nickname", us_nickname);

		log.info(us_nickname);
		log.info(result);
		return "redirect:/user/nicknameCheck";
	}
}//
