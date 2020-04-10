package jiekou;

class House implements Runnable {
    private int waterAmount;

    void setWater(int w) {
        waterAmount = w;
    }

    public void run() {
        while (true) {
            String name = Thread.currentThread().getName();
            if (name.equals("狗")) {
                System.out.println(name + "喝水");

                waterAmount = waterAmount - 2;
            } else if (name.equals("猫")) {
                System.out.println(name + "喝水");

                waterAmount = waterAmount - 1;
            }
            System.out.println("剩" + waterAmount);
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
            }
            if (waterAmount <= 0) {
                return;
            }
        }
    }
}

public class Example13_3 {
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        House house = new House();
        house.setWater(10);
        Thread dog, cat;
        dog = new Thread(house);
        cat = new Thread(house);
        dog.setName("狗");
        cat.setName("猫");
        dog.start();
        cat.start();
    }
}
