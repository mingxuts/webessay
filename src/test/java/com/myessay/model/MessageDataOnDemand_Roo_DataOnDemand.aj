// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.myessay.model;

import com.myessay.model.Message;
import com.myessay.model.MessageDataOnDemand;
import com.myessay.model.MessagePK;
import com.myessay.model.MessageRepository;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect MessageDataOnDemand_Roo_DataOnDemand {
    
    declare @type: MessageDataOnDemand: @Component;
    
    private Random MessageDataOnDemand.rnd = new SecureRandom();
    
    private List<Message> MessageDataOnDemand.data;
    
    @Autowired
    MessageRepository MessageDataOnDemand.messageRepository;
    
    public Message MessageDataOnDemand.getNewTransientMessage(int index) {
        Message obj = new Message();
        setEmbeddedIdClass(obj, index);
        setAuditText(obj, index);
        setCreateDate(obj, index);
        setFileId(obj, index);
        setHasAdudit(obj, index);
        setHasRead(obj, index);
        setSendToUser(obj, index);
        setText(obj, index);
        return obj;
    }
    
    public void MessageDataOnDemand.setEmbeddedIdClass(Message obj, int index) {
        Integer id = new Integer(index);
        Integer taskId = new Integer(index);
        
        MessagePK embeddedIdClass = new MessagePK(id, taskId);
        obj.setId(embeddedIdClass);
    }
    
    public void MessageDataOnDemand.setAuditText(Message obj, int index) {
        String auditText = "auditText_" + index;
        obj.setAuditText(auditText);
    }
    
    public void MessageDataOnDemand.setCreateDate(Message obj, int index) {
        Calendar createDate = Calendar.getInstance();
        obj.setCreateDate(createDate);
    }
    
    public void MessageDataOnDemand.setFileId(Message obj, int index) {
        Integer fileId = new Integer(index);
        obj.setFileId(fileId);
    }
    
    public void MessageDataOnDemand.setHasAdudit(Message obj, int index) {
        Boolean hasAdudit = Boolean.TRUE;
        obj.setHasAdudit(hasAdudit);
    }
    
    public void MessageDataOnDemand.setHasRead(Message obj, int index) {
        Boolean hasRead = Boolean.TRUE;
        obj.setHasRead(hasRead);
    }
    
    public void MessageDataOnDemand.setSendToUser(Message obj, int index) {
        Integer sendToUser = new Integer(index);
        obj.setSendToUser(sendToUser);
    }
    
    public void MessageDataOnDemand.setText(Message obj, int index) {
        String text = "text_" + index;
        obj.setText(text);
    }
    
    public Message MessageDataOnDemand.getSpecificMessage(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Message obj = data.get(index);
        MessagePK id = obj.getId();
        return messageRepository.findOne(id);
    }
    
    public Message MessageDataOnDemand.getRandomMessage() {
        init();
        Message obj = data.get(rnd.nextInt(data.size()));
        MessagePK id = obj.getId();
        return messageRepository.findOne(id);
    }
    
    public boolean MessageDataOnDemand.modifyMessage(Message obj) {
        return false;
    }
    
    public void MessageDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = messageRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Message' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Message>();
        for (int i = 0; i < 10; i++) {
            Message obj = getNewTransientMessage(i);
            try {
                messageRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            messageRepository.flush();
            data.add(obj);
        }
    }
    
}
