package com.oe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oe.domain.MarketUserVO;
import com.oe.domain.MyPageVO;
import com.oe.service.AdminService;
import com.oe.service.MarketBoardService;
import com.oe.service.MyPageService;
import com.oe.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {

//    @Autowired
   private AdminService service;
   private MyPageService MPservice;
   private MarketBoardService MBservice;
   private ReplyService RPservice;
   
   //관리자 페이지
   @GetMapping("adminMode")
   public String adminMode(Model model) {
      log.info("============admin mode========");

      model.addAttribute("ad_user", service.adminUserList());
      model.addAttribute("ad_board", service.adminBoardList());
      return "/admin/admin";
   }
   //회원 관리 페이지
   @GetMapping("adminUser")
   public String adminUser(Model model ) {
      log.info("============admin user========");
      model.addAttribute("ad_user", service.adminUserList());
      return "/admin/userManage";
   }
   //게시글 관리 페이지
   @GetMapping("adminBoard")
   public String adminBoard(Model model) {
      log.info("============admin board========");
      
      model.addAttribute("ad_board", service.adminBoardList());
      return "/admin/boardManage";
   }

//   //관리자 등록 및 정보 페이지
//   @GetMapping("adminManage")
//   public String adminNotice(Model model) {
//      log.info("============admin========");
//      
//      return "/admin/adminManage";
//   }
   //회원의 게시글 페이지
   @GetMapping("adminUserBoard")
   public String userBoard(Model model, String us_id) {
      log.info("============userBoard========");
      model.addAttribute("ad_boardList", service.getUserBoard(us_id));
      return "/admin/userBoardList";
   }
   //회원의 댓글 페이지
   @GetMapping("adminUserReply")
   public String userReply(Model model, String us_id) {
      log.info("============userReply========");
      model.addAttribute("ad_replyList", service.getUserReply(us_id));
      return "/admin/userReplyList";
   }
   //회원의 정보 페이지
   @GetMapping("/adminUserInfo")
   public String adminUserInfo(Model model, String us_id) {
      log.info("=========userInfo=========");
      log.info("user_id=" + us_id);
      log.info("========================");
//      String us_id = "tqtq";
      model.addAttribute("user", service.getUserInfo(us_id));
      return "/admin/userInfo";
   }
   //회원 추방
   @PostMapping("userDelete")
   public String userDelete( String us_id) {
      log.info("============userDelete========");
      String my_id = us_id;
      log.info("my_id= "+ my_id);
      
      MyPageVO vo = MPservice.get(my_id);
      vo.setWd_reason_pre("강제 추방");
      vo.setWd_remark_pre("관리자의 의해 삭제");
      service.updatePass2(my_id);
      log.info("vo="+vo);
      log.info(vo.getWd_reason_pre());
      MPservice.saveWithdrawal(vo);
      MPservice.moveWithdrawal(vo);
      MPservice.withdrawal(vo);
      return "redirect:/admin/adminUser";
   }
   
     //게시글 블라인드 처리
     //보드매니지
     @PostMapping("boardBlind") 
     public String adminBoardBlind( Long bo_num) { 
        log.info("============adminBoardBlind========");
        service.userBoardBlind(bo_num);
     return  "redirect:/admin/adminBoard"; 
     }
     //유저 게시글 블라인드 처리
     //유저보드리스트
     @PostMapping("userBoardBlind") 
     public String userBoardBlind( Long bo_num) { 
        log.info("============userBoardBlind========");
        log.info(bo_num);
        service.userBoardBlind(bo_num);
     return "redirect:/admin/userBoardList"; 
     }
     
     //댓글 삭제
     @PostMapping("deleteUserReply")
     public String deleteUserReply(Long re_num, String us_id1, RedirectAttributes rttr) {
        log.info("=============delete Reply==========");
        log.info("re_num================"+re_num);
        String[] us_id = us_id1.split(",");
        log.info("us_id============="+us_id[0]);
        rttr.addAttribute("us_id", us_id[0]);
        RPservice.remove(re_num);
        return "redirect:/admin/adminUserReply";
     }
     
   //관리자 등록 및 정보 페이지
     @GetMapping("adminManage")
     public String adminManage(Model model) {
        log.info("============admin========");
        model.addAttribute("adminInfo",service.getAdminList());
        return "/admin/adminManage";
     }
     
     //관리자 등록 및 정보 페이지
     @PostMapping("adminJoin")
     public String registerAdmin( MarketUserVO vo) {
        log.info("============admin========");
        log.info(vo);
        service.registerAdmin(vo);
        service.registerMyPage(vo);
        return "redirect:/admin/adminManage";
     }
    
   
}