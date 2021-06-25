import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-exo-if',
  templateUrl: './exo-if.component.html',
  styleUrls: ['./exo-if.component.scss']
})
export class ExoIfComponent implements OnInit {
  myString: string="";

  constructor() { }

  ngOnInit(): void {
  }

  changeMyString(newString: string){
    
    "J'aime les fruits au sirop"
  }

}
