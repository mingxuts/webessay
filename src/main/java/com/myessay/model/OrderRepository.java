package com.myessay.model;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Order.class)
public interface OrderRepository {
}
