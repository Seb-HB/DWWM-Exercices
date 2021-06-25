import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExoIfComponent } from './exo-if.component';

describe('ExoIfComponent', () => {
  let component: ExoIfComponent;
  let fixture: ComponentFixture<ExoIfComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExoIfComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ExoIfComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
