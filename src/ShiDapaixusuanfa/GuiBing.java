package ShiDapaixusuanfa;

public class GuiBing {

    public static void main(String[] args) {

        int[] a = {2, 34, 4, 6, 7, 43, 6, 3, 2, 1};
        int n = a.length;
        for (int i = 1; i < n; i += 1) {
            int left = 0;
            int mid = left + i - 1;
            int right = mid + i;
            while (right < n) {
                merge(a, left, mid, right);
                left = right + 1;
                mid = left + i - 1;
                right = mid + i;
            }
            if (left < n && mid < n) {
                merge(a, left, mid, n - 1);
            }
        }
        for (int m : a)
            System.out.println(m);
    }

    private static void merge(int[] arr, int left, int mid, int right) {
        int[] a = new int[right - left + 1];
        int i = left;
        int j = mid + 1;
        int k = 0;
        while (i <= mid && j <= right) {
            if (arr[i] < arr[j]) {
                a[k++] = arr[i++];
            } else {
                a[k++] = arr[j++];
            }
        }
        while (i <= mid)
            a[k++] = arr[i++];
        while (j <= right)
            a[k++] = arr[j++];
        for (i = 0; i < k; i++) {
            arr[left++] = a[i];
        }
    }
}
