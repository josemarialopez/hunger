import { Component, OnInit } from '@angular/core';
import { UsersService } from '../../services/users.service';

@Component({
  selector: 'account-button',
  templateUrl: './account-button.component.html',
  styleUrls: ['./account-button.component.scss']
})
export class AccountButtonComponent implements OnInit {

  constructor(private _users: UsersService) { }

  ngOnInit(): void {
  }

  logout(): void {
    this._users.logoutUser();
    window.location.href = 'http://www.hungerapp.net';
  }

}
