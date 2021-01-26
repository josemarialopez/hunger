import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { LoginResponse } from '../../interfaces/loginResponse';
import { UsersService } from '../../services/users.service';

@Component({
  selector: 'signup-form',
  templateUrl: './signup-form.component.html',
  styleUrls: ['./signup-form.component.scss']
})
export class SignupFormComponent implements OnInit {

  constructor(
    private _builder: FormBuilder,
    private _users: UsersService,
    private _router: Router
  ) { }

  signupForm = this._builder.group({
    firstName: ['', [Validators.required]],
    lastName: ['', [Validators.required]],
    email: ['', [Validators.required, Validators.email]],
    password: ['', Validators.required]
  })

  ngOnInit(): void {
  }


  getFirstNameErrorMessage() {
    let control = this.signupForm.controls['firstName'];

    return control.hasError('required') ? 'This field is required' : '';
  }


  getLastNameErrorMessage() {
    let control = this.signupForm.controls['lastName'];

    return control.hasError('required') ? 'This field is required' : '';
  }


  getEmailErrorMessage() {
    let control = this.signupForm.controls['email'];

    if (control.hasError('required')) {
      return 'This field is required';
    }

    return control.hasError('email') ? 'Not a valid email' : '';
  }

  getPasswordErrorMessage() {
    let control = this.signupForm.controls['password'];

    return control.hasError('required') ? 'This field is required' : '';
  }


  onSubmit(): void {
    this._users.signupUser({
      user: {
        first_name: this.signupForm.value.firstName,
        last_name: this.signupForm.value.lastName,
        email: this.signupForm.value.email,
        password: this.signupForm.value.password
      }
    }).subscribe((response: any) => {
      this._users.loginUser({
        user: {
          email: this.signupForm.value.email,
          password: this.signupForm.value.password
        }
      }).subscribe((response: LoginResponse) => {
        window.location.href = 'http://app.hungerapp.net';
      })
    }, (error: HttpErrorResponse) => {
      this.handleSignupError(error)
    })
  }

  cancelSignup() {
    window.location.href = "http://www.hungerapp.net";
  }


  private handleSignupError(error: HttpErrorResponse) {
    console.log(error.error);

  }

}
