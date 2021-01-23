import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CookiesNoticeComponent } from './cookies-notice.component';

describe('CookiesNoticeComponent', () => {
  let component: CookiesNoticeComponent;
  let fixture: ComponentFixture<CookiesNoticeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CookiesNoticeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CookiesNoticeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
