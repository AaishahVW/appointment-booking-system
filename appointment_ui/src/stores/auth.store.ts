import { ref } from "vue";
import { http } from "@/api/http";

export const useAuthStore = () => {
  const clientId = ref<string | null>(null);
  const firstName = ref<string | null>(null);
  const lastName = ref<string | null>(null);

  const login = async (username: string, password: string) => {
    try {
      const res = await http.post("/auth/login", { username, password });
      // backend should return clientId, firstName, lastName
      clientId.value = res.data.clientId;
      firstName.value = res.data.firstName;
      lastName.value = res.data.lastName;
      return true;
    } catch (err) {
      console.error("Login failed", err);
      return false;
    }
  };

  const signup = async (payload: {
    firstName: string;
    lastName: string;
    email: string;
    phoneNumber: string;
    nationalId: string;
    password: string;
  }) => {
    try {
      const res = await http.post("/auth/signup", payload);
      clientId.value = res.data.clientId;
      firstName.value = res.data.firstName;
      lastName.value = res.data.lastName;
      return true;
    } catch (err) {
      console.error("Signup failed", err);
      return false;
    }
  };

  const logout = () => {
    clientId.value = null;
    firstName.value = null;
    lastName.value = null;
  };

  return {
    clientId,
    firstName,
    lastName,
    login,
    signup,
    logout,
  };
};
