// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get id; String? get fullName; String get timezone; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserProfile;
  return Object.hash(runtimeType,_this.id,_this.fullName,_this.timezone,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as UserProfile;
  return 'UserProfile(id: ${_this.id}, fullName: ${_this.fullName}, timezone: ${_this.timezone}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String id, String? fullName, String timezone, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = freezed,Object? timezone = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? fullName,  String timezone,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.fullName,_that.timezone,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? fullName,  String timezone,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.fullName,_that.timezone,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? fullName,  String timezone,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.fullName,_that.timezone,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.id, this.fullName, this.timezone = 'UTC', required this.createdAt, required this.updatedAt});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String id;
@override final  String? fullName;
@override@JsonKey() final  String timezone;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,fullName,timezone,createdAt,updatedAt);
}

@override
String toString() {
    return 'UserProfile(id: $id, fullName: $fullName, timezone: $timezone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String? fullName, String timezone, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = freezed,Object? timezone = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Goal {

 String get id; String get userId; String get title; String? get description; String get category; DateTime? get targetDate; GoalStatus get status; int get progress; DateTime get createdAt; DateTime get updatedAt; List<Objective> get objectives;
/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalCopyWith<Goal> get copyWith => _$GoalCopyWithImpl<Goal>(this as Goal, _$identity);

  /// Serializes this Goal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Goal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Goal&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.targetDate, _this.targetDate) || other.targetDate == _this.targetDate)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.objectives, _this.objectives));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Goal;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.title,_this.description,_this.category,_this.targetDate,_this.status,_this.progress,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.objectives));
}

@override
String toString() {
  final _this = this as Goal;
  return 'Goal(id: ${_this.id}, userId: ${_this.userId}, title: ${_this.title}, description: ${_this.description}, category: ${_this.category}, targetDate: ${_this.targetDate}, status: ${_this.status}, progress: ${_this.progress}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, objectives: ${_this.objectives})';
}


}

/// @nodoc
abstract mixin class $GoalCopyWith<$Res>  {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) _then) = _$GoalCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String title, String? description, String category, DateTime? targetDate, GoalStatus status, int progress, DateTime createdAt, DateTime updatedAt, List<Objective> objectives
});




}
/// @nodoc
class _$GoalCopyWithImpl<$Res>
    implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._self, this._then);

  final Goal _self;
  final $Res Function(Goal) _then;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? description = freezed,Object? category = null,Object? targetDate = freezed,Object? status = null,Object? progress = null,Object? createdAt = null,Object? updatedAt = null,Object? objectives = null,}) {
  return _then(Goal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,objectives: null == objectives ? _self.objectives : objectives // ignore: cast_nullable_to_non_nullable
as List<Objective>,
  ));
}

}


/// Adds pattern-matching-related methods to [Goal].
extension GoalPatterns on Goal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Goal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Goal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Goal value)  $default,){
final _that = this;
switch (_that) {
case _Goal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Goal value)?  $default,){
final _that = this;
switch (_that) {
case _Goal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String title,  String? description,  String category,  DateTime? targetDate,  GoalStatus status,  int progress,  DateTime createdAt,  DateTime updatedAt,  List<Objective> objectives)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.description,_that.category,_that.targetDate,_that.status,_that.progress,_that.createdAt,_that.updatedAt,_that.objectives);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String title,  String? description,  String category,  DateTime? targetDate,  GoalStatus status,  int progress,  DateTime createdAt,  DateTime updatedAt,  List<Objective> objectives)  $default,) {final _that = this;
switch (_that) {
case _Goal():
return $default(_that.id,_that.userId,_that.title,_that.description,_that.category,_that.targetDate,_that.status,_that.progress,_that.createdAt,_that.updatedAt,_that.objectives);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String title,  String? description,  String category,  DateTime? targetDate,  GoalStatus status,  int progress,  DateTime createdAt,  DateTime updatedAt,  List<Objective> objectives)?  $default,) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.description,_that.category,_that.targetDate,_that.status,_that.progress,_that.createdAt,_that.updatedAt,_that.objectives);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Goal implements Goal {
  const _Goal({required this.id, required this.userId, required this.title, this.description, this.category = 'general', this.targetDate, this.status = GoalStatus.inProgress, this.progress = 0, required this.createdAt, required this.updatedAt,  List<Objective> objectives = const []}): _objectives = objectives;
  factory _Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String title;
@override final  String? description;
@override@JsonKey() final  String category;
@override final  DateTime? targetDate;
@override@JsonKey() final  GoalStatus status;
@override@JsonKey() final  int progress;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<Objective> _objectives;
@override@JsonKey() List<Objective> get objectives {
  if (_objectives is EqualUnmodifiableListView) return _objectives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_objectives);
}


/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalCopyWith<_Goal> get copyWith => __$GoalCopyWithImpl<_Goal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Goal&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.objectives, _objectives));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,title,description,category,targetDate,status,progress,createdAt,updatedAt,const DeepCollectionEquality().hash(_objectives));
}

@override
String toString() {
    return 'Goal(id: $id, userId: $userId, title: $title, description: $description, category: $category, targetDate: $targetDate, status: $status, progress: $progress, createdAt: $createdAt, updatedAt: $updatedAt, objectives: $objectives)';
}


}

/// @nodoc
abstract mixin class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) _then) = __$GoalCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String title, String? description, String category, DateTime? targetDate, GoalStatus status, int progress, DateTime createdAt, DateTime updatedAt, List<Objective> objectives
});




}
/// @nodoc
class __$GoalCopyWithImpl<$Res>
    implements _$GoalCopyWith<$Res> {
  __$GoalCopyWithImpl(this._self, this._then);

  final _Goal _self;
  final $Res Function(_Goal) _then;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? description = freezed,Object? category = null,Object? targetDate = freezed,Object? status = null,Object? progress = null,Object? createdAt = null,Object? updatedAt = null,Object? objectives = null,}) {
  return _then(_Goal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,objectives: null == objectives ? _self._objectives : objectives // ignore: cast_nullable_to_non_nullable
as List<Objective>,
  ));
}


}


/// @nodoc
mixin _$Objective {

 String get id; String get goalId; String get userId; String get title; bool get isCompleted; DateTime? get completedAt; DateTime get createdAt;
/// Create a copy of Objective
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObjectiveCopyWith<Objective> get copyWith => _$ObjectiveCopyWithImpl<Objective>(this as Objective, _$identity);

  /// Serializes this Objective to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Objective;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Objective&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.goalId, _this.goalId) || other.goalId == _this.goalId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.isCompleted, _this.isCompleted) || other.isCompleted == _this.isCompleted)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Objective;
  return Object.hash(runtimeType,_this.id,_this.goalId,_this.userId,_this.title,_this.isCompleted,_this.completedAt,_this.createdAt);
}

