Array.from(Array(10)).map(_ => Math.random()).map((x) => Math.floor(20 + 20*x)).map((l, index) => Array(l).join(index % 2 ? 'A' : 'a')).reduce((a,b) => a + b);
