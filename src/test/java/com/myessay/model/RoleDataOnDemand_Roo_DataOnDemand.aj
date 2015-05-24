// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.myessay.model;

import com.myessay.model.Role;
import com.myessay.model.RoleDataOnDemand;
import com.myessay.model.RoleRepository;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect RoleDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RoleDataOnDemand: @Component;
    
    private Random RoleDataOnDemand.rnd = new SecureRandom();
    
    private List<Role> RoleDataOnDemand.data;
    
    @Autowired
    RoleRepository RoleDataOnDemand.roleRepository;
    
    public Role RoleDataOnDemand.getNewTransientRole(int index) {
        Role obj = new Role();
        setDescription(obj, index);
        setIsActivated(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void RoleDataOnDemand.setDescription(Role obj, int index) {
        String description = "description_" + index;
        if (description.length() > 70) {
            description = description.substring(0, 70);
        }
        obj.setDescription(description);
    }
    
    public void RoleDataOnDemand.setIsActivated(Role obj, int index) {
        Boolean isActivated = Boolean.TRUE;
        obj.setIsActivated(isActivated);
    }
    
    public void RoleDataOnDemand.setName(Role obj, int index) {
        String name = "name_" + index;
        if (name.length() > 20) {
            name = name.substring(0, 20);
        }
        obj.setName(name);
    }
    
    public Role RoleDataOnDemand.getSpecificRole(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Role obj = data.get(index);
        Integer id = obj.getId();
        return roleRepository.findOne(id);
    }
    
    public Role RoleDataOnDemand.getRandomRole() {
        init();
        Role obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getId();
        return roleRepository.findOne(id);
    }
    
    public boolean RoleDataOnDemand.modifyRole(Role obj) {
        return false;
    }
    
    public void RoleDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = roleRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Role' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Role>();
        for (int i = 0; i < 10; i++) {
            Role obj = getNewTransientRole(i);
            try {
                roleRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            roleRepository.flush();
            data.add(obj);
        }
    }
    
}