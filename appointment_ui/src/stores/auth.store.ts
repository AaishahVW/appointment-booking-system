import { defineStore } from "pinia";
import { ref, computed } from "vue";
import { http } from "@/api/http";

export const useAuthStore = defineStore("auth", () => {
  const token = ref<string | null>(localStorage.getItem("token"));
  const isLoggedIn = computed(() => !!token.value);
  const clientId = ref<string | null>(localStorage.getItem("clientId"));
  const firstName = ref<string | null>(localStorage.getItem("firstName"));
  const lastName = ref<string | null>(localStorage.getItem("lastName"));

  async function login(username: string, password: string) {
    try {
      const res = await http.post("/auth/login", { username, password });

      token.value = res.data.token;
      clientId.value = res.data.clientId;
      firstName.value = res.data.firstName;
      lastName.value = res.data.lastName;

      if (token.value) localStorage.setItem("token", token.value);
      if (clientId.value) localStorage.setItem("clientId", clientId.value);
      if (firstName.value) localStorage.setItem("firstName", firstName.value);
      if (lastName.value) localStorage.setItem("lastName", lastName.value);

      window.dispatchEvent(new Event("auth-success"));

      return true;
    } catch (e) {
      return false;
    }
  }

  async function signup(payload: {
    firstName: string;
    lastName: string;
    email: string;
    phoneNumber: string;
    nationalId: string;
    password: string;
  }) {
    try {
      const res = await http.post("/auth/signup", payload);

      token.value = res.data.token;
      clientId.value = res.data.clientId;
      firstName.value = res.data.firstName;
      lastName.value = res.data.lastName;

      if (token.value) localStorage.setItem("token", token.value);
      if (clientId.value) localStorage.setItem("clientId", clientId.value);
      if (firstName.value) localStorage.setItem("firstName", firstName.value);
      if (lastName.value) localStorage.setItem("lastName", lastName.value);

      window.dispatchEvent(new Event("auth-success"));

      return true;
    } catch (e) {
      return false;
    }
  }

  function logout() {
    token.value = null;
    clientId.value = null;
    firstName.value = null;
    lastName.value = null;

    localStorage.removeItem("token");
    localStorage.removeItem("clientId");
    localStorage.removeItem("firstName");
    localStorage.removeItem("lastName");
    location.reload();
  }

  return {
    token,
    clientId,
    firstName,
    lastName,
    isLoggedIn,
    login,
    signup,
    logout,
  };
});
