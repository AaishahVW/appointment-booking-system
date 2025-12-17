package com.example.appointment.controller;

import com.example.appointment.model.Product;
import com.example.appointment.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService service;

    @PostMapping("/{categoryId}")
    public ResponseEntity<Product> create(@RequestBody Product product, @PathVariable UUID categoryId) {
        return ResponseEntity.ok(service.create(product, categoryId));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> getById(@PathVariable UUID id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<Product>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @PutMapping("/{id}/{categoryId}")
    public ResponseEntity<Product> update(@PathVariable UUID id, @PathVariable UUID categoryId, @RequestBody Product product) {
        return ResponseEntity.ok(service.update(id, product, categoryId));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
