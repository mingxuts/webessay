package com.myessay.model;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;


@RooJpaRepository(domainType = Userinfo.class)
public interface UserinfoRepository {
	
	public Userinfo findByEmail(String email); 
}
