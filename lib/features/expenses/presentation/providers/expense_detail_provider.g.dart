// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(expenseDetail)
final expenseDetailProvider = ExpenseDetailFamily._();

final class ExpenseDetailProvider
    extends $FunctionalProvider<AsyncValue<Expense>, Expense, FutureOr<Expense>>
    with $FutureModifier<Expense>, $FutureProvider<Expense> {
  ExpenseDetailProvider._({
    required ExpenseDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'expenseDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$expenseDetailHash();

  @override
  String toString() {
    return r'expenseDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Expense> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Expense> create(Ref ref) {
    final argument = this.argument as String;
    return expenseDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$expenseDetailHash() => r'b38579f20a9f4d3298f49c1ebf66ed2ee0bd82b0';

final class ExpenseDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Expense>, String> {
  ExpenseDetailFamily._()
    : super(
        retry: null,
        name: r'expenseDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ExpenseDetailProvider call(String id) =>
      ExpenseDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'expenseDetailProvider';
}
