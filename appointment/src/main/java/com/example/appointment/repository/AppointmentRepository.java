package com.example.appointment.repository;

import com.example.appointment.model.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;
@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, UUID> {
    List<Appointment> findByClientId(UUID clientId);
    List<Appointment> findByBranch_BranchIdAndAppointmentDate(
            UUID branchId,
            LocalDate appointmentDate
    );

    boolean existsByBranch_BranchIdAndAppointmentDateAndStartTime(
            UUID branchId,
            LocalDate appointmentDate,
            LocalTime startTime
    );
    List<Appointment> findByBranch_BranchIdAndAppointmentDateAndStatus(
            UUID branchId,
            LocalDate appointmentDate,
            String status
    );

}
