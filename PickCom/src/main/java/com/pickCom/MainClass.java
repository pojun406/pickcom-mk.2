package com.pickCom;

import com.pickCom.common.CommandMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainClass {
    @RequestMapping("/main.do")
    public ModelAndView mainForm(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("main");

        return mv;
    }
}
