import { HttpErrorResponse } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { LoginResponse } from '../../interfaces/loginResponse';
import { UsersService } from '../../services/users.service';

@Component({
  selector: 'login-form',
  templateUrl: './login-form.component.html',
  styleUrls: ['./login-form.component.scss']
})
export class LoginFormComponent {

  error: String = '';

  constructor(
    private _builder: FormBuilder,
    private _users: UsersService,
    private _router: Router
  ) { }

  loginForm = this._builder.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', Validators.required]
  })



  onSubmit(): void {
    this._users.loginUser({
      user: {
        email: this.loginForm.value.email,
        password: this.loginForm.value.password
      }
    }).subscribe((response: LoginResponse) => {
      window.location.href = 'http://app.hungerapp.net';
    }, (error: HttpErrorResponse) => {
      this.handleLoginError(error)
    })

  }

  getEmailErrorMessage() {
    let control = this.loginForm.controls['email'];

    if (control.hasError('required')) {
      return 'This field is required';
    }

    return control.hasError('email') ? 'Not a valid email' : '';
  }

  getPasswordErrorMessage() {
    let control = this.loginForm.controls['password'];

    return control.hasError('required') ? 'This field is required' : '';
  }

  cancelLogin() {
    window.location.href = "http://www.hungerapp.net";
  }

  private handleLoginError(error: HttpErrorResponse) {
    if (error.status === 401) {
      this.error = 'The user credentials you have introduced are not valid';
    }
  }

}
