import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { IndexComponent } from './index/index.component';
import { ExoIfComponent } from './exo-if/exo-if.component';
import { NumberCountComponent } from './number-count/number-count.component';
import { TimerPlusComponent } from './timer-plus/timer-plus.component';
import { TimerMinusComponent } from './timer-minus/timer-minus.component';
import { RouteParamComponent } from './route-param/route-param.component';
import { ArrayPlusMoinComponent } from './array-plus-moin/array-plus-moin.component';

@NgModule({
  declarations: [
    AppComponent,
    IndexComponent,
    ExoIfComponent,
    NumberCountComponent,
    TimerPlusComponent,
    TimerMinusComponent,
    RouteParamComponent,
    ArrayPlusMoinComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
