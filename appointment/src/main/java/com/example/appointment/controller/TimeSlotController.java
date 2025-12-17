package com.example.appointment.controller;

import com.example.appointment.model.TimeSlot;
import com.example.appointment.service.TimeSlotService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/time-slots")
@RequiredArgsConstructor
public class TimeSlotController {

    private final TimeSlotService service;

    @PostMapping
    public ResponseEntity<TimeSlot> create(@RequestBody TimeSlot slot) {
        return ResponseEntity.ok(service.create(slot));
    }

    @GetMapping("/{id}")
    public ResponseEntity<TimeSlot> getById(@PathVariable UUID id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<TimeSlot>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @PutMapping("/{id}")
    public ResponseEntity<TimeSlot> update(@PathVariable UUID id, @RequestBody TimeSlot slot) {
        return ResponseEntity.ok(service.update(id, slot));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
