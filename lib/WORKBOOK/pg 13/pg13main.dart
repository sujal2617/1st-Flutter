
void main() {
  BankAccount account = BankAccount("Sujal Pattewar", 1000.00);

  account.checkBalance();  // Check initial balance
  account.deposit(500.00); // Deposit money
  account.checkBalance();  // Check balance after deposit
  account.withdraw(200.00); // Withdraw money
  account.checkBalance();  // Check balance after withdrawal
  account.withdraw(1500.00); // Attempt to withdraw more than balance
  account.checkBalance();  // Final balance

}
class BankAccount {
  String accountHolder;
  double balance;

  BankAccount(this.accountHolder, this.balance);

  // Method to deposit money
  void deposit(double amount) {
    balance += amount;
    print("Deposited: \$${amount.toStringAsFixed(2)}");
  }

  // Method to withdraw money
  void withdraw(double amount) {
    if (amount > balance) {
      print("Insufficient balance!");
    } else {
      balance -= amount;
      print("Withdrew: \$${amount.toStringAsFixed(2)}");
    }
  }

  // Method to check the current balance
  void checkBalance() {
    print("Current Balance: \$${balance.toStringAsFixed(2)}");
  }
}
