package com.myessay.web;
import com.myessay.model.Userinfo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/userinfoes")
@Controller
@RooWebScaffold(path = "userinfoes", formBackingObject = Userinfo.class)
public class UserinfoController {
}
