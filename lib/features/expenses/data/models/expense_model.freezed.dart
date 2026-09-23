// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseModel {

 String get id; String get userId; double get amount; String get date; String get category; String get note;
/// Create a copy of ExpenseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseModelCopyWith<ExpenseModel> get copyWith => _$ExpenseModelCopyWithImpl<ExpenseModel>(this as ExpenseModel, _$identity);

  /// Serializes this ExpenseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ExpenseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ExpenseModel;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.amount,_this.date,_this.category,_this.note);
}

@override
String toString() {
  final _this = this as ExpenseModel;
  return 'ExpenseModel(id: ${_this.id}, userId: ${_this.userId}, amount: ${_this.amount}, date: ${_this.date}, category: ${_this.category}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ExpenseModelCopyWith<$Res>  {
  factory $ExpenseModelCopyWith(ExpenseModel value, $Res Function(ExpenseModel) _then) = _$ExpenseModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, double amount, String date, String category, String note
});




}
/// @nodoc
class _$ExpenseModelCopyWithImpl<$Res>
    implements $ExpenseModelCopyWith<$Res> {
  _$ExpenseModelCopyWithImpl(this._self, this._then);

  final ExpenseModel _self;
  final $Res Function(ExpenseModel) _then;

/// Create a copy of ExpenseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? amount = null,Object? date = null,Object? category = null,Object? note = null,}) {
  return _then(ExpenseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseModel].
extension ExpenseModelPatterns on ExpenseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  double amount,  String date,  String category,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseModel() when $default != null:
return $default(_that.id,_that.userId,_that.amount,_that.date,_that.category,_that.note);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  double amount,  String date,  String category,  String note)  $default,) {final _that = this;
switch (_that) {
case _ExpenseModel():
return $default(_that.id,_that.userId,_that.amount,_that.date,_that.category,_that.note);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  double amount,  String date,  String category,  String note)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseModel() when $default != null:
return $default(_that.id,_that.userId,_that.amount,_that.date,_that.category,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseModel extends ExpenseModel {
  const _ExpenseModel({required this.id, required this.userId, required this.amount, required this.date, required this.category, required this.note}): super._();
  factory _ExpenseModel.fromJson(Map<String, dynamic> json) => _$ExpenseModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  double amount;
@override final  String date;
@override final  String category;
@override final  String note;

/// Create a copy of ExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseModelCopyWith<_ExpenseModel> get copyWith => __$ExpenseModelCopyWithImpl<_ExpenseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.category, category) || other.category == category)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,amount,date,category,note);
}

@override
String toString() {
    return 'ExpenseModel(id: $id, userId: $userId, amount: $amount, date: $date, category: $category, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ExpenseModelCopyWith<$Res> implements $ExpenseModelCopyWith<$Res> {
  factory _$ExpenseModelCopyWith(_ExpenseModel value, $Res Function(_ExpenseModel) _then) = __$ExpenseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, double amount, String date, String category, String note
});




}
/// @nodoc
class __$ExpenseModelCopyWithImpl<$Res>
    implements _$ExpenseModelCopyWith<$Res> {
  __$ExpenseModelCopyWithImpl(this._self, this._then);

  final _ExpenseModel _self;
  final $Res Function(_ExpenseModel) _then;

/// Create a copy of ExpenseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? amount = null,Object? date = null,Object? category = null,Object? note = null,}) {
  return _then(_ExpenseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
