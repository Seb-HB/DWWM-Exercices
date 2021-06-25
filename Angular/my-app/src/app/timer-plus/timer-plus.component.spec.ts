import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TimerPlusComponent } from './timer-plus.component';

describe('TimerPlusComponent', () => {
  let component: TimerPlusComponent;
  let fixture: ComponentFixture<TimerPlusComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TimerPlusComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TimerPlusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
