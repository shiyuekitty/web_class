package jiekou;

class SimpleRun implements Runnable {
    public void run() {
        for (int i = 0; i < 10; i++) {
        	sleep((long)(Math.random() * 1000));
            System.out.println("  "+"Jamaica"+i + " ");  
        }
        System.out.println("DONE! " + "Jamaica");
    }

	private void sleep(long l) {
		// TODO Auto-generated method stub
		for(int i=0;i<=20;i++);
	}
}

class simpleThread_1 implements Runnable{
	public void run(){
		for (int i = 0; i < 10; i++) {
            System.out.println("  "+"Fiji"+i + " ");
            sleep((long)(Math.random() * 1000));
        }
	}

	private void sleep(long l) {
		// TODO Auto-generated method stub
		for(int i=0;i<=20;i++);
	}

	
}
public class TwoThreadRun {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Thread Jamaica;
		Thread Fiji;
		SimpleRun a;
		simpleThread_1 b;
		a=new SimpleRun();
		b=new simpleThread_1();
		Jamaica=new Thread(a);
		Fiji=new Thread(b);
		Fiji.start();
		Jamaica.start();
		
	}

}
