package com.example.appointment.controller;

import com.example.appointment.model.Credential;
import com.example.appointment.service.CredentialService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/credentials")
@RequiredArgsConstructor
public class CredentialController {

    private final CredentialService service;

    @PostMapping("/{userId}")
    public ResponseEntity<Credential> create(@RequestBody Credential credential, @PathVariable UUID userId) {
        return ResponseEntity.ok(service.create(credential, userId));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Credential> getById(@PathVariable UUID id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<Credential>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Credential> update(@PathVariable UUID id, @RequestBody Credential credential) {
        return ResponseEntity.ok(service.update(id, credential));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
