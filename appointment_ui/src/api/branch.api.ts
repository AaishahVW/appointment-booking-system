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
  getAll: async (): Promise<Branch[]> => {
    const res = await http.get("/branches"); // token automatically attached
    return res.data;
  },
};
