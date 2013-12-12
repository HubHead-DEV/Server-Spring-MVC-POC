package com.nrx.poc.web;
import com.nrx.poc.domain.Location;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/locations")
@Controller
@RooWebScaffold(path = "locations", formBackingObject = Location.class)
@RooWebJson(jsonObject = Location.class)
public class LocationController {
}
