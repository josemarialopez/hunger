import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CookiesService {

  constructor() { }


  areAccepted(): boolean {
    return localStorage.getItem('cookiesAccepted') == 'true';
  }

  acceptCookies(): void {
    return localStorage.setItem('cookiesAccepted', 'true');
  }

  denyCookies(): void {
    return localStorage.removeItem('cookiesAccepted');
  }
}
