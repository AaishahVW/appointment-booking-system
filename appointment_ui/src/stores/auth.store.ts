import { defineStore } from "pinia";
import { ref, computed } from "vue";
import { http } from "@/api/http";

export const useAuthStore = defineStore("auth", () => {
  const token = ref<string | null>(sessionStorage.getItem("token"));
  const isLoggedIn = computed(() => !!token.value);
  const clientId = ref<string | null>(sessionStorage.getItem("clientId"));
  const firstName = ref<string | null>(sessionStorage.getItem("firstName"));
  const lastName = ref<string | null>(sessionStorage.getItem("lastName"));

  async function login(username: string, password: string) {
    try {
      const res = await http.post("/auth/login", { username, password });

      token.value = res.data.token;
      clientId.value = res.data.clientId;
      firstName.value = res.data.firstName;
      lastName.value = res.data.lastName;

      if (token.value) sessionStorage.setItem("token", token.value);
      if (clientId.value) sessionStorage.setItem("clientId", clientId.value);
      if (firstName.value) sessionStorage.setItem("firstName", firstName.value);
      if (lastName.value) sessionStorage.setItem("lastName", lastName.value);

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

      if (token.value) sessionStorage.setItem("token", token.value);
      if (clientId.value) sessionStorage.setItem("clientId", clientId.value);
      if (firstName.value) sessionStorage.setItem("firstName", firstName.value);
      if (lastName.value) sessionStorage.setItem("lastName", lastName.value);

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

    sessionStorage.removeItem("token");
    sessionStorage.removeItem("clientId");
    sessionStorage.removeItem("firstName");
    sessionStorage.removeItem("lastName");
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
