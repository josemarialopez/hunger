import { Component, OnInit } from '@angular/core';
import { UsersService } from 'src/app/users/users.service';

@Component({
  selector: 'layout-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  constructor(private _users: UsersService) { }

  ngOnInit(): void {
  }

  isLogged(): boolean {
    return this._users.isLogged();
  }

  logout(): void {
    this._users.logoutUser();
  }

}
