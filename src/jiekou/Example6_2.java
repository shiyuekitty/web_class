package jiekou;

interface ShowMessage{
	void show(String s);
}
class TV implements ShowMessage{
	public void show(String s){
		System.out.println("*********");
		System.out.println(s);
		System.out.println("*********");
	}
}
class PC implements ShowMessage{
	public void show(String s){
	System.out.println("@@@@@@@@@@@@@");
	System.out.println(s);
	System.out.println("@@@@@@@@@@@@@");
	}
}
public class Example6_2 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ShowMessage sm;
		sm=new TV();
		sm.show("�����Ƶ��ӻ�");
		sm=new PC();
		sm.show("�߶��Ƽ���UN��");
	}

}
