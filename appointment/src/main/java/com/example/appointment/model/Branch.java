package com.example.appointment.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "Branches")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Branch {
    @Id
    @GeneratedValue
    private UUID branchId;

    @Column(nullable = false)
    private String branchName;

    private String streetNumber;
    private String streetName;
    private String city;
    private String province;
    private String postalCode;
    private String phoneNumber;
    private String email;

    @Column(nullable = false)
    private LocalDateTime createdAt;
}
