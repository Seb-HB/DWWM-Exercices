import { Component, OnInit } from '@angular/core';
import { FirstServiceService } from '../first-service.service';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.scss']
})
export class IndexComponent implements OnInit {

  varService= new FirstServiceService;

  constructor() { }

  ngOnInit(): void {
  }

}
