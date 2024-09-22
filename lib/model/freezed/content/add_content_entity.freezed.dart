// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_content_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddContentEntity _$AddContentEntityFromJson(Map<String, dynamic> json) {
  return _AddContentEntity.fromJson(json);
}

/// @nodoc
mixin _$AddContentEntity {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  /// Serializes this AddContentEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddContentEntityCopyWith<AddContentEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddContentEntityCopyWith<$Res> {
  factory $AddContentEntityCopyWith(
          AddContentEntity value, $Res Function(AddContentEntity) then) =
      _$AddContentEntityCopyWithImpl<$Res, AddContentEntity>;
  @useResult
  $Res call({String title, String body});
}

/// @nodoc
class _$AddContentEntityCopyWithImpl<$Res, $Val extends AddContentEntity>
    implements $AddContentEntityCopyWith<$Res> {
  _$AddContentEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddContentEntityImplCopyWith<$Res>
    implements $AddContentEntityCopyWith<$Res> {
  factory _$$AddContentEntityImplCopyWith(_$AddContentEntityImpl value,
          $Res Function(_$AddContentEntityImpl) then) =
      __$$AddContentEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String body});
}

/// @nodoc
class __$$AddContentEntityImplCopyWithImpl<$Res>
    extends _$AddContentEntityCopyWithImpl<$Res, _$AddContentEntityImpl>
    implements _$$AddContentEntityImplCopyWith<$Res> {
  __$$AddContentEntityImplCopyWithImpl(_$AddContentEntityImpl _value,
      $Res Function(_$AddContentEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_$AddContentEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddContentEntityImpl extends _AddContentEntity {
  _$AddContentEntityImpl({required this.title, required this.body}) : super._();

  factory _$AddContentEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddContentEntityImplFromJson(json);

  @override
  final String title;
  @override
  final String body;

  @override
  String toString() {
    return 'AddContentEntity(title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddContentEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, body);

  /// Create a copy of AddContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddContentEntityImplCopyWith<_$AddContentEntityImpl> get copyWith =>
      __$$AddContentEntityImplCopyWithImpl<_$AddContentEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddContentEntityImplToJson(
      this,
    );
  }
}

abstract class _AddContentEntity extends AddContentEntity {
  factory _AddContentEntity(
      {required final String title,
      required final String body}) = _$AddContentEntityImpl;
  _AddContentEntity._() : super._();

  factory _AddContentEntity.fromJson(Map<String, dynamic> json) =
      _$AddContentEntityImpl.fromJson;

  @override
  String get title;
  @override
  String get body;

  /// Create a copy of AddContentEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddContentEntityImplCopyWith<_$AddContentEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
