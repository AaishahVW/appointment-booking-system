package com.example.appointment.dto;

import lombok.*;

import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CredentialDTO {
    private UUID userId;
    private String username;
    private String passwordHash;
}
