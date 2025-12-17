package com.example.appointment.repository;

import com.example.appointment.model.CaseType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;
@Repository
public interface CaseTypeRepository extends JpaRepository<CaseType, UUID> {
}
