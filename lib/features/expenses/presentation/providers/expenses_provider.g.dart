// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpensesNotifier)
final expensesProvider = ExpensesNotifierProvider._();

final class ExpensesNotifierProvider
    extends $AsyncNotifierProvider<ExpensesNotifier, List<Expense>> {
  ExpensesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expensesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expensesNotifierHash();

  @$internal
  @override
  ExpensesNotifier create() => ExpensesNotifier();
}

String _$expensesNotifierHash() => r'941253e730c302403a4af2340be779b7fd77d334';

abstract class _$ExpensesNotifier extends $AsyncNotifier<List<Expense>> {
  FutureOr<List<Expense>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Expense>>, List<Expense>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Expense>>, List<Expense>>,
              AsyncValue<List<Expense>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
