import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PickRestaurantPageComponent } from './pages/pick-restaurant-page/pick-restaurant-page.component';

const routes: Routes = [
  { path: '', component: PickRestaurantPageComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RestaurantsRoutingModule { }
