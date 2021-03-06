// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.myessay.model;

import com.myessay.model.MessageDataOnDemand;
import com.myessay.model.MessageIntegrationTest;
import com.myessay.model.MessagePK;
import com.myessay.model.MessageRepository;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MessageIntegrationTest_Roo_IntegrationTest {
    
    declare @type: MessageIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: MessageIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: MessageIntegrationTest: @Transactional;
    
    @Autowired
    MessageDataOnDemand MessageIntegrationTest.dod;
    
    @Autowired
    MessageRepository MessageIntegrationTest.messageRepository;
    
    @Test
    public void MessageIntegrationTest.testCount() {
        Assert.assertNotNull("Data on demand for 'Message' failed to initialize correctly", dod.getRandomMessage());
        long count = messageRepository.count();
        Assert.assertTrue("Counter for 'Message' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void MessageIntegrationTest.testFind() {
        Message obj = dod.getRandomMessage();
        Assert.assertNotNull("Data on demand for 'Message' failed to initialize correctly", obj);
        MessagePK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Message' failed to provide an identifier", id);
        obj = messageRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Message' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Message' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void MessageIntegrationTest.testFindAll() {
        Assert.assertNotNull("Data on demand for 'Message' failed to initialize correctly", dod.getRandomMessage());
        long count = messageRepository.count();
        Assert.assertTrue("Too expensive to perform a find all test for 'Message', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Message> result = messageRepository.findAll();
        Assert.assertNotNull("Find all method for 'Message' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Message' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void MessageIntegrationTest.testFindEntries() {
        Assert.assertNotNull("Data on demand for 'Message' failed to initialize correctly", dod.getRandomMessage());
        long count = messageRepository.count();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Message> result = messageRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
        Assert.assertNotNull("Find entries method for 'Message' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Message' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void MessageIntegrationTest.testSave() {
        Assert.assertNotNull("Data on demand for 'Message' failed to initialize correctly", dod.getRandomMessage());
        Message obj = dod.getNewTransientMessage(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Message' failed to provide a new transient entity", obj);
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
        Assert.assertNotNull("Expected 'Message' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void MessageIntegrationTest.testDelete() {
        Message obj = dod.getRandomMessage();
        Assert.assertNotNull("Data on demand for 'Message' failed to initialize correctly", obj);
        MessagePK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Message' failed to provide an identifier", id);
        obj = messageRepository.findOne(id);
        messageRepository.delete(obj);
        messageRepository.flush();
        Assert.assertNull("Failed to remove 'Message' with identifier '" + id + "'", messageRepository.findOne(id));
    }
    
}
