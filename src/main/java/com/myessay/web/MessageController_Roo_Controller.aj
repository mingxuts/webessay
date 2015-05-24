// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.myessay.web;

import com.myessay.model.Message;
import com.myessay.model.MessagePK;
import com.myessay.model.MessageRepository;
import com.myessay.web.MessageController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.convert.ConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect MessageController_Roo_Controller {
    
    private ConversionService MessageController.conversionService;
    
    @Autowired
    MessageRepository MessageController.messageRepository;
    
    @Autowired
    public MessageController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MessageController.create(@Valid Message message, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, message);
            return "messages/create";
        }
        uiModel.asMap().clear();
        messageRepository.save(message);
        return "redirect:/messages/" + encodeUrlPathSegment(conversionService.convert(message.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MessageController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Message());
        return "messages/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MessageController.show(@PathVariable("id") MessagePK id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("message", messageRepository.findOne(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "messages/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MessageController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("messages", messageRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
            float nrOfPages = (float) messageRepository.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("messages", messageRepository.findAll());
        }
        addDateTimeFormatPatterns(uiModel);
        return "messages/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MessageController.update(@Valid Message message, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, message);
            return "messages/update";
        }
        uiModel.asMap().clear();
        messageRepository.save(message);
        return "redirect:/messages/" + encodeUrlPathSegment(conversionService.convert(message.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MessageController.updateForm(@PathVariable("id") MessagePK id, Model uiModel) {
        populateEditForm(uiModel, messageRepository.findOne(id));
        return "messages/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MessageController.delete(@PathVariable("id") MessagePK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Message message = messageRepository.findOne(id);
        messageRepository.delete(message);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/messages";
    }
    
    void MessageController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("message_createdate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void MessageController.populateEditForm(Model uiModel, Message message) {
        uiModel.addAttribute("message", message);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String MessageController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
