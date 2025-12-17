package com.example.appointment.service;

import com.example.appointment.model.Client;
import com.example.appointment.model.User;
import com.example.appointment.repository.ClientRepository;
import com.example.appointment.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ClientService {

    private final ClientRepository clientRepository;
    private final UserRepository userRepository;

    public Client create(Client client, UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        client.setUser(user);
        client.setCreatedAt(LocalDateTime.now());
        return clientRepository.save(client);
    }

    public Client getById(UUID id) {
        return clientRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Client not found"));
    }

    public List<Client> getAll() {
        return clientRepository.findAll();
    }

    public Client update(UUID id, Client update) {
        Client client = getById(id);
        client.setCeNumber(update.getCeNumber());
        return clientRepository.save(client);
    }

    public void delete(UUID id) {
        clientRepository.deleteById(id);
    }
}
