package quicksort;

import processing.core.PApplet;

public class Sketch extends PApplet {

  static int[] array = new int[250];
  public static PApplet pa;
  Quicksort quickSortThread;
  final static int MAX_HEIGHT = 500;
  final static int width = 4;

  public void settings() {
    size(1000, 600);
  }

  public void setup() {
    background(0);
    pa = this;
    for (int i = 0; i < array.length; i++)
      array[i] = (int) (random(1, MAX_HEIGHT));

    quickSortThread = new Quicksort(array, 0, array.length - 1, pa);
    quickSortThread.start();
  }

  public void draw() {
    background(0);
    for (int i = 0; i < array.length; i++) {
      fill(255);
      stroke(0);
      rect(i * width, MAX_HEIGHT - array[i], width, array[i]);
    }
  }
}