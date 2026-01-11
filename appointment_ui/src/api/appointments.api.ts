import { http } from "./http";

export interface CreateAppointmentPayload {
  clientId: string;
  employeeId: string | null;
  branchId: string;
  productId?: string | null;
  caseTypeId?: string | null;
  appointmentDate: string;
  startTime: string;
  endTime: string;
  status: string;
  notes?: string;
}

export const appointmentsApi = {
  create(payload: CreateAppointmentPayload) {
    return http.post("/appointments", payload).then((res) => res.data);
  },
  getMine() {
    return http.get("/appointments/me").then((res) => res.data);
  },
  update(id: string, payload: Partial<CreateAppointmentPayload>) {
    return http.put(`/appointments/${id}`, payload).then((res) => res.data);
  },
};
