package com.example.appointment.service;

import com.example.appointment.model.Appointment;
import com.example.appointment.repository.AppointmentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AppointmentService {

    private final AppointmentRepository repository;

    public Appointment create(Appointment appointment) {
        LocalDateTime now = LocalDateTime.now();
        appointment.setCreatedAt(now);
        appointment.setUpdatedAt(now);
        return repository.save(appointment);
    }

    public Appointment getById(UUID id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Appointment not found"));
    }

    public List<Appointment> getAll() {
        return repository.findAll();
    }

    public Appointment update(UUID id, Appointment update) {
        Appointment appointment = getById(id);
        appointment.setAppointmentDate(update.getAppointmentDate());
        appointment.setStartTime(update.getStartTime());
        appointment.setEndTime(update.getEndTime());
        appointment.setStatus(update.getStatus());
        appointment.setNotes(update.getNotes());
        appointment.setUpdatedAt(LocalDateTime.now());
        return repository.save(appointment);
    }

    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
