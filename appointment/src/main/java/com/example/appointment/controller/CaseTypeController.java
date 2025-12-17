package com.example.appointment.controller;

import com.example.appointment.model.CaseType;
import com.example.appointment.service.CaseTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/case-types")
@RequiredArgsConstructor
public class CaseTypeController {

    private final CaseTypeService service;

    @PostMapping
    public ResponseEntity<CaseType> create(@RequestBody CaseType caseType) {
        return ResponseEntity.ok(service.create(caseType));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CaseType> getById(@PathVariable UUID id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<CaseType>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @PutMapping("/{id}")
    public ResponseEntity<CaseType> update(@PathVariable UUID id, @RequestBody CaseType caseType) {
        return ResponseEntity.ok(service.update(id, caseType));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
