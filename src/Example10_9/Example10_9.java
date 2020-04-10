package Example10_9;
import javax.print.DocFlavor;
import java.io.*;
import java.util.*;
public class Example10_9 {
    public static void main(String[] args) {
        ReadExaminationPaper reader;
        reader=new ReadExaminationPaper();
        reader.setSoursName("test");
        reader.setTableName("testForm");
        Scanner scanner =new Scanner(System.in);
        int amount=reader.getAmount();
        if(amount==0){
                System.out.println("没有试题");
                System.exit(0);
        }
        System.out.printf("试题共有%d道题目\n",amount);
        System.out.println("输入题号：如1,2....开始考试");
        while (scanner.hasNextInt()){
            int number =scanner.nextInt();
            String huiche=scanner.nextLine();
            if (number>=1&&number<=amount){
                String timu[]=reader.getExamQuestion(number);
                for (int i=0;i<timu.length-1;i++)
                    System.out.println(timu[i]);
                System.out.println("输入选择的答案");
                String answer=scanner.nextLine();
                if (answer.compareToIgnoreCase(timu[5])==0){
                    System.out.println("第"+number+"题做对了\t");
                }else {
                    System.out.println("第"+number+"题做错了\t");
                }
                System.out.println("输入任意字母结束考试\t,输入题号继续考试：");
            }else {
                System.out.println("题号不合理\n");
                System.out.println("输入任意字母结束考试，输入题号继续考试");
            }
        }
    }
}
