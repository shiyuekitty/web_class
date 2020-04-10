package ShiDapaixusuanfa;

public class XuanZe {
    public static void main(String[] args) {
        int[] a = {2, 34, 4, 6, 7, 43, 6, 3, 2, 1};
        int n = a.length;
        for (int i = 0; i < n - 1; i++) {
            int min = i;
            for (int j = i + 1; j < n; j++) {
                if (a[min] > a[j])
                    min = j;
            }
            int temp = a[i];
            a[i] = a[min];
            a[min] = temp;
        }
        for (int m : a)
            System.out.println(m);
    }
}
