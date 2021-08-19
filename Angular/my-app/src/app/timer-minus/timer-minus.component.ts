import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-timer-minus',
  templateUrl: './timer-minus.component.html',
  styleUrls: ['./timer-minus.component.scss']
})
export class TimerMinusComponent implements OnInit {

  initTime: number=30;
  Stopped:boolean=false;
  mytimer:any;

  constructor() { }

  ngOnInit(): void {
  }

  beginCAR():void{
    
    this.mytimer=setInterval(() =>{
      (this.initTime>0 && this.Stopped==false)? this.initTime--: this.stopCAR();
      
    },1000);
  }

  stopCAR():void{
    alert("Temps écoulé. Le Compte-à-rebours est réinitialisé.")
    clearInterval(this.mytimer);
    this.initTime=30;
  }

}
