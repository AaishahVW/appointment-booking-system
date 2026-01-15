package com.example.appointment.controller;

import com.example.appointment.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://localhost:5173")
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;

    @PostMapping("/signup")
    public ResponseEntity<Map<String, Object>> signup(@RequestBody Map<String, String> payload) {
        Map<String, Object> result = authService.signup(
                payload.get("firstName"),
                payload.get("lastName"),
                payload.get("email"),
                payload.get("phoneNumber"),
                payload.get("nationalId"),
                payload.get("password")
        );
        return ResponseEntity.ok(result);
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@RequestBody Map<String, String> payload) {
        Map<String, Object> result = authService.login(
                payload.get("username"),
                payload.get("password")
        );
        return ResponseEntity.ok(result);
    }
}
