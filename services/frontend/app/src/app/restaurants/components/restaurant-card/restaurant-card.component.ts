import { Component, Input, OnInit } from '@angular/core';
import { Restaurant } from '../../interfaces/restaurant';
import {
  trigger,
  state,
  style,
  animate,
  transition
} from '@angular/animations';
import { Observable, Subject } from 'rxjs';

@Component({
  selector: 'restaurant-card',
  templateUrl: './restaurant-card.component.html',
  styleUrls: ['./restaurant-card.component.scss'],
})
export class RestaurantCardComponent implements OnInit {
  @Input() restaurant?: Restaurant;

  constructor() { }

  ngOnInit(): void {
  }

}
