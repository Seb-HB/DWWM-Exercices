import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TimerMinusComponent } from './timer-minus.component';

describe('TimerMinusComponent', () => {
  let component: TimerMinusComponent;
  let fixture: ComponentFixture<TimerMinusComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TimerMinusComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TimerMinusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
