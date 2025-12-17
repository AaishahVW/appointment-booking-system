package com.example.appointment.service;

import com.example.appointment.model.Branch;
import com.example.appointment.repository.BranchRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class BranchService {

    private final BranchRepository branchRepository;

    public Branch create(Branch branch) {
        branch.setCreatedAt(LocalDateTime.now());
        return branchRepository.save(branch);
    }

    public Branch getById(UUID id) {
        return branchRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Branch not found"));
    }

    public List<Branch> getAll() {
        return branchRepository.findAll();
    }

    public Branch update(UUID id, Branch update) {
        Branch branch = getById(id);
        branch.setBranchName(update.getBranchName());
        branch.setStreetNumber(update.getStreetNumber());
        branch.setStreetName(update.getStreetName());
        branch.setCity(update.getCity());
        branch.setProvince(update.getProvince());
        branch.setPostalCode(update.getPostalCode());
        branch.setPhoneNumber(update.getPhoneNumber());
        branch.setEmail(update.getEmail());
        return branchRepository.save(branch);
    }

    public void delete(UUID id) {
        branchRepository.deleteById(id);
    }
}
