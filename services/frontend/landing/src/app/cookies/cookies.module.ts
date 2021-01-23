import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CookiesRoutingModule } from './cookies-routing.module';
import { CookiesNoticeComponent } from './components/cookies-notice/cookies-notice.component';
import { MatButtonModule } from '@angular/material/button';
import { MatToolbarModule } from '@angular/material/toolbar';
import { CookiesPageComponent } from './pages/cookies-page/cookies-page.component';


@NgModule({
  declarations: [CookiesNoticeComponent, CookiesPageComponent],
  imports: [
    CommonModule,
    CookiesRoutingModule,
    MatButtonModule,
    MatToolbarModule
  ],
  exports: [CookiesNoticeComponent, CookiesPageComponent]
})
export class CookiesModule { }
