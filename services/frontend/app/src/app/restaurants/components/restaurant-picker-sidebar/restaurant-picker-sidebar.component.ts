import { Position } from '@angular/compiler';
import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { GeolocationService } from '../../geolocation.service';
import { Category } from '../../interfaces/category';
import { RestaurantsService } from '../../restaurants.service';

@Component({
  selector: 'restaurant-picker-sidebar',
  templateUrl: './restaurant-picker-sidebar.component.html',
  styleUrls: ['./restaurant-picker-sidebar.component.scss']
})
export class RestaurantPickerSidebarComponent implements OnInit {
  @Output() applied: EventEmitter<Object> = new EventEmitter();

  term: string = '';
  location: string = '';
  radius: number | null = 5;
  categories: Category[] = [];
  selectedCategories: Category[] = [];
  selectedPrices: number[] = []
  gelocalatable: boolean = true;

  constructor(private _restaurants: RestaurantsService, private _geolocation: GeolocationService) { }

  ngOnInit() {
    this._restaurants.getCategories()
      .subscribe((categories: Category[]) => {
        this.categories = categories;
      })
    
    this.geolocate();
    
  }

  geolocate() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        if (position) {
          let longitude = position.coords.longitude;
          let latitude = position.coords.latitude;
          // this._geolocation
          //     .geolocateByCoordinates(latitude, longitude)
          //     .subscribe((response: any) => {
          //       this.location = response['results'][0]['formatted_address'];
          //     });
          this.location = 'Málaga';
          this.apply();
        }
      });
    } else {
      
    }
  }


  apply() {
    this.applied.emit({
      term: this.term,
      location: this.location,
      radius: this.radius! * 1000,
      categories: this.selectedCategories,
      prices: this.selectedPrices
    });
  }


  

    

}
