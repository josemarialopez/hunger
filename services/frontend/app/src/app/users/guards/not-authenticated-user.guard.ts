import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { UsersService } from '../services/users.service';

@Injectable({
  providedIn: 'root'
})
export class NotAuthenticatedUserGuard implements CanActivate {
  constructor(private _users: UsersService, private _router: Router){}

  canActivate(): boolean {
    if (this._users.isLogged()) {
      this._router.navigate(['/']);
      return false;
    }

    return true;
  }
  
}
