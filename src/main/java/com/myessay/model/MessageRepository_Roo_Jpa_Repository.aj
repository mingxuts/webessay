// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.myessay.model;

import com.myessay.model.Message;
import com.myessay.model.MessagePK;
import com.myessay.model.MessageRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect MessageRepository_Roo_Jpa_Repository {
    
    declare parents: MessageRepository extends JpaRepository<Message, MessagePK>;
    
    declare parents: MessageRepository extends JpaSpecificationExecutor<Message>;
    
    declare @type: MessageRepository: @Repository;
    
}