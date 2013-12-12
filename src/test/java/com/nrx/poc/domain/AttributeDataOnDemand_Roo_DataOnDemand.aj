// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nrx.poc.domain;

import com.nrx.poc.domain.Attribute;
import com.nrx.poc.domain.AttributeDataOnDemand;
import com.nrx.poc.repository.AttributeRepository;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect AttributeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AttributeDataOnDemand: @Component;
    
    private Random AttributeDataOnDemand.rnd = new SecureRandom();
    
    private List<Attribute> AttributeDataOnDemand.data;
    
    @Autowired
    AttributeRepository AttributeDataOnDemand.attributeRepository;
    
    public Attribute AttributeDataOnDemand.getNewTransientAttribute(int index) {
        Attribute obj = new Attribute();
        setName(obj, index);
        return obj;
    }
    
    public void AttributeDataOnDemand.setName(Attribute obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public Attribute AttributeDataOnDemand.getSpecificAttribute(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Attribute obj = data.get(index);
        BigInteger id = obj.getId();
        return attributeRepository.findOne(id);
    }
    
    public Attribute AttributeDataOnDemand.getRandomAttribute() {
        init();
        Attribute obj = data.get(rnd.nextInt(data.size()));
        BigInteger id = obj.getId();
        return attributeRepository.findOne(id);
    }
    
    public boolean AttributeDataOnDemand.modifyAttribute(Attribute obj) {
        return false;
    }
    
    public void AttributeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = attributeRepository.findAll(new org.springframework.data.domain.PageRequest(from / to, to)).getContent();
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Attribute' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Attribute>();
        for (int i = 0; i < 10; i++) {
            Attribute obj = getNewTransientAttribute(i);
            try {
                attributeRepository.save(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            data.add(obj);
        }
    }
    
}