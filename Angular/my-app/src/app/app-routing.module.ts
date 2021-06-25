import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ArrayPlusMoinComponent } from './array-plus-moin/array-plus-moin.component';
import { ExoIfComponent } from './exo-if/exo-if.component';
import { IndexComponent } from './index/index.component';
import { NumberCountComponent } from './number-count/number-count.component';
import { RouteParamComponent } from './route-param/route-param.component';
import { TimerMinusComponent } from './timer-minus/timer-minus.component';
import { TimerPlusComponent } from './timer-plus/timer-plus.component';

const routes: Routes = [
  {path: 'index', component: IndexComponent},
  {path: 'exo-if', component: ExoIfComponent},
  {path: 'number-count', component: NumberCountComponent},
  {path: 'timer-plus', component: TimerPlusComponent},
  {path: 'timer-minus', component: TimerMinusComponent},
  {path: 'route-param/:param/:code', component:RouteParamComponent},
  { path:'array', component:ArrayPlusMoinComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
