import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-timer-plus',
  templateUrl: './timer-plus.component.html',
  styleUrls: ['./timer-plus.component.scss']
})
export class TimerPlusComponent implements OnInit {
  initTime: number=0;
  Stopped:boolean=false;
  mytimer:any;

  constructor() { }

  ngOnInit(): void {
  }

  beginChrono():void{
    this.mytimer=setInterval(() =>{
      this.initTime++;
    },1000);
  }

  stopChrono():void{
    clearInterval(this.mytimer);
  }

  resetChrono():void{
    this.initTime=0;
  }
}
