#include <stdio.h>
#include <stdlib.h>

int read_num () {
  int k;
  if (scanf("%d", &k) == 1) {
    return k;
  }
  return 0;
}

int * read_triangle() {
  static int t[3];
  for (int i = 0; i < 3; i++) {
    int n = read_num();
    if (n == 0) {
      if (i == 0) {
	return 0;
      }
      fprintf(stderr, "triangle incomplete, missing %d sides.\n", 3 - i);
      abort();
    }
    t[i] = n;
  }
  return t;
}

int legal(int *t) {
  if (t[0] + t[1] > t[2]
      && t[0] + t[2] > t[1]
      && t[1] + t[2] > t[0]) {
    return 1;
  }
  return 0;
}

int main() {
  int n = 0;
  int *t;
  while ((t = read_triangle()) != 0) {
    /* if (legal(t) == 1) { */
    /*   printf("triangle: [%d %d %d]\n", t[0], t[1], t[2]); */
    /* } else { */
    /*   printf("not a triangle: [%d %d %d]\n", t[0], t[1], t[2]); */
    /* } */
    n += legal(t);
  }
  printf("Counted %d triangles.\n", n);
  return 0;
}
