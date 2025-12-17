package com.example.appointment.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BranchDTO {
    private String branchName;
    private String streetNumber;
    private String streetName;
    private String city;
    private String province;
    private String postalCode;
    private String phoneNumber;
    private String email;
}
