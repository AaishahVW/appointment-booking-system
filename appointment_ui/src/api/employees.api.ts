import { http } from "./http";

export interface Employee {
  userId: string;
  employeeId: string;
  branchId: string;
  cpNumber: string;
  workEmail: string;
  isActive: boolean;
}

export const employeesApi = {
  getAll() {
    return http.get<Employee[]>("/employees").then((res) => res.data);
  },
  getByBranch(branchId: string) {
    return http
      .get<Employee[]>(`/employees?branchId=${branchId}`)
      .then((res) => res.data);
  },
};
