package com.example.appointment.repository;

import com.example.appointment.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface EmployeeRepository extends JpaRepository<Employee, UUID> {

    List<Employee> findByBranch_BranchIdAndIsActiveTrueOrderByCreatedAtAsc(UUID branchId);

    Optional<Employee> findByEmployeeIdAndBranch_BranchIdAndIsActiveTrue(UUID employeeId, UUID branchId);
}
