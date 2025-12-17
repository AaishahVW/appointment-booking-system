package com.example.appointment.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "Credentials")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Credential {
    @Id
    @GeneratedValue
    private UUID credentialId;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(nullable = false)
    private String passwordHash;

    @Column(nullable = false)
    private LocalDateTime createdAt;
}
