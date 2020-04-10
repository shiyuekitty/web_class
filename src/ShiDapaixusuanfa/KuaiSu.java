package ShiDapaixusuanfa;

public class KuaiSu {
    public static void main(String[] args) {

        int[] a = {2, 34, 4, 6, 7, 43, 6, 3, 2, 1};

    }

    public static int[] quickSort(int[] arr, int left, int right) {
        if (left < right) {
            int mid = partition(arr, left, right);
            arr = quickSort(arr, left, mid - 1);
            arr = quickSort(arr, mid + 1, right);
        }
        return arr;
    }

    private static int partition(int[] arr, int left, int right) {
        int pivot = arr[left];
        int i = left + 1;
        int j = right;
        while (true) {
            while (i <= j && arr[i] <= pivot)
                i++;
            while (i <= j && arr[j] >= pivot)
                j--;
            if (i > j)
                break;
            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
        arr[left] = arr[j];
        arr[j] = pivot;
        return j;
    }
}
