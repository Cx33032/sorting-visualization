int[] arr = new int[250];
final int width = 4;
final int height = 500;

void setup() {
    // fullScreen();
    size(1000, 500);
    background(0);
    for(int i = 0; i < arr.length; i++)
        arr[i] = (int)(random(1, height));
    
    QuickSortThread quickThread = new QuickSortThread(arr, 0, arr.length - 1);
    quickThread.start();
}

void draw() {
    background(0);
    for (int i = 0; i < arr.length; i++) {
      fill(255);
      stroke(0);
      rect(i * width, height - arr[i], width, arr[i]);
    }
}
