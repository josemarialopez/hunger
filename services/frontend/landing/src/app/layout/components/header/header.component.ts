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

  login(): void {
    window.location.href = 'http://app.hungerapp.net/login';
  }


  signup(): void {
    window.location.href = 'http://app.hungerapp.net/signup'
  }


}
