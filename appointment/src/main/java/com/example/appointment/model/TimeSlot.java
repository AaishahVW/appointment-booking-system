package com.example.appointment.model;

import jakarta.persistence.*;
import lombok.*;
import java.util.UUID;
import java.time.LocalTime;

@Entity
@Table(name = "Time_slots")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TimeSlot {
    @Id
    @GeneratedValue
    private UUID slotId;

    @Column(nullable = false)
    private LocalTime startTime;

    @Column(nullable = false)
    private LocalTime endTime;

    private String slotLabel;
}
