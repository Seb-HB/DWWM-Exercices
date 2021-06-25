import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class FirstServiceService {
  private _testVariable: string='variable de test: réussi!';

  constructor() { }

  get testVariable():string { 
    return this._testVariable; 
  }

}
