import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_content_entity.freezed.dart';
part 'add_content_entity.g.dart';

@freezed
class AddContentEntity with _$AddContentEntity {
  const AddContentEntity._();
  factory AddContentEntity({
    required String title,
    required String body,
  }) = _AddContentEntity;

  factory AddContentEntity.fromJson(Map<String, dynamic> json) =>
      _$AddContentEntityFromJson(json);
}
