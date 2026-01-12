package com.example.appointment.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.time.LocalTime;
import java.util.List;

@Data
@AllArgsConstructor
public class AppointmentAvailabilityResponse {
    private String date;
    private boolean disabled;
    private LocalTime openTime;
    private LocalTime closeTime;
    private List<LocalTime> unavailableTimes;
}


