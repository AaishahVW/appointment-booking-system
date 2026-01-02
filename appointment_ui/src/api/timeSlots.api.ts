import { http } from "./http";

export interface TimeSlot {
  startTime: string;
  endTime: string;
  slotLabel: string;
}

export const timeSlotsApi = {
  getByBranchAndDate(branchId: string, date: string) {
    return http
      .get<TimeSlot[]>(`/time-slots?branchId=${branchId}&date=${date}`)
      .then((res) => res.data);
  },
};
