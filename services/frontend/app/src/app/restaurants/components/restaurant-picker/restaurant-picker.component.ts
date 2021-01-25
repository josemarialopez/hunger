import { Component, OnInit } from '@angular/core';
import { RestaurantsService } from '../../restaurants.service';
import { Restaurant } from '../../interfaces/restaurant'

import {
  trigger,
  state,
  style,
  animate,
  transition,
  keyframes
} from '@angular/animations';
import { Category } from '../../interfaces/category';
import { GetRestaurantsParameters } from '../../interfaces/get-restaurants-parameters';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'restaurant-picker',
  templateUrl: './restaurant-picker.component.html',
  styleUrls: ['./restaurant-picker.component.scss'],
  animations: [
    trigger("reject", [
      transition(":leave", [
        animate(
          300,
          keyframes([
            style({ transform: 'translateX(0)' }),
            style({ transform: 'translateX(-100vw'})
          ])
        )
      ])
    ])
  ]
})
export class RestaurantPickerComponent {
  
  categories: Category[] = [];
  mainCategories: Category[] = [];
  restaurants: Restaurant[] = []

  constructor(private _restaurants: RestaurantsService) {
    // this._restaurants.getRestaurants({})
    //     .subscribe((restaurants: Restaurant[]) => {
    //       this.restaurants = restaurants;
    //     });
    this._restaurants.getCategories()
      .subscribe((categories: Category[]) => {
        this.categories = categories;
        this.mainCategories =
          categories.filter((category: Category) => category.main );
      });
  }

  nextRestaurant(): void {
    this.restaurants.shift();
  }

  applyParameters(params: GetRestaurantsParameters): void {
    this._restaurants.getRestaurants(params)
        .subscribe((restaurants: Restaurant[]) => {
          this.restaurants = restaurants;
        });
  }
}
