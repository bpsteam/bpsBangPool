package com.project.bangpool.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShoppingController {

	@RequestMapping("cart.sh")
	public String cartViewPage() {
		return "cart";
	}
	
	
	@RequestMapping("payment.sh")
	public String paymentViewPage() {
		return "payment";
	}
	
	
	
}
