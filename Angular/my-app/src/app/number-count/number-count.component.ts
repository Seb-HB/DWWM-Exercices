import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-number-count',
  templateUrl: './number-count.component.html',
  styleUrls: ['./number-count.component.scss']
})
export class NumberCountComponent implements OnInit {
  numberToFind: number=53841596248;
  iterationCount:number=0;
  numberArray:number[]=[];

  constructor() { }

  ngOnInit(): void {
  }

  findTheNumberByRand():void{

    // autre moyen de recuperer un tableau de chiffre sans passer par une string?
    this.convertToTab(this.numberToFind.toString());
    this.iterationCount=0;
    console.log(this.iterationCount);
    let numTry;
    
    for (const num of this.numberArray) {
      
      while (numTry !=num){
        numTry= Math.round(Math.random()*8)+1;        
        this.iterationCount++; 
        // if(this.iterationCount>2000){
        //   alert("boucle infinie?");
        //   break;
        // }     
      }     
    } 
    console.log('trouvé'+ this.iterationCount);
    console.log(this.numberArray);
  }

    convertToTab(chaine: string):any{
      this.numberArray=[];
      for (let i = 0; i < chaine.length; i++) {
        this.numberArray.push(parseInt(chaine[i]));   
      }
    }
 

}
