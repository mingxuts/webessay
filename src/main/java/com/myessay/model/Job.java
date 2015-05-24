package com.myessay.model;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "job")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "writerId", "customerId" })
public class Job {
}
