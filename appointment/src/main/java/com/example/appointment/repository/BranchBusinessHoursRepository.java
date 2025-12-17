package com.example.appointment.repository;

import com.example.appointment.model.BranchBusinessHours;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;
@Repository
public interface BranchBusinessHoursRepository extends JpaRepository<BranchBusinessHours, UUID> {
}
