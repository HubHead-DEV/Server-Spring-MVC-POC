// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nrx.poc.domain;

import com.nrx.poc.domain.Location;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect Location_Roo_Mongo_Entity {
    
    declare @type: Location: @Persistent;
    
    @Id
    private BigInteger Location.id;
    
    public BigInteger Location.getId() {
        return this.id;
    }
    
    public void Location.setId(BigInteger id) {
        this.id = id;
    }
    
}
