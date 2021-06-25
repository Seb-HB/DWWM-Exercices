import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ArrayPlusMoinComponent } from './array-plus-moin.component';

describe('ArrayPlusMoinComponent', () => {
  let component: ArrayPlusMoinComponent;
  let fixture: ComponentFixture<ArrayPlusMoinComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ArrayPlusMoinComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ArrayPlusMoinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
