import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpResponse
} from '@angular/common/http';

import { Observable, of } from 'rxjs';

@Injectable()
export class RestaurantsInterceptor implements HttpInterceptor {
  constructor() {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {
    const { url, method, headers, body } = request;
    let fakeRestaurant = {
      id: 'rQSFuKAyrkZtRRdOnJglJQ',
      alias: 'el-sur-madrid',
      name: 'El Sur',
      imageUrl: 'https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg',
      url: 'https://www.yelp.com/biz/el-sur-madrid?adjust_creative=tV7D2uC5doCo6VWJF9Vtrg&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=tV7D2uC5doCo6VWJF9Vtrg',
      phone: '+34 915 27 83 40',
      reviewRount: 662,
      categories: ['Tapas Bars', 'Italian', 'American'],
      rating: 4.5,
      city: 'Madrid',
      zipcode: '28012',
      country: 'ES',
      address: 'Calle de la Torrecilla del Leal, 12. 28012 Madrid. Spain',
      latitude: 40.4110475,
      longitude: -3.6995454,
      photos: ['https://s3-media4.fl.yelpcdn.com/bphoto/d0VliNHmKppFLz8lwHEnqg/o.jpg', 'https://s3-media2.fl.yelpcdn.com/bphoto/9NhGe0qp0XGGX_akVPUN7g/o.jpg', 'https://s3-media4.fl.yelpcdn.com/bphoto/HDSc745VKdAdayaoTQ72fg/o.jpg'],
      price: '$$',
      distance: 3
    };


    switch(true) {
      case url.endsWith('/restaurants') && method === 'GET':
        return of(new HttpResponse({status: 200, body: [fakeRestaurant]}));
      default:
        return next.handle(request);
    }
  }
}
