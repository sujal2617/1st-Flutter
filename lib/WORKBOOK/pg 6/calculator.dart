import 'dart:io';

void main() {
  while (true) {
    print('Simple Calculator');
    print('1. Addition');
    print('2. Subtraction');
    print('3. Multiplication');
    print('4. Division');
    print('5. Exit');
    stdout.write('Choose an operation: ');

    String? choice = stdin.readLineSync();

    if (choice == '5') {
      print('Exiting...');
      break;
    }

    stdout.write('Enter first number: ');
    double num1 = double.parse(stdin.readLineSync()!);
    stdout.write('Enter second number: ');  
    double num2 = double.parse(stdin.readLineSync()!);

    double result;

    switch (choice) {
      case '1':
        result = num1 + num2;
        print('Result: $num1 + $num2 = $result');
        break;
      case '2':
        result = num1 - num2;
        print('Result: $num1 - $num2 = $result');
        break;
      case '3':
        result = num1 * num2;
        print('Result: $num1 * $num2 = $result');
        break;
      case '4':
        if (num2 != 0) {
          result = num1 / num2;
          print('Result: $num1 / $num2 = $result');
        } else {
          print('Error: Division by zero');
        }
        break;
      default:
        print('Invalid choice, please try again.');
    }
    print(''); // Add a blank line for better readability
  }
}
