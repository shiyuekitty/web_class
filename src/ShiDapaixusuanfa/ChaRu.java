package ShiDapaixusuanfa;

public class ChaRu {
    public static void main(String[] args) {

        int[] a = {2, 34, 4, 6, 7, 43, 6, 3, 2, 1};
        if (a == null || a.length < 2)
            System.out.println(a);
        int n = a.length;
        for (int i = 1; i < n; i++) {
            int temp = a[i];
            int k = i - 1;
            while (k >= 0 && a[k] > temp)
                k--;
            for (int j = i; j > k + 1; j--)
                a[j] = a[j - 1];
            a[k + 1] = temp;
        }
        for (int m : a)
            System.out.println(m);
    }
}
