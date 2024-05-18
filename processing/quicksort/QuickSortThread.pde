class QuickSortThread extends Thread{
    int[] array;
    int leftStart, rightStart;

    public QuickSortThread(int[] arr, int left, int right){
        array = arr;
        leftStart = left;
        rightStart = right;
    }
    
    @Override
    public void run(){
        quickSort(array, leftStart, rightStart);
    }

    public void quickSort(int[] arr, int leftStart, int rightStart){
        final int MOVE_LEFT = 0;
        final int MOVE_RIGHT = 1;
        if (leftStart < rightStart) {
            int left = leftStart;
            int right = rightStart;
            int pivot = arr[left];
            int currentMove = MOVE_LEFT;

            while (left < right) {
                if (currentMove == MOVE_LEFT) {
                    while ((arr[right] >= pivot) && (left < right)) 
                        right--;

                    delay(20);
                    redraw();
                    arr[left] = arr[right];

                    // rect(left * width, MAX_HEIGHT - arr[left], width, arr[left]);
                    currentMove = MOVE_RIGHT;
                }
                if (currentMove == MOVE_RIGHT) {
                    while ((arr[left] <= pivot) && (left < right)) 
                        left++;

                    delay(20);
                    redraw();
                    arr[right] = arr[left];

                    // rect(right * width, MAX_HEIGHT - arr[right], width, arr[right]);
                    currentMove = MOVE_LEFT;
                }
            }

            arr[left] = pivot;
            QuickSortThread leftThread = new QuickSortThread(arr, leftStart, left - 1);
            QuickSortThread rightThread = new QuickSortThread(arr, right + 1, rightStart);

            leftThread.start();
            rightThread.start();

            try {
                leftThread.join();
                rightThread.join();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}