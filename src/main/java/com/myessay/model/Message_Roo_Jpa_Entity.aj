// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.myessay.model;

import com.myessay.model.Message;
import com.myessay.model.MessagePK;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

privileged aspect Message_Roo_Jpa_Entity {
    
    declare @type: Message: @Entity;
    
    declare @type: Message: @Table(name = "message");
    
    @EmbeddedId
    private MessagePK Message.id;
    
    public MessagePK Message.getId() {
        return this.id;
    }
    
    public void Message.setId(MessagePK id) {
        this.id = id;
    }
    
}
