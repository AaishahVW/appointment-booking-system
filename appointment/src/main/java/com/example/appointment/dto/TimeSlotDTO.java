package com.example.appointment.dto;

import lombok.*;

import java.time.LocalTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TimeSlotDTO {
    private LocalTime startTime;
    private LocalTime endTime;
    private String slotLabel;
}
