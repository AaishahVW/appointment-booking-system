package com.example.appointment.service;

import com.example.appointment.model.Client;
import com.example.appointment.model.Credential;
import com.example.appointment.model.User;
import com.example.appointment.repository.ClientRepository;
import com.example.appointment.repository.CredentialRepository;
import com.example.appointment.repository.UserRepository;
import com.example.appointment.security.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AuthService {
    private final UserRepository userRepository;
    private final CredentialRepository credentialRepository;
    private final ClientRepository clientRepository;
    private final JwtService jwtService;

    private Map<String, Object> buildAuthResponse(User user, Client client) {
        String token = jwtService.generateToken(user.getUserId(), client.getClientId());

        Map<String, Object> result = new HashMap<>();
        result.put("token", token);
        result.put("clientId", client.getClientId());
        result.put("firstName", user.getFirstName());
        result.put("lastName", user.getLastName());
        return result;
    }

    public Map<String, Object> signup(String firstName, String lastName, String email,
                                      String phoneNumber, String nationalId, String password) {

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        user.setNationalId(nationalId);
        user.setCreatedAt(LocalDateTime.now());
        userRepository.save(user);

        Credential credential = new Credential();
        credential.setUser(user);
        credential.setUsername(nationalId);
        credential.setPasswordHash(BCrypt.hashpw(password, BCrypt.gensalt()));
        credential.setCreatedAt(LocalDateTime.now());
        credentialRepository.save(credential);

        Client client = new Client();
        client.setUser(user);
        client.setCeNumber("CE-" + UUID.randomUUID().toString().substring(0, 8));
        client.setCreatedAt(LocalDateTime.now());
        clientRepository.save(client);

        return buildAuthResponse(user, client);
    }

    public Map<String, Object> login(String username, String password) {
        Credential credential = credentialRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Invalid credentials"));

        if (!BCrypt.checkpw(password, credential.getPasswordHash())) {
            throw new RuntimeException("Invalid credentials");
        }

        User user = credential.getUser();
        Client client = clientRepository.findByUser(user)
                .orElseThrow(() -> new RuntimeException("Client not found"));

        return buildAuthResponse(user, client);
    }
}