import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recruitfrontend/model/extension/datetime_converter.dart';

part 'content_entity.freezed.dart';
part 'content_entity.g.dart';

@freezed
class ContentEntity with _$ContentEntity {
  const ContentEntity._();
  factory ContentEntity({
    required int id,
    required String title,
    required String body,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeConverter() required DateTime updatedAt,
  }) = _ContentEntity;

  factory ContentEntity.fromJson(Map<String, dynamic> json) =>
      _$ContentEntityFromJson(json);
}
