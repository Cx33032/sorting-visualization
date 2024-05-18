class MergeSortThread extends Thread{
    int[] arr;

    public MergeSortThread(int[] array){
        arr = array;
    }

    @Override
    public void run(){
        int[] sortArray = mergeSort(arr);
    }

    public int[] mergeSort(int array){
        if(array.length < 2)
            return array;
        
        int middle = (int)(array.length / 2.0);
        int[] left = new int[middle];
        int[] right = new int[array.length - middle];

        for(int i = 0; i < middle; i++)
            left[i] = array[i];
        
        for(int i = 0; i < array.length - middle; i++)
            right[i] = array[i + middle];

        return merge(left, right);
        
    }

    public int[] merge(int[] left, int[] right){
        int leftPointer = 0, rightPointer = 0, index = 0;
        int[] result = new int[left.length + right.length];

        while(leftPointer < left.length && rightPointer < right.length){
            if(left[leftPointer] <= right[rightPointer])
                result[i++] = left[leftPointer++];
            else 
                result[i++] = right[rightPointer++];
            redraw();
        }

        while(leftPointer < left.length){
            result[i++] = left[leftPointer++];
            redraw();    
        }

        while(rightPointer < right.length){
            result[i++] = right[rightPointer++];
            redraw();
        }

        return result;
    }
}