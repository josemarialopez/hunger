import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RestaurantPickerComponent } from './restaurant-picker.component';

describe('RestaurantPickerComponent', () => {
  let component: RestaurantPickerComponent;
  let fixture: ComponentFixture<RestaurantPickerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RestaurantPickerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RestaurantPickerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