@override
String toString() {
  final _this = this as Objective;
  return 'Objective(id: ${_this.id}, goalId: ${_this.goalId}, userId: ${_this.userId}, title: ${_this.title}, isCompleted: ${_this.isCompleted}, completedAt: ${_this.completedAt}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ObjectiveCopyWith<$Res>  {
  factory $ObjectiveCopyWith(Objective value, $Res Function(Objective) _then) = _$ObjectiveCopyWithImpl;
@useResult
$Res call({
 String id, String goalId, String userId, String title, bool isCompleted, DateTime? completedAt, DateTime createdAt
});




}
/// @nodoc
class _$ObjectiveCopyWithImpl<$Res>
    implements $ObjectiveCopyWith<$Res> {
  _$ObjectiveCopyWithImpl(this._self, this._then);

  final Objective _self;
  final $Res Function(Objective) _then;

/// Create a copy of Objective
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? goalId = null,Object? userId = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? createdAt = null,}) {
  return _then(Objective(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,goalId: null == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Objective].
extension ObjectivePatterns on Objective {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Objective value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Objective() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Objective value)  $default,){
final _that = this;
switch (_that) {
case _Objective():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Objective value)?  $default,){
final _that = this;
switch (_that) {
case _Objective() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String goalId,  String userId,  String title,  bool isCompleted,  DateTime? completedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Objective() when $default != null:
return $default(_that.id,_that.goalId,_that.userId,_that.title,_that.isCompleted,_that.completedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String goalId,  String userId,  String title,  bool isCompleted,  DateTime? completedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Objective():
return $default(_that.id,_that.goalId,_that.userId,_that.title,_that.isCompleted,_that.completedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String goalId,  String userId,  String title,  bool isCompleted,  DateTime? completedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Objective() when $default != null:
return $default(_that.id,_that.goalId,_that.userId,_that.title,_that.isCompleted,_that.completedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Objective implements Objective {
  const _Objective({required this.id, required this.goalId, required this.userId, required this.title, this.isCompleted = false, this.completedAt, required this.createdAt});
  factory _Objective.fromJson(Map<String, dynamic> json) => _$ObjectiveFromJson(json);

@override final  String id;
@override final  String goalId;
@override final  String userId;
@override final  String title;
@override@JsonKey() final  bool isCompleted;
@override final  DateTime? completedAt;
@override final  DateTime createdAt;

/// Create a copy of Objective
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObjectiveCopyWith<_Objective> get copyWith => __$ObjectiveCopyWithImpl<_Objective>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ObjectiveToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Objective&&(identical(other.id, id) || other.id == id)&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,goalId,userId,title,isCompleted,completedAt,createdAt);
}

@override
String toString() {
    return 'Objective(id: $id, goalId: $goalId, userId: $userId, title: $title, isCompleted: $isCompleted, completedAt: $completedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ObjectiveCopyWith<$Res> implements $ObjectiveCopyWith<$Res> {
  factory _$ObjectiveCopyWith(_Objective value, $Res Function(_Objective) _then) = __$ObjectiveCopyWithImpl;
@override @useResult
$Res call({
 String id, String goalId, String userId, String title, bool isCompleted, DateTime? completedAt, DateTime createdAt
});




}
/// @nodoc
class __$ObjectiveCopyWithImpl<$Res>
    implements _$ObjectiveCopyWith<$Res> {
  __$ObjectiveCopyWithImpl(this._self, this._then);

  final _Objective _self;
  final $Res Function(_Objective) _then;

/// Create a copy of Objective
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? goalId = null,Object? userId = null,Object? title = null,Object? isCompleted = null,Object? completedAt = freezed,Object? createdAt = null,}) {
  return _then(_Objective(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,goalId: null == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Habit {

 String get id; String get userId; String get title; String? get description; String get category; HabitFrequency get frequency; int get targetDaysPerWeek; List<int> get customDays; bool get isArchived; DateTime get createdAt; DateTime get updatedAt; bool get completedToday; int get currentStreak;
/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitCopyWith<Habit> get copyWith => _$HabitCopyWithImpl<Habit>(this as Habit, _$identity);

  /// Serializes this Habit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Habit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Habit&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.frequency, _this.frequency) || other.frequency == _this.frequency)&&(identical(other.targetDaysPerWeek, _this.targetDaysPerWeek) || other.targetDaysPerWeek == _this.targetDaysPerWeek)&&const DeepCollectionEquality().equals(other.customDays, _this.customDays)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.completedToday, _this.completedToday) || other.completedToday == _this.completedToday)&&(identical(other.currentStreak, _this.currentStreak) || other.currentStreak == _this.currentStreak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Habit;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.title,_this.description,_this.category,_this.frequency,_this.targetDaysPerWeek,const DeepCollectionEquality().hash(_this.customDays),_this.isArchived,_this.createdAt,_this.updatedAt,_this.completedToday,_this.currentStreak);
}

@override
String toString() {
  final _this = this as Habit;
  return 'Habit(id: ${_this.id}, userId: ${_this.userId}, title: ${_this.title}, description: ${_this.description}, category: ${_this.category}, frequency: ${_this.frequency}, targetDaysPerWeek: ${_this.targetDaysPerWeek}, customDays: ${_this.customDays}, isArchived: ${_this.isArchived}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, completedToday: ${_this.completedToday}, currentStreak: ${_this.currentStreak})';
}


}

/// @nodoc
abstract mixin class $HabitCopyWith<$Res>  {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) _then) = _$HabitCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String title, String? description, String category, HabitFrequency frequency, int targetDaysPerWeek, List<int> customDays, bool isArchived, DateTime createdAt, DateTime updatedAt, bool completedToday, int currentStreak
});




}
/// @nodoc
class _$HabitCopyWithImpl<$Res>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._self, this._then);

  final Habit _self;
  final $Res Function(Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? description = freezed,Object? category = null,Object? frequency = null,Object? targetDaysPerWeek = null,Object? customDays = null,Object? isArchived = null,Object? createdAt = null,Object? updatedAt = null,Object? completedToday = null,Object? currentStreak = null,}) {
  return _then(Habit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as HabitFrequency,targetDaysPerWeek: null == targetDaysPerWeek ? _self.targetDaysPerWeek : targetDaysPerWeek // ignore: cast_nullable_to_non_nullable
as int,customDays: null == customDays ? _self.customDays : customDays // ignore: cast_nullable_to_non_nullable
as List<int>,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedToday: null == completedToday ? _self.completedToday : completedToday // ignore: cast_nullable_to_non_nullable
as bool,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Habit].
extension HabitPatterns on Habit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Habit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Habit value)  $default,){
final _that = this;
switch (_that) {
case _Habit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Habit value)?  $default,){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String title,  String? description,  String category,  HabitFrequency frequency,  int targetDaysPerWeek,  List<int> customDays,  bool isArchived,  DateTime createdAt,  DateTime updatedAt,  bool completedToday,  int currentStreak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.description,_that.category,_that.frequency,_that.targetDaysPerWeek,_that.customDays,_that.isArchived,_that.createdAt,_that.updatedAt,_that.completedToday,_that.currentStreak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String title,  String? description,  String category,  HabitFrequency frequency,  int targetDaysPerWeek,  List<int> customDays,  bool isArchived,  DateTime createdAt,  DateTime updatedAt,  bool completedToday,  int currentStreak)  $default,) {final _that = this;
switch (_that) {
case _Habit():
return $default(_that.id,_that.userId,_that.title,_that.description,_that.category,_that.frequency,_that.targetDaysPerWeek,_that.customDays,_that.isArchived,_that.createdAt,_that.updatedAt,_that.completedToday,_that.currentStreak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String title,  String? description,  String category,  HabitFrequency frequency,  int targetDaysPerWeek,  List<int> customDays,  bool isArchived,  DateTime createdAt,  DateTime updatedAt,  bool completedToday,  int currentStreak)?  $default,) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.description,_that.category,_that.frequency,_that.targetDaysPerWeek,_that.customDays,_that.isArchived,_that.createdAt,_that.updatedAt,_that.completedToday,_that.currentStreak);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Habit implements Habit {
  const _Habit({required this.id, required this.userId, required this.title, this.description, this.category = 'general', this.frequency = HabitFrequency.daily, this.targetDaysPerWeek = 7,  List<int> customDays = const [1, 2, 3, 4, 5, 6, 7], this.isArchived = false, required this.createdAt, required this.updatedAt, this.completedToday = false, this.currentStreak = 0}): _customDays = customDays;
  factory _Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String title;
@override final  String? description;
@override@JsonKey() final  String category;
@override@JsonKey() final  HabitFrequency frequency;
@override@JsonKey() final  int targetDaysPerWeek;
 final  List<int> _customDays;
@override@JsonKey() List<int> get customDays {
  if (_customDays is EqualUnmodifiableListView) return _customDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customDays);
}

