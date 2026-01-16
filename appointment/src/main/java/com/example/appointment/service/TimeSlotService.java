package com.example.appointment.service;

import com.example.appointment.model.TimeSlot;
import com.example.appointment.repository.TimeSlotRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class TimeSlotService {

    private final TimeSlotRepository repository;

    public TimeSlot create(TimeSlot slot) {
        return repository.save(slot);
    }

    public TimeSlot getById(UUID id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Time slot not found"));
    }

    public List<TimeSlot> getAll() {
        return repository.findAll();
    }

    public TimeSlot update(UUID id, TimeSlot update) {
        TimeSlot slot = getById(id);
        slot.setStartTime(update.getStartTime());
        slot.setEndTime(update.getEndTime());
        slot.setSlotLabel(update.getSlotLabel());
        return repository.save(slot);
    }

    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
