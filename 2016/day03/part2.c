#include <stdio.h>
#include <stdlib.h>

int read_num () {
  int k;
  if (scanf("%d", &k) == 1) {
    return k;
  }
  return 0;
}

int * read_three_triangles() {
  static int t[9];
  for (int i = 0; i < 9; i++) {
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
  int n = 0;
  for (int i = 0; i < 3; i++) {
    if (t[i + 0] + t[i + 3] > t[i + 6]
	&& t[i + 0] + t[i + 6] > t[i + 3]
	&& t[i + 3] + t[i + 6] > t[i + 0]) {
      n++;
    }
  }
  return n;
}

int main() {
  int n = 0;
  int *t;
  while ((t = read_three_triangles()) != 0) {
    n += legal(t);
  }
  printf("Counted %d triangles.\n", n);
  return 0;
}
