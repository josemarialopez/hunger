import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LayoutModule } from './layout/layout.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SharedModule } from './shared/shared.module';
import { UsersModule } from './users/users.module';
import { CookiesModule } from './cookies/cookies.module';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    LayoutModule,
    BrowserAnimationsModule,
    UsersModule,
    CookiesModule,
    HttpClientModule,
    SharedModule // Always the last module
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
