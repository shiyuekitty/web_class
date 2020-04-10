package test_09;
import java.io.File;
import java.io.RandomAccessFile;
public class RAF {
    public static void main(String[] args) throws Exception {

        String path = "E:/helloword.txt";
        File file = new File(path);
        //定义随机文件流
        RandomAccessFile raf = new RandomAccessFile(file, "r");//"r"表示只读
        StringBuffer sb = new StringBuffer();
        long length = raf.length();
        while (length > 3) {
            length--;
            //设置在那个位置发生下一个读取或写入操作
            raf.seek(length);
            int len1 = (char) raf.readByte();
            if (0 <= len1 && len1 <= 128) {
                sb.append((char) len1 + "");
            } else {
                length--;
                raf.seek(--length);
                byte[] bytes = new byte[3];
                // bytes被复制为连续3个字节
                raf.readFully(bytes);
                sb.append(new String(bytes));
            }
        }
        System.out.println(sb.toString());
        raf.close();

    }
}
