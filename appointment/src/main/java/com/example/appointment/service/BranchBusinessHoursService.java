package com.example.appointment.service;

import com.example.appointment.model.BranchBusinessHours;
import com.example.appointment.repository.BranchBusinessHoursRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class BranchBusinessHoursService {

    private final BranchBusinessHoursRepository repository;

    public BranchBusinessHours create(BranchBusinessHours hours) {
        return repository.save(hours);
    }

    public BranchBusinessHours getById(UUID id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Business hours not found"));
    }

    public List<BranchBusinessHours> getAll() {
        return repository.findAll();
    }

    public BranchBusinessHours update(UUID id, BranchBusinessHours update) {
        BranchBusinessHours hours = getById(id);
        hours.setDayOfWeek(update.getDayOfWeek());
        hours.setOpenTime(update.getOpenTime());
        hours.setCloseTime(update.getCloseTime());
        return repository.save(hours);
    }

    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
