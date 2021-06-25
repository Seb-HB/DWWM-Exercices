import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-route-param',
  templateUrl: './route-param.component.html',
  styleUrls: ['./route-param.component.scss']
})
export class RouteParamComponent implements OnInit {

  constructor(private activatedRoute: ActivatedRoute) { }

  ngOnInit(): void {
    this.activatedRoute.params.subscribe(params => {
      alert(params.param);
      alert(params.code);

    })
  }

}
