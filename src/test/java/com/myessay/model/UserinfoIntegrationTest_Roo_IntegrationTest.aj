// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.myessay.model;

import com.myessay.model.UserinfoDataOnDemand;
import com.myessay.model.UserinfoIntegrationTest;
import com.myessay.model.UserinfoRepository;
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

privileged aspect UserinfoIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserinfoIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserinfoIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UserinfoIntegrationTest: @Transactional;
    
    @Autowired
    UserinfoDataOnDemand UserinfoIntegrationTest.dod;
    
    @Autowired
    UserinfoRepository UserinfoIntegrationTest.userinfoRepository;
    
    @Test
    public void UserinfoIntegrationTest.testCount() {
        Assert.assertNotNull("Data on demand for 'Userinfo' failed to initialize correctly", dod.getRandomUserinfo());
        long count = userinfoRepository.count();
        Assert.assertTrue("Counter for 'Userinfo' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserinfoIntegrationTest.testFind() {
        Userinfo obj = dod.getRandomUserinfo();
        Assert.assertNotNull("Data on demand for 'Userinfo' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Userinfo' failed to provide an identifier", id);
        obj = userinfoRepository.findOne(id);
        Assert.assertNotNull("Find method for 'Userinfo' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Userinfo' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void UserinfoIntegrationTest.testFindAll() {
        Assert.assertNotNull("Data on demand for 'Userinfo' failed to initialize correctly", dod.getRandomUserinfo());
        long count = userinfoRepository.count();
        Assert.assertTrue("Too expensive to perform a find all test for 'Userinfo', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Userinfo> result = userinfoRepository.findAll();
        Assert.assertNotNull("Find all method for 'Userinfo' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Userinfo' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserinfoIntegrationTest.testFindEntries() {
        Assert.assertNotNull("Data on demand for 'Userinfo' failed to initialize correctly", dod.getRandomUserinfo());
        long count = userinfoRepository.count();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Userinfo> result = userinfoRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
        Assert.assertNotNull("Find entries method for 'Userinfo' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Userinfo' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UserinfoIntegrationTest.testSave() {
        Assert.assertNotNull("Data on demand for 'Userinfo' failed to initialize correctly", dod.getRandomUserinfo());
        Userinfo obj = dod.getNewTransientUserinfo(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Userinfo' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Userinfo' identifier to be null", obj.getId());
        try {
            userinfoRepository.save(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        userinfoRepository.flush();
        Assert.assertNotNull("Expected 'Userinfo' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void UserinfoIntegrationTest.testDelete() {
        Userinfo obj = dod.getRandomUserinfo();
        Assert.assertNotNull("Data on demand for 'Userinfo' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Userinfo' failed to provide an identifier", id);
        obj = userinfoRepository.findOne(id);
        userinfoRepository.delete(obj);
        userinfoRepository.flush();
        Assert.assertNull("Failed to remove 'Userinfo' with identifier '" + id + "'", userinfoRepository.findOne(id));
    }
    
}
