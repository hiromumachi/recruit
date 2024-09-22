import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_content_entity.freezed.dart';
part 'put_content_entity.g.dart';

@freezed
class PutContentEntity with _$PutContentEntity {
  const PutContentEntity._();
  factory PutContentEntity({
    required int id,
    required String title,
    required String body,
  }) = _PutContentEntity;

  factory PutContentEntity.fromJson(Map<String, dynamic> json) =>
      _$PutContentEntityFromJson(json);
}
