package com.example.appointment.model;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;

@Entity
@Table(name = "Case_types")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CaseType {
    @Id
    @GeneratedValue
    private UUID caseTypeId;

    @Column(nullable = false)
    private String caseTypeName;
}
