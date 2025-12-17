package com.example.appointment.repository;
import com.example.appointment.model.Credential;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;
import org.springframework.stereotype.Repository;

@Repository
public interface CredentialRepository extends JpaRepository<Credential, UUID> {
}
