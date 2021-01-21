import { TestBed } from '@angular/core/testing';

import { RestaurantsInterceptor } from './restaurants.interceptor';

describe('RestaurantsInterceptor', () => {
  beforeEach(() => TestBed.configureTestingModule({
    providers: [
      RestaurantsInterceptor
      ]
  }));

  it('should be created', () => {
    const interceptor: RestaurantsInterceptor = TestBed.inject(RestaurantsInterceptor);
    expect(interceptor).toBeTruthy();
  });
});
