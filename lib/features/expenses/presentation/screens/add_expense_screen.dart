import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/expense.dart';
import '../providers/add_expense_provider.dart';

class AddExpenseScreen extends ConsumerStatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  ConsumerState<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends ConsumerState<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  DateTime? _selectedDate;
  ExpenseCategory? _selectedCategory;

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  String? _validateAmount(String? value) {
    final amount = double.tryParse(value?.trim() ?? '');

    if (value == null || value.trim().isEmpty) {
      return 'Amount is required.';
    }

    if (amount == null) {
      return 'Enter a valid amount.';
    }

    if (amount <= 0) {
      return 'Amount must be greater than zero.';
    }

    return null;
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();

    final selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selected != null) {
      setState(() {
        _selectedDate = selected;
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please select a date.')));
      return;
    }

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category.')),
      );
      return;
    }

    final user = await ref.read(authProvider.future);

    if (user == null) {
      if (mounted) {
        context.go('/login');
      }
      return;
    }

    final expense = Expense(
      id: '',
      userId: user.id,
      amount: double.parse(_amountController.text.trim()),
      date: _selectedDate!,
      category: _selectedCategory!,
      note: _noteController.text.trim(),
    );

    final success = await ref.read(addExpenseProvider.notifier).submit(expense);

    if (!mounted) {
      return;
    }

    if (success) {
      ref.invalidate(addExpenseProvider);
      context.pop();
    } else {
      final state = ref.read(addExpenseProvider);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error?.toString() ?? 'Unable to add expense.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addExpenseProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '₱ ',
              ),
              validator: _validateAmount,
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _pickDate,
              borderRadius: BorderRadius.circular(4),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                child: Text(
                  _selectedDate == null
                      ? 'Select a date'
                      : '${_selectedDate!.month.toString().padLeft(2, '0')}/'
                            '${_selectedDate!.day.toString().padLeft(2, '0')}/'
                            '${_selectedDate!.year}',
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<ExpenseCategory>(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(labelText: 'Category'),
              items: ExpenseCategory.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.label),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              validator: (value) =>
                  value == null ? 'Category is required.' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _noteController,
              maxLength: 500,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Note',
                alignLabelWithHint: true,
                hintText: 'Add additional details...',
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: state.isLoading ? null : _submit,
              child: state.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
