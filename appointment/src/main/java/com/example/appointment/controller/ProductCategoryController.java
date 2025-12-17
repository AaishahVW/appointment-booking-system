package com.example.appointment.controller;

import com.example.appointment.model.ProductCategory;
import com.example.appointment.service.ProductCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/product-categories")
@RequiredArgsConstructor
public class ProductCategoryController {

    private final ProductCategoryService service;

    @PostMapping
    public ResponseEntity<ProductCategory> create(@RequestBody ProductCategory category) {
        return ResponseEntity.ok(service.create(category));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductCategory> getById(@PathVariable UUID id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<ProductCategory>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @PutMapping("/{id}")
    public ResponseEntity<ProductCategory> update(@PathVariable UUID id, @RequestBody ProductCategory category) {
        return ResponseEntity.ok(service.update(id, category));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
