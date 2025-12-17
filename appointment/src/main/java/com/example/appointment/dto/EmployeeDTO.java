package com.example.appointment.dto;

import lombok.*;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmployeeDTO {
    private UUID userId;
    private String cpNumber;
    private UUID branchId;
    private String workEmail;
    private Boolean isActive;
}
