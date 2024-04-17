package kr.co.dong.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.DTO.NoticeDTO;
import kr.co.dong.service.NoticeService;


@Controller
public class GuideController {

	private static final Logger logger = LoggerFactory.getLogger(GuideController.class);

	@Autowired
	NoticeService noticeService;
	
	//공지사항 목록 + 페이징
	@GetMapping("board/noticeAll")
	public String notice(Model model, @RequestParam("num") int num
			) throws Exception{
	
		 // 게시물 총 갯수
		 int count = noticeService.count();
		  
		 // 한 페이지에 출력할 게시물 갯수
		 int postNum = 10;
		  
		 // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
		 int pageNum = (int)Math.ceil((double)count/postNum);
		  
		 // 출력할 게시물
		 int displayPost = (num - 1) * postNum;
		 
		 // 한번에 표시할 페이징 번호의 갯수
		 int pageNum_cnt = 10;

		// 표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);

		// 표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		 
		// 마지막 번호 재계산
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		 
		if(endPageNum > endPageNum_tmp) {
		 endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		List<NoticeDTO> list = noticeService.listPage(displayPost, postNum);
		model.addAttribute("noticeAll", list);   
		model.addAttribute("pageNum", pageNum);
		
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음 
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		 return "board/noticeAll";
	}
	
	
	
	//공지사항 내용보기
	@GetMapping("board/noticeDetail")
	public String detail(Model model, int notice_no) {
		NoticeDTO noticedto = noticeService.detail(notice_no);
		model.addAttribute("notice", noticedto);
		
		return "board/noticeDetail";
	}
	
	
	//공지사항 추가
	@GetMapping("board/noticeInsert")
	public String insert() {
		return "board/noticeInsert";
	}
	
	@PostMapping("board/noticeInsert")
	public String insert(NoticeDTO noticedto) {
		System.out.println(noticedto);
		int i = noticeService.insert(noticedto);
		
		return "redirect:/board/noticeAll?num=1";
	}

	//공지사항 수정
	@GetMapping("board/noticeUpdate")
	public String update(@RequestParam("notice_no") int notice_no, Model model) {
		NoticeDTO noticedto = noticeService.detail(notice_no);
		model.addAttribute("notice", noticedto);
		
		return "board/noticeUpdate";
	}
	
	@PostMapping("board/noticeUpdate")
	public String update(@RequestParam("notice_title") String notice_title, @RequestParam("notice_content") String notice_content, NoticeDTO noticedto,
		HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		request.setCharacterEncoding("UTF-8");
		
		noticedto.setNotice_title(notice_title);
		noticedto.setNotice_content(notice_content);
		logger.info("내용"+noticedto);
		int r = noticeService.update(noticedto);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","수정완료");
		}
		return "redirect:/board/noticeAll?num=1";
	}
	
	//공지사항 삭제
	@GetMapping("board/noticeDelete")
	public String delete(@RequestParam("notice_no") int notice_no, RedirectAttributes rttr) {
			
			int r = noticeService.delete(notice_no);
			
			if(r>0) {
				rttr.addFlashAttribute("msg","삭제완료");
				return "redirect:/board/noticeAll?num=1";
			}
		
		return "redirect:/board/noticeDetail?notice_no="+notice_no;
	}
	
	//Play
	@GetMapping("springcamping/play")
	private String play(Locale locale, Model model) {
		
		logger.info("주변 놀거리를 안내합니다.", locale);
		
		return "springcamping/play";
	}
	
	//Map
	@GetMapping("springcamping/map")
	private String map(Locale locale, Model model) {
		
		logger.info("찾아오시는 길", locale);
		
		return "springcamping/map";
	}

	
	//소개글
	@GetMapping("springcamping/story")
	private String story(Locale locale, Model model) {
		
		logger.info("소개글", locale);
		
		return "springcamping/story";
	}

	
	
}