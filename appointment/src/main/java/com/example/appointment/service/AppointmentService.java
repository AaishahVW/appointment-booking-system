package com.example.appointment.service;

import com.example.appointment.dto.AppointmentAvailabilityResponse;
import com.example.appointment.dto.AppointmentDTO;
import com.example.appointment.dto.AppointmentUpdateDTO;
import com.example.appointment.exception.SlotAlreadyBookedException;
import com.example.appointment.model.Appointment;
import com.example.appointment.model.Branch;
import com.example.appointment.model.BranchBusinessHours;
import com.example.appointment.repository.AppointmentRepository;
import com.example.appointment.repository.BranchBusinessHoursRepository;
import com.example.appointment.repository.BranchRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AppointmentService {

    private final AppointmentRepository repository;
    private final BranchRepository branchRepository;
    private final BranchBusinessHoursRepository businessHoursRepository;


    @Transactional
    public Appointment create(AppointmentDTO dto) {

        Branch branch = branchRepository.findById(dto.getBranchId())
                .orElseThrow(() -> new RuntimeException("Branch not found"));

        Appointment appointment = Appointment.builder()
                .clientId(dto.getClientId())
                .employeeId(dto.getEmployeeId())
                .branch(branch)
                .productId(dto.getProductId())
                .caseTypeId(dto.getCaseTypeId())
                .appointmentDate(dto.getAppointmentDate())
                .startTime(dto.getStartTime())
                .endTime(dto.getEndTime())
                .status(dto.getStatus())
                .notes(dto.getNotes())
                .createdAt(LocalDateTime.now())
                .updatedAt(LocalDateTime.now())
                .build();

        try {
            return repository.save(appointment);
        } catch (DataIntegrityViolationException ex) {
            throw new SlotAlreadyBookedException();
        }
    }

    public Appointment getById(UUID id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Appointment not found"));
    }

    public List<Appointment> getAll() {
        return repository.findAll();
    }
    public List<Appointment> getByClientId(UUID clientId) {
        return repository.findByClientId(clientId);
    }

    public Appointment update(UUID id, AppointmentUpdateDTO dto) {
        Appointment appointment = getById(id);

        if (dto.getAppointmentDate() != null) {
            appointment.setAppointmentDate(dto.getAppointmentDate());
        }

        if (dto.getStartTime() != null) {
            appointment.setStartTime(dto.getStartTime());
        }

        if (dto.getEndTime() != null) {
            appointment.setEndTime(dto.getEndTime());
        }

        if (dto.getStatus() != null) {
            appointment.setStatus(dto.getStatus());
        }

        if (dto.getNotes() != null) {
            appointment.setNotes(dto.getNotes());
        }

        appointment.setUpdatedAt(LocalDateTime.now());
        return repository.save(appointment);
    }

    public AppointmentAvailabilityResponse getAvailability(UUID branchId, String date) {

        LocalDate localDate = LocalDate.parse(date);

        // Disable past dates
        if (localDate.isBefore(LocalDate.now())) {
            return new AppointmentAvailabilityResponse(
                    date, true, null, null, List.of()
            );
        }

        // Disable Sundays
        if (localDate.getDayOfWeek() == DayOfWeek.SUNDAY) {
            return new AppointmentAvailabilityResponse(
                    date, true, null, null, List.of()
            );
        }

        BranchBusinessHours hours =
                businessHoursRepository
                        .findByBranch_BranchIdAndDayOfWeek(branchId, localDate.getDayOfWeek())
                        .orElse(null);

        if (hours == null) {
            return new AppointmentAvailabilityResponse(
                    date, true, null, null, List.of()
            );
        }

        List<Appointment> booked =
                repository.findByBranch_BranchIdAndAppointmentDateAndStatus(
                        branchId,
                        localDate,
                        "BOOKED"
                );

        List<LocalTime> unavailable =
                booked.stream()
                        .map(Appointment::getStartTime)
                        .toList();

        return new AppointmentAvailabilityResponse(
                date,
                false,
                hours.getOpenTime(),
                hours.getCloseTime(),
                unavailable
        );
    }


    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
