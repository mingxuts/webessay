// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.myessay.model;

import com.myessay.model.Userinfo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect Userinfo_Roo_Jpa_Entity {
    
    declare @type: Userinfo: @Entity;
    
    declare @type: Userinfo: @Table(name = "userinfo");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Integer Userinfo.id;
    
    public Integer Userinfo.getId() {
        return this.id;
    }
    
    public void Userinfo.setId(Integer id) {
        this.id = id;
    }
    
}
