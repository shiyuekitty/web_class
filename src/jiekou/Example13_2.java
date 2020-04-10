package jiekou;

public class Example13_2 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Thread speakElephant;
		Thread speakCar;
		ElephantTarget elephant;
		CarTarget car;
		elephant=new ElephantTarget();
		car=new CarTarget();
		speakElephant=new Thread(elephant);
		speakCar=new Thread(car);
		speakCar.start();
		for(int i=1;i<=15;i++){
			System.out.println("主任"+i+" ");
		}
		
	}

}
class ElephantTarget implements Runnable{
	public void run(){
		for(int i=1;i<=20;i++){
			System.out.println("大象"+i+" ");
		}
	}
}
class CarTarget implements Runnable{
	public void run(){
		for(int i=1;i<=20;i++){
			System.out.println("轿车"+i+" ");
		}
	}
}