import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { NotFoundPageComponent } from './pages/not-found-page/not-found-page.component';
import { WorkInProgressPageComponent } from './pages/work-in-progress-page/work-in-progress-page.component';

const routes: Routes = [

  {path: 'work-in-progress', component: WorkInProgressPageComponent},
  
  // Always load this route the last one, otherwise it will expand more than expected
  {path: '**', component: NotFoundPageComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SharedRoutingModule { }
