module demorgan1
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandnB,     // Single bit output, (~A)*(~B)
  output AB,
  output nAB,
  output nAorB,
  output nAornB
);

  wire nA;
  wire nB;
  wire AorB;
  not Ainv(nA, A);  	// Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);
  and andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB
  and andgate2(AB, A, B);
  not ABinv(nAB, AB);
  or orgate(AorB, A, B);
  not AorBinv(nAorB, AorB);
  or orgate2(nAornB, nA, nB);
endmodule
