import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SharedRoutingModule } from './shared-routing.module';
import { WorkInProgressPageComponent } from './pages/work-in-progress-page/work-in-progress-page.component';
import { NotFoundPageComponent } from './pages/not-found-page/not-found-page.component';


@NgModule({
  declarations: [WorkInProgressPageComponent, NotFoundPageComponent],
  imports: [
    CommonModule,
    SharedRoutingModule
  ],
  exports: [WorkInProgressPageComponent, NotFoundPageComponent]
})
export class SharedModule { }
