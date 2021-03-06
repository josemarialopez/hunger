import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Category } from './interfaces/category';
import { GetRestaurantsParameters } from './interfaces/get-restaurants-parameters';
import { Restaurant } from './interfaces/restaurant';


@Injectable({
  providedIn: 'root'
})
export class RestaurantsService {

  constructor(private _http: HttpClient) { }


  getRestaurants(params: GetRestaurantsParameters): Observable<Restaurant[]> {
    return this._http.get<Restaurant[]>('http://api.hungerapp.net/v1/restaurants', { params: this.generateHttpOptions(params) } );
  }


  getCategories(): Observable<Category[]> {
    return this._http.get<Category[]>('http://api.hungerapp.net/v1/restaurants/categories');
  }

  getMainCategories(): Observable<Category[]> {
    return this._http.get<Category[]>('http://api.hunberapp.net/v1/restaurants/main_categories');
  }

  private generateHttpOptions(params: GetRestaurantsParameters): HttpParams {
    return new HttpParams().set('term', params.term ? params.term : '')
                           .set('location', params.location ? params.location : '')
                           .set('radius', params.radius ? params.radius.toString() : '')
                           .set('categories', (params.categories!.length) > 0 ? params.categories!.join(',') : '');
  }
}