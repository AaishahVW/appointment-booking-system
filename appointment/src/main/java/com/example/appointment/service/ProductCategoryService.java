package com.example.appointment.service;

import com.example.appointment.model.ProductCategory;
import com.example.appointment.repository.ProductCategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ProductCategoryService {

    private final ProductCategoryRepository repository;

    public ProductCategory create(ProductCategory category) {
        return repository.save(category);
    }

    public ProductCategory getById(UUID id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Product category not found"));
    }

    public List<ProductCategory> getAll() {
        return repository.findAll();
    }

    public ProductCategory update(UUID id, ProductCategory update) {
        ProductCategory category = getById(id);
        category.setCategoryName(update.getCategoryName());
        return repository.save(category);
    }

    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
