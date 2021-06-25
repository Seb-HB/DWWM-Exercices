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

  constructor() { }

  ngOnInit(): void {
  }

  incrementCompteur(increment:number): void {
    this.compteur += increment;
    // (this.compteur<0)? document.querySelector('p').style.color='red': document.querySelector('p').style.color='green';
    this.defineColor();
  }
  decreaseCompteur(increment:number): void {
    this.compteur -= increment;
    // (this.compteur<0)? document.querySelector('p').style.color='red': document.querySelector('p').style.color='green';
    this.defineColor();    
  }

  defineColor(): void {
    (this.compteur<0)? this.couleur=false: this.couleur=true;
  }

}
