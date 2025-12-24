import 'package:floor/floor.dart';

@Entity(tableName: 'expenses_model')
class ExpenseModel {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'category')
  final String category;

  @ColumnInfo(name: 'mode')
  final String mode;
  @ColumnInfo(name: 'other_details')
  final String? otherDetails;

  @ColumnInfo(name: 'amount')
  final double amount;

  @ColumnInfo(name: 'date')
  final String date; 
  @ColumnInfo(name: 'updated_at')
  final String? updatredAt; 
  @ColumnInfo(name: 'created_at')
  final String? createdAt; 



  ExpenseModel({
    required this.id,
    required this.category,
    required this.mode,
    required this.amount,
    required this.date,
    this.otherDetails,
    this.updatredAt,
    this.createdAt,
  });
}
