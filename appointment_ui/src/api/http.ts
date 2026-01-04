import axios, { AxiosHeaders } from "axios";
import { useAuthStore } from "@/stores/auth.store";

export const http = axios.create({
  baseURL: import.meta.env.VITE_API_URL || "http://localhost:8080/api",
});

http.interceptors.request.use((config) => {
  const auth = useAuthStore();
  console.log("Interceptor token:", auth.token);
  if (auth.token) {
    config.headers = new AxiosHeaders(config.headers).set(
      "Authorization",
      `Bearer ${auth.token}`
    );
  }
  return config;
});
