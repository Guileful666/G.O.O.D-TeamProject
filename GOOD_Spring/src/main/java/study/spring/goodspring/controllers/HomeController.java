package study.spring.goodspring.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.CAS;
import study.spring.goodspring.service.CasService;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
	@Autowired
	WebHelper WebHelper;
	@Autowired
	RegexHelper RegexHelper;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	/** 문화체욱 선언 **/
	@Autowired
	CasService CasService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model,
			@RequestParam(value = "keyword_exp", required = false, defaultValue = "문화") String keyword_exp,
			@RequestParam(value = "keyword_imp", required = false, defaultValue = "교육") String keyword_imp,
			@RequestParam(value = "keyword_borrow", required = false, defaultValue = "대관") String keyword_borrow) {
		/** 홈컨트롤러 기본값 **/
		log.debug("HomeController 실행됨");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		/** 홈컨트롤러 기본값 끝 **/

		// 문화 창의 체험 시작
		CAS input_exp = new CAS();

		input_exp.setDIV_COL(keyword_exp);

		List<CAS> output_exp = null;

		try {
			output_exp = CasService.getOtherList(input_exp);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}

		// 문화 창의 체험 끝

		// 교육 자기계발 시작
		CAS input_imp = new CAS();
		input_imp.setDIV_COL(keyword_imp);

		List<CAS> output_imp = null;

		try {
			output_imp = CasService.getOtherList(input_imp);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}
		// 교육 자기계발 끝

		// 시설대관 시작
		CAS input_borrow = new CAS();
		input_borrow.setDIV_COL(keyword_borrow);

		List<CAS> output_borrow = null;

		try {
			output_borrow = CasService.getOtherList(input_borrow);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}
		// 시설대관 끝
		
		model.addAttribute("keyword_exp", keyword_exp);
		model.addAttribute("keyword_imp", keyword_imp);
		model.addAttribute("keyword_borrow", keyword_borrow);
		
		model.addAttribute("output_exp", output_exp);
		model.addAttribute("output_imp", output_imp);
		model.addAttribute("output_borrow", output_borrow);
		model.addAttribute("serverTime", formattedDate);

		return new ModelAndView("index");
	}

}
