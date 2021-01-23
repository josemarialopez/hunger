import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { LoginParameters } from './interfaces/loginParameters';
import { LoginResponse } from './interfaces/loginResponse';
import { SignupParameters } from './interfaces/signupParameters';
import { SignupResponse } from './interfaces/signupResponse';

@Injectable({
  providedIn: 'root'
})
export class UsersService {
  
  USERS_API_PATH = 'http://api.hungerapp.com/v1/users';


  constructor(private _http: HttpClient) { }


  loginUser(params: LoginParameters): Observable<LoginResponse>{
    return this._http.post<LoginResponse>(`${this.USERS_API_PATH}/login`, params)
               .pipe(
                tap((response: LoginResponse) =>  {
                  localStorage.setItem('auth_token', response.token);
                })
               )
  }

  logoutUser(): void {
    localStorage.removeItem('auth_token');
  }

  signupUser(params: SignupParameters): Observable<SignupResponse> {
    return this._http.post<SignupParameters>(this.USERS_API_PATH, params)
  }


  isLogged(): boolean {
    return localStorage.getItem('auth_token') !== null;
  }







}
