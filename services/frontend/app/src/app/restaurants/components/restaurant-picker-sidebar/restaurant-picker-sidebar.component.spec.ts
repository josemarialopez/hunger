import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RestaurantPickerSidebarComponent } from './restaurant-picker-sidebar.component';

describe('RestaurantPickerSidebarComponent', () => {
  let component: RestaurantPickerSidebarComponent;
  let fixture: ComponentFixture<RestaurantPickerSidebarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RestaurantPickerSidebarComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RestaurantPickerSidebarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
