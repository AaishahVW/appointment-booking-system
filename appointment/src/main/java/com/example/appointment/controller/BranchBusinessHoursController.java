package com.example.appointment.controller;

import com.example.appointment.model.BranchBusinessHours;
import com.example.appointment.service.BranchBusinessHoursService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/business-hours")
@CrossOrigin(origins = "http://localhost:5173")
@RequiredArgsConstructor
public class BranchBusinessHoursController {

    private final BranchBusinessHoursService service;

    @PostMapping
    public ResponseEntity<BranchBusinessHours> create(@RequestBody BranchBusinessHours hours) {
        return ResponseEntity.ok(service.create(hours));
    }

    @GetMapping("/{id}")
    public ResponseEntity<BranchBusinessHours> getById(@PathVariable UUID id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<BranchBusinessHours>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @PutMapping("/{id}")
    public ResponseEntity<BranchBusinessHours> update(@PathVariable UUID id, @RequestBody BranchBusinessHours hours) {
        return ResponseEntity.ok(service.update(id, hours));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
