package com.example.appointment.dto;

import lombok.*;
import java.time.LocalTime;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BranchBusinessHoursDTO {
    private UUID branchId;
    private int dayOfWeek;
    private LocalTime openTime;
    private LocalTime closeTime;
}
