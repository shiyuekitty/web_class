package ShiDapaixusuanfa;

public class MaoPao {
    public static void main(String[] args) {
        //冒泡排序优化
        int[] a = {2, 34, 4, 6, 7, 43, 6, 3, 2, 1};
        if (a == null || a.length < 2)
            System.out.println(a);
        int n = a.length;
        for (int i = 0; i < n; i++) {
            boolean flag = true;//flag标记
            for (int j = 0; j < n - i - 1; j++) {
                if (a[j + 1] < a[j]) {
                    flag = false;
                    int t = a[j];
                    a[j] = a[j + 1];
                    a[j + 1] = t;
                }
            }
            if (false)//判断是否发生位置交换
                break;
        }
        for (int m : a)
            System.out.println(m);
    }
    //冒泡排序
//        int[] a = {2, 34, 4, 6, 7, 43, 6, 3, 2, 1};
//        if (a == null || a.length < 2)
//            System.out.println(a);
//        int n = a.length;
//        for (int i = 0; i < n; i++) {
//            for (int j = 0; j < n - i - 1; j++) {
//                if (a[j + 1] < a[j]) {
//                    int t = a[j];
//                    a[j] = a[j + 1];
//                    a[j + 1] = t;
//                }
//            }
//        }
//        for (int m : a)
//            System.out.println(m);
//    }
}
