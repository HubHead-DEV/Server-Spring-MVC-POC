// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nrx.poc.web;

import com.nrx.poc.domain.Attribute;
import com.nrx.poc.repository.AttributeRepository;
import com.nrx.poc.web.AttributeController;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AttributeController_Roo_Controller {
    
    @Autowired
    AttributeRepository AttributeController.attributeRepository;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AttributeController.create(@Valid Attribute attribute, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, attribute);
            return "attributes/create";
        }
        uiModel.asMap().clear();
        attributeRepository.save(attribute);
        return "redirect:/attributes/" + encodeUrlPathSegment(attribute.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AttributeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Attribute());
        return "attributes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AttributeController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("attribute", attributeRepository.findOne(id));
        uiModel.addAttribute("itemId", id);
        return "attributes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AttributeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("attributes", attributeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
            float nrOfPages = (float) attributeRepository.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("attributes", attributeRepository.findAll());
        }
        return "attributes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AttributeController.update(@Valid Attribute attribute, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, attribute);
            return "attributes/update";
        }
        uiModel.asMap().clear();
        attributeRepository.save(attribute);
        return "redirect:/attributes/" + encodeUrlPathSegment(attribute.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AttributeController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, attributeRepository.findOne(id));
        return "attributes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AttributeController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Attribute attribute = attributeRepository.findOne(id);
        attributeRepository.delete(attribute);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/attributes";
    }
    
    void AttributeController.populateEditForm(Model uiModel, Attribute attribute) {
        uiModel.addAttribute("attribute", attribute);
    }
    
    String AttributeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
