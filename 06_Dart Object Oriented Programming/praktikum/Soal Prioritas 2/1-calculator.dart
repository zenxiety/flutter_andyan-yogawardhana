import 'CalculatorA.dart'; // import class Calculator pertama dari file terpisah
import 'CalculatorB.dart'; // import class Calculator kedua dari file terpisah

void main() {
  // object kalkulator pertama dengan property dan constructor
  CalculatorA cA = CalculatorA(2, 3);
  print("---- Calculator A ----");
  print("${cA.x} + ${cA.y} = ${cA.add()}");
  print("${cA.x} - ${cA.y} = ${cA.subtract()}");
  print("${cA.x} * ${cA.y} = ${cA.multiply()}");
  print("${cA.x} / ${cA.y} = ${cA.divide()}");

  // object kalkulator kedua tanpa property dan constructor
  CalculatorB cB = CalculatorB();
  final double x = 2;
  final double y = 3;
  print("---- Calculator B ----");
  print("${x} + ${y} = ${cB.add(x, y)}");
  print("${x} - ${y} = ${cB.subtract(x, y)}");
  print("${x} * ${y} = ${cB.multiply(x, y)}");
  print("${x} / ${y} = ${cB.divide(x, y)}");
}
