import java.lang.*;
import java.util.*;
import java.util.regex.*;
import java.util.stream.*;

class Part1 {

  Scanner scanner = new Scanner(System.in);
  Pattern p = Pattern.compile("([a-z-]+)-([0-9]+)\\[([a-z]{5})\\]");
  
  String readRoom() {
    return scanner.next();
  }
  
  int readValidSectorId () {
    try {
      String room = readRoom();
      Matcher m = p.matcher(room);
      if (m.matches()) {
        String name = m.group(1);
        int id = Integer.parseInt(m.group(2));
        String checksum = m.group(3);
        // count the occurences of every character
        HashMap<Character, Integer> charMap = new HashMap<Character, Integer>();
        for (Character c: name.toCharArray()) {
          if (charMap.containsKey(c)) {
            charMap.put(c, charMap.get(c) + 1);
          } else {
            charMap.put(c, 1);
          }          
        }
        // get the five most common characters
        String computed =
          charMap.keySet().stream()
          .filter((elem) -> elem.charValue() != '-')
          .sorted(new Comparator<Character>() {
            @Override
            public int compare(Character a, Character b) {
              int r = charMap.get(b).compareTo(charMap.get(a));
              if (r == 0) {
                return a.compareTo(b);
              }
              return r;
            }
          })
          .limit(5)
          .map(Object::toString)
          .collect(Collectors.joining());
        if (checksum.equals(computed)) {
          return id;
        }
        // else do nothing
      }
    } catch (NoSuchElementException e) {
      // do nothing
    }
    return 0;
  }

  int sum () {
    int sum = 0;
    int sectorId;
    while ((sectorId = readValidSectorId()) > 0) {
      sum += sectorId;
    }
    return sum;
  }

  public static void main(String args[]) {
    Part1 p = new Part1();
    System.out.println("Sum: " + p.sum());
  }
}
