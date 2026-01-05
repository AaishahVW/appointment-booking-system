import { http } from "./http";

export interface TimeSlot {
  startTime: string;
  endTime: string;
  slotLabel: string;
}

export const timeSlotsApi = {
  getAll() {
    return http.get<TimeSlot[]>("/time-slots").then((res) => res.data);
  },
};
