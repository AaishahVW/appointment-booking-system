package com.example.appointment.controller;

import com.example.appointment.dto.AppointmentDTO;
import com.example.appointment.model.Appointment;
import com.example.appointment.service.AppointmentService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/appointments")
@CrossOrigin(origins = "http://localhost:5173")
@RequiredArgsConstructor
public class AppointmentController {

    private final AppointmentService service;

    @PostMapping
    public ResponseEntity<Appointment> create(
            @RequestBody AppointmentDTO dto,
            HttpServletRequest request
    ) {
        UUID clientId = UUID.fromString((String) request.getAttribute("clientId"));
        dto.setClientId(clientId);
        return ResponseEntity.ok(service.create(dto));
    }


    @GetMapping("/{id}")
    public ResponseEntity<Appointment> getById(@PathVariable UUID id) {
        return ResponseEntity.ok(service.getById(id));
    }

    @GetMapping
    public ResponseEntity<List<Appointment>> getAll() {
        return ResponseEntity.ok(service.getAll());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Appointment> update(@PathVariable UUID id, @RequestBody Appointment appointment) {
        return ResponseEntity.ok(service.update(id, appointment));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable UUID id) {
        service.delete(id);
        return ResponseEntity.noContent().build();
    }
}
