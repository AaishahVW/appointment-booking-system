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

export interface BranchBusinessHours {
  hoursId: string;
  branch: Branch;
  dayOfWeek: number;
  openTime: string;
  closeTime: string;
}

export interface BranchWithHours extends Branch {
  businessHours: {
    hoursId: string;
    branchId: string;
    dayOfWeek: number;
    openTime: string;
    closeTime: string;
  }[];
}

export const branchesApi = {
  getAll: async (): Promise<BranchWithHours[]> => {
    const branches = await http
      .get<Branch[]>("/branches")
      .then((res) => res.data);

    const hours = await http
      .get<BranchBusinessHours[]>("/business-hours")
      .then((res) => res.data);

    return branches.map((branch) => ({
      ...branch,
      businessHours: hours
        .filter((h) => h.branch.branchId === branch.branchId)
        .map((h) => ({
          hoursId: h.hoursId,
          branchId: h.branch.branchId,
          dayOfWeek: h.dayOfWeek,
          openTime: h.openTime,
          closeTime: h.closeTime,
        })),
    }));
  },
};
