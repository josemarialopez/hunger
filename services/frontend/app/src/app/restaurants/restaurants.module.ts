import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { RestaurantsRoutingModule } from './restaurants-routing.module';
import { PickRestaurantPageComponent } from './pages/pick-restaurant-page/pick-restaurant-page.component';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatFormFieldModule } from '@angular/material/form-field'
import { MatInputModule } from '@angular/material/input'
import { MatButtonToggleModule } from '@angular/material/button-toggle'
import { MatSliderModule } from '@angular/material/slider';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { RestaurantPickerComponent } from './components/restaurant-picker/restaurant-picker.component';
import { MatCardModule } from '@angular/material/card';
import { MatDividerModule } from '@angular/material/divider';
import { MatChipsModule } from '@angular/material/chips';
import { MatListModule } from '@angular/material/list';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';

import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RestaurantsInterceptor } from './interceptors/restaurants.interceptor';
import { fromEventPattern } from 'rxjs';
import { RestaurantCardComponent } from './components/restaurant-card/restaurant-card.component';
import { RestaurantPickerSidebarComponent } from './components/restaurant-picker-sidebar/restaurant-picker-sidebar.component';


@NgModule({
  declarations: [PickRestaurantPageComponent, RestaurantPickerComponent, RestaurantCardComponent, RestaurantPickerSidebarComponent],
  imports: [
    CommonModule,
    RestaurantsRoutingModule,
    MatSidenavModule,
    MatIconModule,
    MatButtonModule,
    MatFormFieldModule,
    FormsModule,
    MatInputModule,
    MatButtonToggleModule,
    MatSliderModule,
    MatCheckboxModule,
    MatCardModule,
    MatDividerModule,
    MatChipsModule,
    HttpClientModule,
    MatListModule,
    MatProgressSpinnerModule
  ],
  providers: [
  ]
})
export class RestaurantsModule { }
