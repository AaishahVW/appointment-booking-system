package com.example.appointment.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.DayOfWeek;
import java.util.UUID;
import java.time.LocalTime;

@Entity
@Table(name = "Branch_business_hours",
        uniqueConstraints = @UniqueConstraint(columnNames = {"branch_id", "day_of_week"}))
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BranchBusinessHours {
    @Id
    @GeneratedValue
    private UUID hoursId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "branch_id")
    private Branch branch;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private DayOfWeek dayOfWeek;

    @Column(nullable = false)
    private LocalTime openTime;

    @Column(nullable = false)
    private LocalTime closeTime;
}
