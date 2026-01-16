package com.example.appointment.service;

import com.example.appointment.model.CaseType;
import com.example.appointment.repository.CaseTypeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CaseTypeService {

    private final CaseTypeRepository repository;

    public CaseType create(CaseType caseType) {
        return repository.save(caseType);
    }

    public CaseType getById(UUID id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Case type not found"));
    }

    public List<CaseType> getAll() {
        return repository.findAll();
    }

    public CaseType update(UUID id, CaseType update) {
        CaseType caseType = getById(id);
        caseType.setCaseTypeName(update.getCaseTypeName());
        return repository.save(caseType);
    }

    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
