import { style } from '@angular/animations';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-compteur',
  templateUrl: './compteur.component.html',
  // template:`<p [style.color]="couleur? 'green' : 'red'"></p>`,
  styleUrls: ['./compteur.component.scss']
})
export class CompteurComponent implements OnInit {
  compteur:number = 0;
  couleur:boolean =true;
  tata:number =2;
  // selectP=document.querySelector('p') as HTMLElement;  //as HTMLElement est indispensable pour Angular pour qu'il sache qu'il a un element HTML

  constructor() { }

  ngOnInit(): void {
  }

  incrementCompteur(increment:number): void {
    this.compteur += increment;
    // (this.compteur<0)? selectP.style.color='red':selectP.style.color='green';
    this.defineColor();
  }
  decreaseCompteur(increment:number): void {
    this.compteur -= increment;
    // (this.compteur<0)? selectP.style.color='red': selectP.style.color='green';
    this.defineColor();    
  }

  defineColor(): void {
    (this.compteur<0)? this.couleur=false: this.couleur=true;
  }

}
