package com.myessay.web;
import com.myessay.model.Subject;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/subjects")
@Controller
@RooWebScaffold(path = "subjects", formBackingObject = Subject.class)
public class SubjectController {
}
