package com.ucm.viz.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ingestion")
public class IngestionController {

	
	@GetMapping("/greetings")
	public String getGreeting() {
		return "Hello World , Good Morning to All";
		
	}
}
