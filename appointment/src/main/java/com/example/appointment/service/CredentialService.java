package com.example.appointment.service;

import com.example.appointment.model.Credential;
import com.example.appointment.model.User;
import com.example.appointment.repository.CredentialRepository;
import com.example.appointment.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CredentialService {

    private final CredentialRepository repository;
    private final UserRepository userRepository;

    public Credential create(Credential credential, UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        credential.setUser(user);
        credential.setCreatedAt(LocalDateTime.now());
        return repository.save(credential);
    }

    public Credential getById(UUID id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Credential not found"));
    }

    public List<Credential> getAll() {
        return repository.findAll();
    }

    public Credential update(UUID id, Credential update) {
        Credential credential = getById(id);
        credential.setUsername(update.getUsername());
        credential.setPasswordHash(update.getPasswordHash());
        return repository.save(credential);
    }

    public void delete(UUID id) {
        repository.deleteById(id);
    }
}
