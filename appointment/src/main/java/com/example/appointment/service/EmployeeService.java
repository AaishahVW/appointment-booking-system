package com.example.appointment.service;

import com.example.appointment.model.Employee;
import com.example.appointment.model.User;
import com.example.appointment.repository.EmployeeRepository;
import com.example.appointment.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class EmployeeService {

    private final EmployeeRepository employeeRepository;
    private final UserRepository userRepository;

    public Employee create(Employee employee, UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        employee.setUser(user);
        employee.setCreatedAt(LocalDateTime.now());
        return employeeRepository.save(employee);
    }

    public Employee getById(UUID id) {
        return employeeRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Employee not found"));
    }

    public List<Employee> getAll() {
        return employeeRepository.findAll();
    }

    public List<Employee> getByBranch(UUID branchId) {
        return employeeRepository
                .findByBranch_BranchIdAndIsActiveTrueOrderByCreatedAtAsc(branchId);
    }

    public Employee update(UUID id, Employee update) {
        Employee employee = getById(id);
        employee.setCpNumber(update.getCpNumber());
        employee.setWorkEmail(update.getWorkEmail());
        employee.setIsActive(update.getIsActive());
        return employeeRepository.save(employee);
    }

    public void delete(UUID id) {
        employeeRepository.deleteById(id);
    }
}