@override@JsonKey() final  bool isArchived;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool completedToday;
@override@JsonKey() final  int currentStreak;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitCopyWith<_Habit> get copyWith => __$HabitCopyWithImpl<_Habit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HabitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.targetDaysPerWeek, targetDaysPerWeek) || other.targetDaysPerWeek == targetDaysPerWeek)&&const DeepCollectionEquality().equals(other.customDays, _customDays)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completedToday, completedToday) || other.completedToday == completedToday)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,title,description,category,frequency,targetDaysPerWeek,const DeepCollectionEquality().hash(_customDays),isArchived,createdAt,updatedAt,completedToday,currentStreak);
}

@override
String toString() {
    return 'Habit(id: $id, userId: $userId, title: $title, description: $description, category: $category, frequency: $frequency, targetDaysPerWeek: $targetDaysPerWeek, customDays: $customDays, isArchived: $isArchived, createdAt: $createdAt, updatedAt: $updatedAt, completedToday: $completedToday, currentStreak: $currentStreak)';
}


}

/// @nodoc
abstract mixin class _$HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$HabitCopyWith(_Habit value, $Res Function(_Habit) _then) = __$HabitCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String title, String? description, String category, HabitFrequency frequency, int targetDaysPerWeek, List<int> customDays, bool isArchived, DateTime createdAt, DateTime updatedAt, bool completedToday, int currentStreak
});




}
/// @nodoc
class __$HabitCopyWithImpl<$Res>
    implements _$HabitCopyWith<$Res> {
  __$HabitCopyWithImpl(this._self, this._then);

  final _Habit _self;
  final $Res Function(_Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? description = freezed,Object? category = null,Object? frequency = null,Object? targetDaysPerWeek = null,Object? customDays = null,Object? isArchived = null,Object? createdAt = null,Object? updatedAt = null,Object? completedToday = null,Object? currentStreak = null,}) {
  return _then(_Habit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as HabitFrequency,targetDaysPerWeek: null == targetDaysPerWeek ? _self.targetDaysPerWeek : targetDaysPerWeek // ignore: cast_nullable_to_non_nullable
as int,customDays: null == customDays ? _self._customDays : customDays // ignore: cast_nullable_to_non_nullable
as List<int>,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedToday: null == completedToday ? _self.completedToday : completedToday // ignore: cast_nullable_to_non_nullable
as bool,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HabitLog {

 String get id; String get habitId; String get userId; DateTime get logDate; bool get completed; String? get notes; DateTime get createdAt;
/// Create a copy of HabitLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitLogCopyWith<HabitLog> get copyWith => _$HabitLogCopyWithImpl<HabitLog>(this as HabitLog, _$identity);

  /// Serializes this HabitLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HabitLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitLog&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.habitId, _this.habitId) || other.habitId == _this.habitId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.logDate, _this.logDate) || other.logDate == _this.logDate)&&(identical(other.completed, _this.completed) || other.completed == _this.completed)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HabitLog;
  return Object.hash(runtimeType,_this.id,_this.habitId,_this.userId,_this.logDate,_this.completed,_this.notes,_this.createdAt);
}

@override
String toString() {
  final _this = this as HabitLog;
  return 'HabitLog(id: ${_this.id}, habitId: ${_this.habitId}, userId: ${_this.userId}, logDate: ${_this.logDate}, completed: ${_this.completed}, notes: ${_this.notes}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $HabitLogCopyWith<$Res>  {
  factory $HabitLogCopyWith(HabitLog value, $Res Function(HabitLog) _then) = _$HabitLogCopyWithImpl;
@useResult
$Res call({
 String id, String habitId, String userId, DateTime logDate, bool completed, String? notes, DateTime createdAt
});




}
/// @nodoc
class _$HabitLogCopyWithImpl<$Res>
    implements $HabitLogCopyWith<$Res> {
  _$HabitLogCopyWithImpl(this._self, this._then);

  final HabitLog _self;
  final $Res Function(HabitLog) _then;

/// Create a copy of HabitLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? habitId = null,Object? userId = null,Object? logDate = null,Object? completed = null,Object? notes = freezed,Object? createdAt = null,}) {
  return _then(HabitLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitLog].
extension HabitLogPatterns on HabitLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitLog value)  $default,){
final _that = this;
switch (_that) {
case _HabitLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitLog value)?  $default,){
final _that = this;
switch (_that) {
case _HabitLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String habitId,  String userId,  DateTime logDate,  bool completed,  String? notes,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitLog() when $default != null:
return $default(_that.id,_that.habitId,_that.userId,_that.logDate,_that.completed,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String habitId,  String userId,  DateTime logDate,  bool completed,  String? notes,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _HabitLog():
return $default(_that.id,_that.habitId,_that.userId,_that.logDate,_that.completed,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String habitId,  String userId,  DateTime logDate,  bool completed,  String? notes,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _HabitLog() when $default != null:
return $default(_that.id,_that.habitId,_that.userId,_that.logDate,_that.completed,_that.notes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HabitLog implements HabitLog {
  const _HabitLog({required this.id, required this.habitId, required this.userId, required this.logDate, this.completed = true, this.notes, required this.createdAt});
  factory _HabitLog.fromJson(Map<String, dynamic> json) => _$HabitLogFromJson(json);

@override final  String id;
@override final  String habitId;
@override final  String userId;
@override final  DateTime logDate;
@override@JsonKey() final  bool completed;
@override final  String? notes;
@override final  DateTime createdAt;

/// Create a copy of HabitLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitLogCopyWith<_HabitLog> get copyWith => __$HabitLogCopyWithImpl<_HabitLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HabitLogToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitLog&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,habitId,userId,logDate,completed,notes,createdAt);
}

@override
String toString() {
    return 'HabitLog(id: $id, habitId: $habitId, userId: $userId, logDate: $logDate, completed: $completed, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$HabitLogCopyWith<$Res> implements $HabitLogCopyWith<$Res> {
  factory _$HabitLogCopyWith(_HabitLog value, $Res Function(_HabitLog) _then) = __$HabitLogCopyWithImpl;
@override @useResult
$Res call({
 String id, String habitId, String userId, DateTime logDate, bool completed, String? notes, DateTime createdAt
});




}
/// @nodoc
class __$HabitLogCopyWithImpl<$Res>
    implements _$HabitLogCopyWith<$Res> {
  __$HabitLogCopyWithImpl(this._self, this._then);

  final _HabitLog _self;
  final $Res Function(_HabitLog) _then;

/// Create a copy of HabitLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? habitId = null,Object? userId = null,Object? logDate = null,Object? completed = null,Object? notes = freezed,Object? createdAt = null,}) {
  return _then(_HabitLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Task {

 String get id; String get userId; String? get goalId; String get title; String? get description; TaskPriority get priority; DateTime? get dueDate; bool get isCompleted; DateTime? get completedAt; String get category; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Task;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.goalId, _this.goalId) || other.goalId == _this.goalId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&(identical(other.dueDate, _this.dueDate) || other.dueDate == _this.dueDate)&&(identical(other.isCompleted, _this.isCompleted) || other.isCompleted == _this.isCompleted)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Task;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.goalId,_this.title,_this.description,_this.priority,_this.dueDate,_this.isCompleted,_this.completedAt,_this.category,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as Task;
  return 'Task(id: ${_this.id}, userId: ${_this.userId}, goalId: ${_this.goalId}, title: ${_this.title}, description: ${_this.description}, priority: ${_this.priority}, dueDate: ${_this.dueDate}, isCompleted: ${_this.isCompleted}, completedAt: ${_this.completedAt}, category: ${_this.category}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String? goalId, String title, String? description, TaskPriority priority, DateTime? dueDate, bool isCompleted, DateTime? completedAt, String category, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? goalId = freezed,Object? title = null,Object? description = freezed,Object? priority = null,Object? dueDate = freezed,Object? isCompleted = null,Object? completedAt = freezed,Object? category = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns on Task {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Task value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Task() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Task value)  $default,){
final _that = this;
switch (_that) {
case _Task():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Task value)?  $default,){
final _that = this;
switch (_that) {
case _Task() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String? goalId,  String title,  String? description,  TaskPriority priority,  DateTime? dueDate,  bool isCompleted,  DateTime? completedAt,  String category,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.userId,_that.goalId,_that.title,_that.description,_that.priority,_that.dueDate,_that.isCompleted,_that.completedAt,_that.category,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String? goalId,  String title,  String? description,  TaskPriority priority,  DateTime? dueDate,  bool isCompleted,  DateTime? completedAt,  String category,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Task():
return $default(_that.id,_that.userId,_that.goalId,_that.title,_that.description,_that.priority,_that.dueDate,_that.isCompleted,_that.completedAt,_that.category,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String? goalId,  String title,  String? description,  TaskPriority priority,  DateTime? dueDate,  bool isCompleted,  DateTime? completedAt,  String category,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.userId,_that.goalId,_that.title,_that.description,_that.priority,_that.dueDate,_that.isCompleted,_that.completedAt,_that.category,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Task implements Task {
  const _Task({required this.id, required this.userId, this.goalId, required this.title, this.description, this.priority = TaskPriority.medium, this.dueDate, this.isCompleted = false, this.completedAt, this.category = 'general', required this.createdAt, required this.updatedAt});
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String? goalId;
@override final  String title;
@override final  String? description;
@override@JsonKey() final  TaskPriority priority;
@override final  DateTime? dueDate;
@override@JsonKey() final  bool isCompleted;
@override final  DateTime? completedAt;
@override@JsonKey() final  String category;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCopyWith<_Task> get copyWith => __$TaskCopyWithImpl<_Task>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Task&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.category, category) || other.category == category)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,goalId,title,description,priority,dueDate,isCompleted,completedAt,category,createdAt,updatedAt);
}

@override
String toString() {
    return 'Task(id: $id, userId: $userId, goalId: $goalId, title: $title, description: $description, priority: $priority, dueDate: $dueDate, isCompleted: $isCompleted, completedAt: $completedAt, category: $category, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) = __$TaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String? goalId, String title, String? description, TaskPriority priority, DateTime? dueDate, bool isCompleted, DateTime? completedAt, String category, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? goalId = freezed,Object? title = null,Object? description = freezed,Object? priority = null,Object? dueDate = freezed,Object? isCompleted = null,Object? completedAt = freezed,Object? category = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$Metric {

 String get id; String get userId; String get name; String get category; MetricType get type; String? get unit; double? get minVal; double? get maxVal; double get step; bool get isArchived; DateTime get createdAt; dynamic get currentValue;
/// Create a copy of Metric
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricCopyWith<Metric> get copyWith => _$MetricCopyWithImpl<Metric>(this as Metric, _$identity);

  /// Serializes this Metric to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Metric;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Metric&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.minVal, _this.minVal) || other.minVal == _this.minVal)&&(identical(other.maxVal, _this.maxVal) || other.maxVal == _this.maxVal)&&(identical(other.step, _this.step) || other.step == _this.step)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&const DeepCollectionEquality().equals(other.currentValue, _this.currentValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Metric;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.name,_this.category,_this.type,_this.unit,_this.minVal,_this.maxVal,_this.step,_this.isArchived,_this.createdAt,const DeepCollectionEquality().hash(_this.currentValue));
}

@override
String toString() {
  final _this = this as Metric;
  return 'Metric(id: ${_this.id}, userId: ${_this.userId}, name: ${_this.name}, category: ${_this.category}, type: ${_this.type}, unit: ${_this.unit}, minVal: ${_this.minVal}, maxVal: ${_this.maxVal}, step: ${_this.step}, isArchived: ${_this.isArchived}, createdAt: ${_this.createdAt}, currentValue: ${_this.currentValue})';
}


}

/// @nodoc
abstract mixin class $MetricCopyWith<$Res>  {
  factory $MetricCopyWith(Metric value, $Res Function(Metric) _then) = _$MetricCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String name, String category, MetricType type, String? unit, double? minVal, double? maxVal, double step, bool isArchived, DateTime createdAt, dynamic currentValue
});




}
/// @nodoc
class _$MetricCopyWithImpl<$Res>
    implements $MetricCopyWith<$Res> {
  _$MetricCopyWithImpl(this._self, this._then);

  final Metric _self;
  final $Res Function(Metric) _then;

/// Create a copy of Metric
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? category = null,Object? type = null,Object? unit = freezed,Object? minVal = freezed,Object? maxVal = freezed,Object? step = null,Object? isArchived = null,Object? createdAt = null,Object? currentValue = freezed,}) {
  return _then(Metric(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MetricType,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,minVal: freezed == minVal ? _self.minVal : minVal // ignore: cast_nullable_to_non_nullable
as double?,maxVal: freezed == maxVal ? _self.maxVal : maxVal // ignore: cast_nullable_to_non_nullable
as double?,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as double,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [Metric].
extension MetricPatterns on Metric {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Metric value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Metric() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Metric value)  $default,){
final _that = this;
switch (_that) {
case _Metric():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Metric value)?  $default,){
final _that = this;
switch (_that) {
case _Metric() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String category,  MetricType type,  String? unit,  double? minVal,  double? maxVal,  double step,  bool isArchived,  DateTime createdAt,  dynamic currentValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Metric() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.category,_that.type,_that.unit,_that.minVal,_that.maxVal,_that.step,_that.isArchived,_that.createdAt,_that.currentValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String category,  MetricType type,  String? unit,  double? minVal,  double? maxVal,  double step,  bool isArchived,  DateTime createdAt,  dynamic currentValue)  $default,) {final _that = this;
switch (_that) {
case _Metric():
return $default(_that.id,_that.userId,_that.name,_that.category,_that.type,_that.unit,_that.minVal,_that.maxVal,_that.step,_that.isArchived,_that.createdAt,_that.currentValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String name,  String category,  MetricType type,  String? unit,  double? minVal,  double? maxVal,  double step,  bool isArchived,  DateTime createdAt,  dynamic currentValue)?  $default,) {final _that = this;
switch (_that) {
case _Metric() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.category,_that.type,_that.unit,_that.minVal,_that.maxVal,_that.step,_that.isArchived,_that.createdAt,_that.currentValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Metric implements Metric {
  const _Metric({required this.id, required this.userId, required this.name, this.category = 'general', required this.type, this.unit, this.minVal, this.maxVal, this.step = 1, this.isArchived = false, required this.createdAt, this.currentValue});
  factory _Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String name;
@override@JsonKey() final  String category;
@override final  MetricType type;
@override final  String? unit;
@override final  double? minVal;
@override final  double? maxVal;
@override@JsonKey() final  double step;
@override@JsonKey() final  bool isArchived;
@override final  DateTime createdAt;
@override final  dynamic currentValue;

/// Create a copy of Metric
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricCopyWith<_Metric> get copyWith => __$MetricCopyWithImpl<_Metric>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetricToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Metric&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.minVal, minVal) || other.minVal == minVal)&&(identical(other.maxVal, maxVal) || other.maxVal == maxVal)&&(identical(other.step, step) || other.step == step)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.currentValue, currentValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,name,category,type,unit,minVal,maxVal,step,isArchived,createdAt,const DeepCollectionEquality().hash(currentValue));
}

@override
String toString() {
    return 'Metric(id: $id, userId: $userId, name: $name, category: $category, type: $type, unit: $unit, minVal: $minVal, maxVal: $maxVal, step: $step, isArchived: $isArchived, createdAt: $createdAt, currentValue: $currentValue)';
}


}

/// @nodoc
abstract mixin class _$MetricCopyWith<$Res> implements $MetricCopyWith<$Res> {
  factory _$MetricCopyWith(_Metric value, $Res Function(_Metric) _then) = __$MetricCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String name, String category, MetricType type, String? unit, double? minVal, double? maxVal, double step, bool isArchived, DateTime createdAt, dynamic currentValue
});




}
/// @nodoc
class __$MetricCopyWithImpl<$Res>
    implements _$MetricCopyWith<$Res> {
  __$MetricCopyWithImpl(this._self, this._then);

  final _Metric _self;
  final $Res Function(_Metric) _then;

/// Create a copy of Metric
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? category = null,Object? type = null,Object? unit = freezed,Object? minVal = freezed,Object? maxVal = freezed,Object? step = null,Object? isArchived = null,Object? createdAt = null,Object? currentValue = freezed,}) {
  return _then(_Metric(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MetricType,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,minVal: freezed == minVal ? _self.minVal : minVal // ignore: cast_nullable_to_non_nullable
as double?,maxVal: freezed == maxVal ? _self.maxVal : maxVal // ignore: cast_nullable_to_non_nullable
as double?,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as double,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$MetricLog {

 String get id; String get metricId; String get userId; DateTime get logDate; DateTime get logTime; double? get valNum; bool? get valBool; String? get valText; DateTime get createdAt;
/// Create a copy of MetricLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricLogCopyWith<MetricLog> get copyWith => _$MetricLogCopyWithImpl<MetricLog>(this as MetricLog, _$identity);

  /// Serializes this MetricLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MetricLog;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetricLog&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.metricId, _this.metricId) || other.metricId == _this.metricId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.logDate, _this.logDate) || other.logDate == _this.logDate)&&(identical(other.logTime, _this.logTime) || other.logTime == _this.logTime)&&(identical(other.valNum, _this.valNum) || other.valNum == _this.valNum)&&(identical(other.valBool, _this.valBool) || other.valBool == _this.valBool)&&(identical(other.valText, _this.valText) || other.valText == _this.valText)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MetricLog;
  return Object.hash(runtimeType,_this.id,_this.metricId,_this.userId,_this.logDate,_this.logTime,_this.valNum,_this.valBool,_this.valText,_this.createdAt);
}

@override
String toString() {
  final _this = this as MetricLog;
  return 'MetricLog(id: ${_this.id}, metricId: ${_this.metricId}, userId: ${_this.userId}, logDate: ${_this.logDate}, logTime: ${_this.logTime}, valNum: ${_this.valNum}, valBool: ${_this.valBool}, valText: ${_this.valText}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $MetricLogCopyWith<$Res>  {
  factory $MetricLogCopyWith(MetricLog value, $Res Function(MetricLog) _then) = _$MetricLogCopyWithImpl;
@useResult
$Res call({
 String id, String metricId, String userId, DateTime logDate, DateTime logTime, double? valNum, bool? valBool, String? valText, DateTime createdAt
});




}
/// @nodoc
class _$MetricLogCopyWithImpl<$Res>
    implements $MetricLogCopyWith<$Res> {
  _$MetricLogCopyWithImpl(this._self, this._then);

  final MetricLog _self;
  final $Res Function(MetricLog) _then;

/// Create a copy of MetricLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? metricId = null,Object? userId = null,Object? logDate = null,Object? logTime = null,Object? valNum = freezed,Object? valBool = freezed,Object? valText = freezed,Object? createdAt = null,}) {
  return _then(MetricLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,metricId: null == metricId ? _self.metricId : metricId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,logTime: null == logTime ? _self.logTime : logTime // ignore: cast_nullable_to_non_nullable
as DateTime,valNum: freezed == valNum ? _self.valNum : valNum // ignore: cast_nullable_to_non_nullable
as double?,valBool: freezed == valBool ? _self.valBool : valBool // ignore: cast_nullable_to_non_nullable
as bool?,valText: freezed == valText ? _self.valText : valText // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MetricLog].
extension MetricLogPatterns on MetricLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetricLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetricLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetricLog value)  $default,){
final _that = this;
switch (_that) {
case _MetricLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetricLog value)?  $default,){
final _that = this;
switch (_that) {
case _MetricLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String metricId,  String userId,  DateTime logDate,  DateTime logTime,  double? valNum,  bool? valBool,  String? valText,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetricLog() when $default != null:
return $default(_that.id,_that.metricId,_that.userId,_that.logDate,_that.logTime,_that.valNum,_that.valBool,_that.valText,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String metricId,  String userId,  DateTime logDate,  DateTime logTime,  double? valNum,  bool? valBool,  String? valText,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MetricLog():
return $default(_that.id,_that.metricId,_that.userId,_that.logDate,_that.logTime,_that.valNum,_that.valBool,_that.valText,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String metricId,  String userId,  DateTime logDate,  DateTime logTime,  double? valNum,  bool? valBool,  String? valText,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MetricLog() when $default != null:
return $default(_that.id,_that.metricId,_that.userId,_that.logDate,_that.logTime,_that.valNum,_that.valBool,_that.valText,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetricLog implements MetricLog {
  const _MetricLog({required this.id, required this.metricId, required this.userId, required this.logDate, required this.logTime, this.valNum, this.valBool, this.valText, required this.createdAt});
  factory _MetricLog.fromJson(Map<String, dynamic> json) => _$MetricLogFromJson(json);

@override final  String id;
@override final  String metricId;
@override final  String userId;
@override final  DateTime logDate;
@override final  DateTime logTime;
@override final  double? valNum;
@override final  bool? valBool;
@override final  String? valText;
@override final  DateTime createdAt;

/// Create a copy of MetricLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricLogCopyWith<_MetricLog> get copyWith => __$MetricLogCopyWithImpl<_MetricLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetricLogToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetricLog&&(identical(other.id, id) || other.id == id)&&(identical(other.metricId, metricId) || other.metricId == metricId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.logTime, logTime) || other.logTime == logTime)&&(identical(other.valNum, valNum) || other.valNum == valNum)&&(identical(other.valBool, valBool) || other.valBool == valBool)&&(identical(other.valText, valText) || other.valText == valText)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,metricId,userId,logDate,logTime,valNum,valBool,valText,createdAt);
}

@override
String toString() {
    return 'MetricLog(id: $id, metricId: $metricId, userId: $userId, logDate: $logDate, logTime: $logTime, valNum: $valNum, valBool: $valBool, valText: $valText, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MetricLogCopyWith<$Res> implements $MetricLogCopyWith<$Res> {
  factory _$MetricLogCopyWith(_MetricLog value, $Res Function(_MetricLog) _then) = __$MetricLogCopyWithImpl;
@override @useResult
$Res call({
 String id, String metricId, String userId, DateTime logDate, DateTime logTime, double? valNum, bool? valBool, String? valText, DateTime createdAt
});




}
/// @nodoc
class __$MetricLogCopyWithImpl<$Res>
    implements _$MetricLogCopyWith<$Res> {
  __$MetricLogCopyWithImpl(this._self, this._then);

  final _MetricLog _self;
  final $Res Function(_MetricLog) _then;

/// Create a copy of MetricLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? metricId = null,Object? userId = null,Object? logDate = null,Object? logTime = null,Object? valNum = freezed,Object? valBool = freezed,Object? valText = freezed,Object? createdAt = null,}) {
  return _then(_MetricLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,metricId: null == metricId ? _self.metricId : metricId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,logTime: null == logTime ? _self.logTime : logTime // ignore: cast_nullable_to_non_nullable
as DateTime,valNum: freezed == valNum ? _self.valNum : valNum // ignore: cast_nullable_to_non_nullable
as double?,valBool: freezed == valBool ? _self.valBool : valBool // ignore: cast_nullable_to_non_nullable
as bool?,valText: freezed == valText ? _self.valText : valText // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$DailyCheckIn {

 String get id; String get userId; DateTime get checkInDate; int get mood; int get energy; int get stress; int get productivity; double get sleepHours; String? get notes; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of DailyCheckIn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyCheckInCopyWith<DailyCheckIn> get copyWith => _$DailyCheckInCopyWithImpl<DailyCheckIn>(this as DailyCheckIn, _$identity);

  /// Serializes this DailyCheckIn to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyCheckIn;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyCheckIn&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.checkInDate, _this.checkInDate) || other.checkInDate == _this.checkInDate)&&(identical(other.mood, _this.mood) || other.mood == _this.mood)&&(identical(other.energy, _this.energy) || other.energy == _this.energy)&&(identical(other.stress, _this.stress) || other.stress == _this.stress)&&(identical(other.productivity, _this.productivity) || other.productivity == _this.productivity)&&(identical(other.sleepHours, _this.sleepHours) || other.sleepHours == _this.sleepHours)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyCheckIn;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.checkInDate,_this.mood,_this.energy,_this.stress,_this.productivity,_this.sleepHours,_this.notes,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as DailyCheckIn;
  return 'DailyCheckIn(id: ${_this.id}, userId: ${_this.userId}, checkInDate: ${_this.checkInDate}, mood: ${_this.mood}, energy: ${_this.energy}, stress: ${_this.stress}, productivity: ${_this.productivity}, sleepHours: ${_this.sleepHours}, notes: ${_this.notes}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $DailyCheckInCopyWith<$Res>  {
  factory $DailyCheckInCopyWith(DailyCheckIn value, $Res Function(DailyCheckIn) _then) = _$DailyCheckInCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DateTime checkInDate, int mood, int energy, int stress, int productivity, double sleepHours, String? notes, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$DailyCheckInCopyWithImpl<$Res>
    implements $DailyCheckInCopyWith<$Res> {
  _$DailyCheckInCopyWithImpl(this._self, this._then);

  final DailyCheckIn _self;
  final $Res Function(DailyCheckIn) _then;

/// Create a copy of DailyCheckIn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? checkInDate = null,Object? mood = null,Object? energy = null,Object? stress = null,Object? productivity = null,Object? sleepHours = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(DailyCheckIn(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as DateTime,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as int,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as int,stress: null == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as int,productivity: null == productivity ? _self.productivity : productivity // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyCheckIn].
extension DailyCheckInPatterns on DailyCheckIn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyCheckIn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyCheckIn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyCheckIn value)  $default,){
final _that = this;
switch (_that) {
case _DailyCheckIn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyCheckIn value)?  $default,){
final _that = this;
switch (_that) {
case _DailyCheckIn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime checkInDate,  int mood,  int energy,  int stress,  int productivity,  double sleepHours,  String? notes,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyCheckIn() when $default != null:
return $default(_that.id,_that.userId,_that.checkInDate,_that.mood,_that.energy,_that.stress,_that.productivity,_that.sleepHours,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime checkInDate,  int mood,  int energy,  int stress,  int productivity,  double sleepHours,  String? notes,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DailyCheckIn():
return $default(_that.id,_that.userId,_that.checkInDate,_that.mood,_that.energy,_that.stress,_that.productivity,_that.sleepHours,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  DateTime checkInDate,  int mood,  int energy,  int stress,  int productivity,  double sleepHours,  String? notes,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DailyCheckIn() when $default != null:
return $default(_that.id,_that.userId,_that.checkInDate,_that.mood,_that.energy,_that.stress,_that.productivity,_that.sleepHours,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyCheckIn implements DailyCheckIn {
  const _DailyCheckIn({required this.id, required this.userId, required this.checkInDate, this.mood = 5, this.energy = 5, this.stress = 5, this.productivity = 5, this.sleepHours = 0.0, this.notes, required this.createdAt, required this.updatedAt});
  factory _DailyCheckIn.fromJson(Map<String, dynamic> json) => _$DailyCheckInFromJson(json);

@override final  String id;
@override final  String userId;
@override final  DateTime checkInDate;
@override@JsonKey() final  int mood;
@override@JsonKey() final  int energy;
@override@JsonKey() final  int stress;
@override@JsonKey() final  int productivity;
@override@JsonKey() final  double sleepHours;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of DailyCheckIn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyCheckInCopyWith<_DailyCheckIn> get copyWith => __$DailyCheckInCopyWithImpl<_DailyCheckIn>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyCheckInToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyCheckIn&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.checkInDate, checkInDate) || other.checkInDate == checkInDate)&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.energy, energy) || other.energy == energy)&&(identical(other.stress, stress) || other.stress == stress)&&(identical(other.productivity, productivity) || other.productivity == productivity)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,checkInDate,mood,energy,stress,productivity,sleepHours,notes,createdAt,updatedAt);
}

@override
String toString() {
    return 'DailyCheckIn(id: $id, userId: $userId, checkInDate: $checkInDate, mood: $mood, energy: $energy, stress: $stress, productivity: $productivity, sleepHours: $sleepHours, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DailyCheckInCopyWith<$Res> implements $DailyCheckInCopyWith<$Res> {
  factory _$DailyCheckInCopyWith(_DailyCheckIn value, $Res Function(_DailyCheckIn) _then) = __$DailyCheckInCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DateTime checkInDate, int mood, int energy, int stress, int productivity, double sleepHours, String? notes, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$DailyCheckInCopyWithImpl<$Res>
    implements _$DailyCheckInCopyWith<$Res> {
  __$DailyCheckInCopyWithImpl(this._self, this._then);

  final _DailyCheckIn _self;
  final $Res Function(_DailyCheckIn) _then;

/// Create a copy of DailyCheckIn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? checkInDate = null,Object? mood = null,Object? energy = null,Object? stress = null,Object? productivity = null,Object? sleepHours = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DailyCheckIn(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,checkInDate: null == checkInDate ? _self.checkInDate : checkInDate // ignore: cast_nullable_to_non_nullable
as DateTime,mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as int,energy: null == energy ? _self.energy : energy // ignore: cast_nullable_to_non_nullable
as int,stress: null == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as int,productivity: null == productivity ? _self.productivity : productivity // ignore: cast_nullable_to_non_nullable
as int,sleepHours: null == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$JournalEntry {

 String get id; String get userId; DateTime get entryDate; String? get title; String get content; List<String> get tags; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of JournalEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JournalEntryCopyWith<JournalEntry> get copyWith => _$JournalEntryCopyWithImpl<JournalEntry>(this as JournalEntry, _$identity);

  /// Serializes this JournalEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JournalEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JournalEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.entryDate, _this.entryDate) || other.entryDate == _this.entryDate)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.content, _this.content) || other.content == _this.content)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JournalEntry;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.entryDate,_this.title,_this.content,const DeepCollectionEquality().hash(_this.tags),_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as JournalEntry;
  return 'JournalEntry(id: ${_this.id}, userId: ${_this.userId}, entryDate: ${_this.entryDate}, title: ${_this.title}, content: ${_this.content}, tags: ${_this.tags}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $JournalEntryCopyWith<$Res>  {
  factory $JournalEntryCopyWith(JournalEntry value, $Res Function(JournalEntry) _then) = _$JournalEntryCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DateTime entryDate, String? title, String content, List<String> tags, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$JournalEntryCopyWithImpl<$Res>
    implements $JournalEntryCopyWith<$Res> {
  _$JournalEntryCopyWithImpl(this._self, this._then);

  final JournalEntry _self;
  final $Res Function(JournalEntry) _then;

/// Create a copy of JournalEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? entryDate = null,Object? title = freezed,Object? content = null,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(JournalEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,entryDate: null == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [JournalEntry].
extension JournalEntryPatterns on JournalEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JournalEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JournalEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JournalEntry value)  $default,){
final _that = this;
switch (_that) {
case _JournalEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JournalEntry value)?  $default,){
final _that = this;
switch (_that) {
case _JournalEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime entryDate,  String? title,  String content,  List<String> tags,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JournalEntry() when $default != null:
return $default(_that.id,_that.userId,_that.entryDate,_that.title,_that.content,_that.tags,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime entryDate,  String? title,  String content,  List<String> tags,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _JournalEntry():
return $default(_that.id,_that.userId,_that.entryDate,_that.title,_that.content,_that.tags,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  DateTime entryDate,  String? title,  String content,  List<String> tags,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _JournalEntry() when $default != null:
return $default(_that.id,_that.userId,_that.entryDate,_that.title,_that.content,_that.tags,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JournalEntry implements JournalEntry {
  const _JournalEntry({required this.id, required this.userId, required this.entryDate, this.title, required this.content,  List<String> tags = const [], required this.createdAt, required this.updatedAt}): _tags = tags;
  factory _JournalEntry.fromJson(Map<String, dynamic> json) => _$JournalEntryFromJson(json);

@override final  String id;
@override final  String userId;
@override final  DateTime entryDate;
@override final  String? title;
@override final  String content;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of JournalEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JournalEntryCopyWith<_JournalEntry> get copyWith => __$JournalEntryCopyWithImpl<_JournalEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JournalEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JournalEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.tags, _tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,entryDate,title,content,const DeepCollectionEquality().hash(_tags),createdAt,updatedAt);
}

@override
String toString() {
    return 'JournalEntry(id: $id, userId: $userId, entryDate: $entryDate, title: $title, content: $content, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$JournalEntryCopyWith<$Res> implements $JournalEntryCopyWith<$Res> {
  factory _$JournalEntryCopyWith(_JournalEntry value, $Res Function(_JournalEntry) _then) = __$JournalEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DateTime entryDate, String? title, String content, List<String> tags, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$JournalEntryCopyWithImpl<$Res>
    implements _$JournalEntryCopyWith<$Res> {
  __$JournalEntryCopyWithImpl(this._self, this._then);

  final _JournalEntry _self;
  final $Res Function(_JournalEntry) _then;

/// Create a copy of JournalEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? entryDate = null,Object? title = freezed,Object? content = null,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_JournalEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,entryDate: null == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as DateTime,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ActivityEvent {

 String get id; String get userId; DateTime get eventTime; DateTime get eventDate; String get type; String get category; double? get value; String? get unit; Map<String, dynamic> get metadata; DateTime get createdAt;
/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityEventCopyWith<ActivityEvent> get copyWith => _$ActivityEventCopyWithImpl<ActivityEvent>(this as ActivityEvent, _$identity);

  /// Serializes this ActivityEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ActivityEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityEvent&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.eventTime, _this.eventTime) || other.eventTime == _this.eventTime)&&(identical(other.eventDate, _this.eventDate) || other.eventDate == _this.eventDate)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ActivityEvent;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.eventTime,_this.eventDate,_this.type,_this.category,_this.value,_this.unit,const DeepCollectionEquality().hash(_this.metadata),_this.createdAt);
}

@override
String toString() {
  final _this = this as ActivityEvent;
  return 'ActivityEvent(id: ${_this.id}, userId: ${_this.userId}, eventTime: ${_this.eventTime}, eventDate: ${_this.eventDate}, type: ${_this.type}, category: ${_this.category}, value: ${_this.value}, unit: ${_this.unit}, metadata: ${_this.metadata}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ActivityEventCopyWith<$Res>  {
  factory $ActivityEventCopyWith(ActivityEvent value, $Res Function(ActivityEvent) _then) = _$ActivityEventCopyWithImpl;
@useResult
$Res call({
 String id, String userId, DateTime eventTime, DateTime eventDate, String type, String category, double? value, String? unit, Map<String, dynamic> metadata, DateTime createdAt
});




}
/// @nodoc
class _$ActivityEventCopyWithImpl<$Res>
    implements $ActivityEventCopyWith<$Res> {
  _$ActivityEventCopyWithImpl(this._self, this._then);

  final ActivityEvent _self;
  final $Res Function(ActivityEvent) _then;

/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? eventTime = null,Object? eventDate = null,Object? type = null,Object? category = null,Object? value = freezed,Object? unit = freezed,Object? metadata = null,Object? createdAt = null,}) {
  return _then(ActivityEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,eventTime: null == eventTime ? _self.eventTime : eventTime // ignore: cast_nullable_to_non_nullable
as DateTime,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityEvent].
extension ActivityEventPatterns on ActivityEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityEvent value)  $default,){
final _that = this;
switch (_that) {
case _ActivityEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityEvent value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime eventTime,  DateTime eventDate,  String type,  String category,  double? value,  String? unit,  Map<String, dynamic> metadata,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityEvent() when $default != null:
return $default(_that.id,_that.userId,_that.eventTime,_that.eventDate,_that.type,_that.category,_that.value,_that.unit,_that.metadata,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  DateTime eventTime,  DateTime eventDate,  String type,  String category,  double? value,  String? unit,  Map<String, dynamic> metadata,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ActivityEvent():
return $default(_that.id,_that.userId,_that.eventTime,_that.eventDate,_that.type,_that.category,_that.value,_that.unit,_that.metadata,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  DateTime eventTime,  DateTime eventDate,  String type,  String category,  double? value,  String? unit,  Map<String, dynamic> metadata,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ActivityEvent() when $default != null:
return $default(_that.id,_that.userId,_that.eventTime,_that.eventDate,_that.type,_that.category,_that.value,_that.unit,_that.metadata,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityEvent implements ActivityEvent {
  const _ActivityEvent({required this.id, required this.userId, required this.eventTime, required this.eventDate, required this.type, this.category = 'general', this.value, this.unit,  Map<String, dynamic> metadata = const {}, required this.createdAt}): _metadata = metadata;
  factory _ActivityEvent.fromJson(Map<String, dynamic> json) => _$ActivityEventFromJson(json);

@override final  String id;
@override final  String userId;
@override final  DateTime eventTime;
@override final  DateTime eventDate;
@override final  String type;
@override@JsonKey() final  String category;
@override final  double? value;
@override final  String? unit;
 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

@override final  DateTime createdAt;

/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityEventCopyWith<_ActivityEvent> get copyWith => __$ActivityEventCopyWithImpl<_ActivityEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityEventToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.eventTime, eventTime) || other.eventTime == eventTime)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,eventTime,eventDate,type,category,value,unit,const DeepCollectionEquality().hash(_metadata),createdAt);
}

@override
String toString() {
    return 'ActivityEvent(id: $id, userId: $userId, eventTime: $eventTime, eventDate: $eventDate, type: $type, category: $category, value: $value, unit: $unit, metadata: $metadata, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ActivityEventCopyWith<$Res> implements $ActivityEventCopyWith<$Res> {
  factory _$ActivityEventCopyWith(_ActivityEvent value, $Res Function(_ActivityEvent) _then) = __$ActivityEventCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, DateTime eventTime, DateTime eventDate, String type, String category, double? value, String? unit, Map<String, dynamic> metadata, DateTime createdAt
});




}
/// @nodoc
class __$ActivityEventCopyWithImpl<$Res>
    implements _$ActivityEventCopyWith<$Res> {
  __$ActivityEventCopyWithImpl(this._self, this._then);

  final _ActivityEvent _self;
  final $Res Function(_ActivityEvent) _then;

/// Create a copy of ActivityEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? eventTime = null,Object? eventDate = null,Object? type = null,Object? category = null,Object? value = freezed,Object? unit = freezed,Object? metadata = null,Object? createdAt = null,}) {
  return _then(_ActivityEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,eventTime: null == eventTime ? _self.eventTime : eventTime // ignore: cast_nullable_to_non_nullable
as DateTime,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
