package ShiDapaixusuanfa;

public class XiEer {
    public static void main(String[] args) {

        int[] a = {2, 34, 4, 6, 7, 43, 6, 3, 2, 1};
        if(a==null||a.length<2)
            System.out.println(a);
        int n=a.length;
        for (int h=n/2;h>0;h/=2){
            for (int i=h;i<n;i++){
                insertI(a,h,i);
            }
        }
        for (int m:a)
            System.out.println(m);
    }
    private static void insertI(int[] a,int h,int i){
        int temp=a[i];
        int k;
        for (k=i-h;k>0&&temp<a[k];k-=h){
            a[k+h]=a[k];
        }
        a[k+h]=temp;
    }
}
