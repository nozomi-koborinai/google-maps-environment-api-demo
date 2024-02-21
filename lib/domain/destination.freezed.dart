// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'destination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Destination {
  /// 引越し先ドキュメント ID
  String get destinationId => throw _privateConstructorUsedError;

  /// 郵便番号
  String get postalCode => throw _privateConstructorUsedError;

  /// 住所詳細情報
  PostalCodeInfo get postalCodeInfo => throw _privateConstructorUsedError;

  /// 生成日時
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DestinationCopyWith<Destination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationCopyWith<$Res> {
  factory $DestinationCopyWith(
          Destination value, $Res Function(Destination) then) =
      _$DestinationCopyWithImpl<$Res, Destination>;
  @useResult
  $Res call(
      {String destinationId,
      String postalCode,
      PostalCodeInfo postalCodeInfo,
      DateTime createdAt});
}

/// @nodoc
class _$DestinationCopyWithImpl<$Res, $Val extends Destination>
    implements $DestinationCopyWith<$Res> {
  _$DestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationId = null,
    Object? postalCode = null,
    Object? postalCodeInfo = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      destinationId: null == destinationId
          ? _value.destinationId
          : destinationId // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      postalCodeInfo: null == postalCodeInfo
          ? _value.postalCodeInfo
          : postalCodeInfo // ignore: cast_nullable_to_non_nullable
              as PostalCodeInfo,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DestinationImplCopyWith<$Res>
    implements $DestinationCopyWith<$Res> {
  factory _$$DestinationImplCopyWith(
          _$DestinationImpl value, $Res Function(_$DestinationImpl) then) =
      __$$DestinationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String destinationId,
      String postalCode,
      PostalCodeInfo postalCodeInfo,
      DateTime createdAt});
}

/// @nodoc
class __$$DestinationImplCopyWithImpl<$Res>
    extends _$DestinationCopyWithImpl<$Res, _$DestinationImpl>
    implements _$$DestinationImplCopyWith<$Res> {
  __$$DestinationImplCopyWithImpl(
      _$DestinationImpl _value, $Res Function(_$DestinationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationId = null,
    Object? postalCode = null,
    Object? postalCodeInfo = null,
    Object? createdAt = null,
  }) {
    return _then(_$DestinationImpl(
      destinationId: null == destinationId
          ? _value.destinationId
          : destinationId // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      postalCodeInfo: null == postalCodeInfo
          ? _value.postalCodeInfo
          : postalCodeInfo // ignore: cast_nullable_to_non_nullable
              as PostalCodeInfo,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DestinationImpl implements _Destination {
  const _$DestinationImpl(
      {required this.destinationId,
      required this.postalCode,
      required this.postalCodeInfo,
      required this.createdAt});

  /// 引越し先ドキュメント ID
  @override
  final String destinationId;

  /// 郵便番号
  @override
  final String postalCode;

  /// 住所詳細情報
  @override
  final PostalCodeInfo postalCodeInfo;

  /// 生成日時
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Destination(destinationId: $destinationId, postalCode: $postalCode, postalCodeInfo: $postalCodeInfo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DestinationImpl &&
            (identical(other.destinationId, destinationId) ||
                other.destinationId == destinationId) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.postalCodeInfo, postalCodeInfo) ||
                other.postalCodeInfo == postalCodeInfo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, destinationId, postalCode, postalCodeInfo, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DestinationImplCopyWith<_$DestinationImpl> get copyWith =>
      __$$DestinationImplCopyWithImpl<_$DestinationImpl>(this, _$identity);
}

abstract class _Destination implements Destination {
  const factory _Destination(
      {required final String destinationId,
      required final String postalCode,
      required final PostalCodeInfo postalCodeInfo,
      required final DateTime createdAt}) = _$DestinationImpl;

  @override

  /// 引越し先ドキュメント ID
  String get destinationId;
  @override

  /// 郵便番号
  String get postalCode;
  @override

  /// 住所詳細情報
  PostalCodeInfo get postalCodeInfo;
  @override

  /// 生成日時
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DestinationImplCopyWith<_$DestinationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
