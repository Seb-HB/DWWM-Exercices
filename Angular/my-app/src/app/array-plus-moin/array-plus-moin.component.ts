import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-array-plus-moin',
  templateUrl: './array-plus-moin.component.html',
  styleUrls: ['./array-plus-moin.component.scss']
})
export class ArrayPlusMoinComponent implements OnInit {
 myArray: string[]=['a', 'b', 'c'];


  constructor() { }

  ngOnInit(): void {
  }

  addArrayElement(element: string): void {
      this.myArray.push(element);
  }
  removeArrayLastElement(): void {
    this.myArray.pop()
  }

}
