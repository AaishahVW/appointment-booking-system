package com.example.appointment.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDTO {
    private String nationalId;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
}
