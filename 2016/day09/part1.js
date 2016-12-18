process.stdin.setEncoding('utf8');
const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
});

const assert = require('assert');

function process_line (line) {
  line = line.replace(/\s+/, "");
  // console.log("01234567890123456789");
  var i = 0;
  while (i < line.length) {
    if (line[i] === '(') {
      // console.log("> i=" + i);
    
      var a = line.indexOf('x', i + 1);
      // console.log("> a=" + a);
      assert(a > i, 'did not find "x"');
      var l = parseInt(line.slice(i+1, a));
      // console.log("> l=" + l);

      var b = line.indexOf(')', a + 1);
      // console.log("> b=" + b);
      assert(b > a + 1, 'did not find ")"');
      var t = parseInt(line.slice(a+1, b));
      // console.log("> t=" + t);

      var chunk = line.substr(b + 1, l);
      // console.log("> chunk=" + chunk);
      
      line = line.substr(0, i)
        + chunk.repeat(t)
        + line.substr(b + 1 + l);
      // console.log("> line=" + line);
      
      i = i - 1 + t * l;
      // console.log("> i=" + i);
    } else {
      i += 1;
    }
  }
  console.log("> " + line + " (" + line.length + ")");
}

function process_input () {
  rl.on('line', (input) => process_line(input));
}

process_input();
