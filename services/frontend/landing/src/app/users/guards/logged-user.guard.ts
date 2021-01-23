import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router, CanActivate } from '@angular/router';
import { Observable } from 'rxjs';
import { UsersService } from '../users.service';

@Injectable({
  providedIn: 'root'
})
export class LoggedUserGuard implements CanActivate {
  constructor(private _users: UsersService, private _router: Router){}

  canActivate(): boolean {
      if (this._users.isLogged()) {
        this._router.navigate(['/']);
        return false;
      } 

      return true;
  }
  
}
