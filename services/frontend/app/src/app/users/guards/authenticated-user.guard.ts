import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { UsersService } from '../services/users.service';

@Injectable({
  providedIn: 'root'
})
export class AuthenticatedUserGuard implements CanActivate {
  constructor(private _users: UsersService, private _router: Router){}

  canActivate(): boolean {
    if (!this._users.isLogged()) {
      this._router.navigate(['/login'])
      return false
    }

    return true;
  }
  
}
