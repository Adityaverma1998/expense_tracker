import 'package:expense_tracker/data/local/models/expense_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class ExpenseDao {
  //  Insert a new expense
  @insert
  Future<void> insertExpense(ExpenseModel expense);

  //  Insert multiple expenses
  @insert
  Future<void> insertExpenses(List<ExpenseModel> expenses);

  //  Get all expenses
  @Query('SELECT * FROM expenses ORDER BY date DESC')
  Future<List<ExpenseModel>> getAllExpenses();

  //  Get a single expense by ID
  @Query('SELECT * FROM expenses WHERE id = :id')
  Future<ExpenseModel?> getExpenseById(String id);

  //  Delete a specific expense
  @delete
  Future<void> deleteExpense(ExpenseModel expense);

  //  Update an existing expense
  @update
  Future<void> updateExpense(ExpenseModel expense);

  //  Delete all expenses
  @Query('DELETE FROM expenses')
  Future<void> deleteAllExpenses();

  //  Filter by category (optional, useful for analytics or UI filters)
  @Query('SELECT * FROM expenses WHERE category = :category ORDER BY date DESC')
  Future<List<ExpenseModel>> getExpensesByCategory(String category);

  //  Filter by mode (cash/card/UPI)
  @Query('SELECT * FROM expenses WHERE mode = :mode ORDER BY date DESC')
  Future<List<ExpenseModel>> getExpensesByMode(String mode);
}
