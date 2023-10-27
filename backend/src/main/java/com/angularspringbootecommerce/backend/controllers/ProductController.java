package com.angularspringbootecommerce.backend.controllers;

import com.angularspringbootecommerce.backend.dtos.ProductDto;
import com.angularspringbootecommerce.backend.exceptions.AppException;
import com.angularspringbootecommerce.backend.models.Product;
import com.angularspringbootecommerce.backend.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/api/v1/products")
public class ProductController {

    private final ProductService productService;

    @GetMapping("all")
    public List<Product> getAll() {
        return productService.getAllProducts();
    }

    @PostMapping("add")
    public Product add(@RequestBody ProductDto productDto, Principal principal) {
        Collection<? extends GrantedAuthority> authorities = ((JwtAuthenticationToken)principal).getAuthorities();
        System.out.println("Authorities: " + authorities);



        if (
                productDto.getName() == null ||
                productDto.getName().isEmpty() ||
                productDto.getDescription() == null || productDto.getDescription().isEmpty() ||
                productDto.getImgUrl() == null || productDto.getImgUrl().isEmpty() ||
                productDto.getPrice().compareTo(BigDecimal.ZERO) <= 0) {

            throw new AppException("All fields are required.", HttpStatus.BAD_REQUEST);
        }
        String role;
        role=authorities.toString();
        if(role.equals("[ADMIN]")) {
            Product newProduct = new Product();
            newProduct.setName(productDto.getName());
            newProduct.setDescription(productDto.getDescription());
            newProduct.setPrice(productDto.getPrice());
            newProduct.setImgUrl(productDto.getImgUrl());
            return productService.add(newProduct);
        }
        throw new AppException("All fields are required.", HttpStatus.BAD_REQUEST);
    }

    @GetMapping("/{productId}")
    public ResponseEntity<?> getProductById(@PathVariable Long productId) {
        Optional<Product> productOptional = productService.getProductById(productId);

        if (productOptional.isPresent()) {
            Product product = productOptional.get();
            return ResponseEntity.ok(product);
        } else {
            throw new AppException("Product not found", HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{productId}")
    public ResponseEntity<?> deleteProduct(@PathVariable Long productId) {
        productService.deleteProductById(productId);
        return ResponseEntity.noContent().build();
    }
}