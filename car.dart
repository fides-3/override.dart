import 'dart:io';

//interface
abstract class Vehicle{
 void accelerate();
 void brake(); 
}

//base class
class Car implements Vehicle{
  String brand;
  int speed =0;

  Car(this.brand)

  @override
  void accelerate(){
    speed+=10;
    print('$brand is accelerating.current speed:$speed km/h');
  }

  @override
  void brake(){
    if(speed>0){
      speed -=10;
      print('$brand is braking.current speed:$speed km/h');
    }else{
      print('$brand has already stopped!');
    }
  }
  void honk(){
    print('$brand is honking');
  }
}
//subclass that overrides a method
class ElectricCar extends Car{
  ElectricCar(String brand) :super(brand);

  @override
  void accelerate(){
    speed+=20;
    print('$brand (electric) has accelerated.current speed:$speed km/h');
  }
}
void main(){
  var cardata=File('car_data.txt').readAsStringSync().split('.');
  var car=Car(cardata[0]);
  car.accelerate();
  car.accelerate();

  car.brake();
  car.brake();
  for(var i=0;i<3;i++){
    car.honk();
  }
  var electricCar=ElectricCar('toyota');
  electricCar.accelerate();
}