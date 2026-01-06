import axios, { AxiosHeaders } from "axios";
import { useAuthStore } from "@/stores/auth.store";

export const http = axios.create({
  baseURL: import.meta.env.VITE_API_URL || "http://localhost:8080/api",
});

http.interceptors.request.use((config) => {
  const auth = useAuthStore();
  if (auth.token) {
    config.headers = new AxiosHeaders(config.headers).set(
      "Authorization",
      `Bearer ${auth.token}`
    );
  }
  return config;
});

http.interceptors.response.use(
  (response) => response,
  (error) => {
    const auth = useAuthStore();

    if (error.response?.status === 401) {
      auth.logout();
    }

    return Promise.reject(error);
  }
);
