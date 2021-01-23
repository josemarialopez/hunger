import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthenticatedUserGuard } from './guards/authenticated-user.guard';
import { NotAuthenticatedUserGuard } from './guards/not-authenticated-user.guard';
import { LoginPageComponent } from './pages/login-page/login-page.component';
import { SignupPageComponent } from './pages/signup-page/signup-page.component';

const routes: Routes = [
  {path: 'login', component: LoginPageComponent, canActivate: [NotAuthenticatedUserGuard]},
  {path: 'signup', component: SignupPageComponent, canActivate: [NotAuthenticatedUserGuard]}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UsersRoutingModule { }
