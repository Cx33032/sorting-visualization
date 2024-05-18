import processing.core.*;

public class Quicksort extends Thread {
  private int[] array;
  private int leftStart, rightStart;
  static PApplet pa;

  public Quicksort(int[] arr, int leftStart, int rightStart, PApplet newPa) {
    array = arr;
    this.leftStart = leftStart;
    this.rightStart = rightStart;
    pa = newPa;
  }

  @Override
  public void run() {
    quickSort(array, leftStart, rightStart);
  }

  public void quickSort(int[] arr, int leftStart, int rightStart) {
    final int MOVE_LEFT = 0;
    final int MOVE_RIGHT = 1;
    if (leftStart < rightStart) {
      int left = leftStart;
      int right = rightStart;
      int pivot = arr[left];
      int currentMove = MOVE_LEFT;

      while (left < right) {
        if (currentMove == MOVE_LEFT) {
          while ((arr[right] >= pivot) && (left < right)) {
            right--;
          }

          pa.delay(20);
          pa.redraw();
          arr[left] = arr[right];

          // rect(left * width, MAX_HEIGHT - arr[left], width, arr[left]);
          currentMove = MOVE_RIGHT;
        }
        if (currentMove == MOVE_RIGHT) {
          while ((arr[left] <= pivot) && (left < right)) {
            left++;
          }

          pa.delay(20);
          pa.redraw();
          arr[right] = arr[left];

          // rect(right * width, MAX_HEIGHT - arr[right], width, arr[right]);
          currentMove = MOVE_LEFT;
        }
      }

      arr[left] = pivot;
      Quicksort leftThread = new Quicksort(arr, leftStart, left - 1, pa);
      Quicksort rightThread = new Quicksort(arr, right + 1, rightStart, pa);

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