export interface LoginResponse {
  user: {
    first_name: string;
    last_name: string;
    email: string;
    password: string;
  },
  token: string;
}