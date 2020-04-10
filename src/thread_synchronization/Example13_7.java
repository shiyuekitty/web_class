package thread_synchronization;
class Bank implements Runnable{
    int money=200;
    void setMoney(int n){
        money=n;
    }
    public void run(){
        if (Thread.currentThread().getName().equals("���"))
            saveOrTake(300);
        else if (Thread.currentThread().getName().equals("����"))
            saveOrTake(150);
    }
    public synchronized void saveOrTake(int amount){
        if (Thread.currentThread().getName().equals("���")){
            for (int i=1;i<=3;i++){
                money=money+amount/3;
                System.out.println(Thread.currentThread().getName()+"����"+amount/3+",������"+money+"��Ԫ,��Ϣһ����ٴ�");
                try {
                    Thread.sleep(1000);
                }
                catch (InterruptedException e){}
            }
        }
        else if (Thread.currentThread().getName().equals("����")){
            for (int i=1;i<=3;i++) {
                money = money - amount / 3;
                System.out.println(Thread.currentThread().getName()+"ȡ��" + amount / 3 + ",������" + money + "��Ԫ,��Ϣһ�����ȡ");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                }
            }
        }
    }
}
public class Example13_7 {
    public static void main(String[] args) {
        Bank bank=new Bank();
        bank.setMoney(200);
        Thread accountant,cashier;
        accountant=new Thread(bank);
        cashier=new Thread(bank);
        accountant.setName("���");
        cashier.setName("����");
        accountant.start();
        cashier.start();
    }
}
