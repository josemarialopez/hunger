import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PickRestaurantPageComponent } from './pick-restaurant-page.component';

describe('PickRestaurantPageComponent', () => {
  let component: PickRestaurantPageComponent;
  let fixture: ComponentFixture<PickRestaurantPageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PickRestaurantPageComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PickRestaurantPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
