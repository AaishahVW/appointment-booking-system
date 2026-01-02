import { http } from "./http";

export interface Branch {
  branchId: string;
  branchName: string;
  streetNumber?: string;
  streetName?: string;
  city?: string;
  province?: string;
  postalCode?: string;
  phoneNumber?: string;
  email?: string;
}

export const branchesApi = {
  getAll() {
    return http.get<Branch[]>("/branches").then((res) => res.data);
  },
};
