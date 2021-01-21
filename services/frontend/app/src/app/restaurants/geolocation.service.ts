import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { NumberValueAccessor } from '@angular/forms';
import { Observable } from 'rxjs';

declare var google: any;

@Injectable({
  providedIn: 'root'
})
export class GeolocationService {

  constructor(private _http: HttpClient) { }


  geolocateByCoordinates(latitude: number, longitude: number): Observable<Object> {
    let url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${latitude},${longitude}&key=AIzaSyDbhyMK8Od-6D9YoQyUxonOu-y0Ft2SNcs`;
    return this._http.get(url);
  }
}
