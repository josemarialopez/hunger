import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CookiesPageComponent } from './pages/cookies-page/cookies-page.component';

const routes: Routes = [
  {
    path: 'cookies',
    component: CookiesPageComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CookiesRoutingModule { }
