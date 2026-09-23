// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_expense_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddExpenseNotifier)
final addExpenseProvider = AddExpenseNotifierProvider._();

final class AddExpenseNotifierProvider
    extends $AsyncNotifierProvider<AddExpenseNotifier, void> {
  AddExpenseNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addExpenseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addExpenseNotifierHash();

  @$internal
  @override
  AddExpenseNotifier create() => AddExpenseNotifier();
}

String _$addExpenseNotifierHash() =>
    r'eaf6f01a5e1d2b733f3824447bbb018ed1dcc3ed';

abstract class _$AddExpenseNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
