package com.example.appointment.controller;

import com.example.appointment.model.Branch;
import com.example.appointment.service.BranchService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/branches")
@RequiredArgsConstructor
public class BranchController {

    private final BranchService branchService;

    @PostMapping
    public ResponseEntity<Branch> create(@RequestBody Branch branch) {
        return ResponseEntity.ok(branchService.create(branch));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Branch> getById(@PathVariable UUID id) {
        return ResponseEntity.ok(branchService.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<Branch>> getAll() {
        return ResponseEntity.ok(branchService.getAll());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Branch> update(@PathVariable UUID id, @RequestBody Branch branch) {
        return ResponseEntity.ok(branchService.update(id, branch));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        branchService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
