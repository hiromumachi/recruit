// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_content_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PutContentEntityImpl _$$PutContentEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PutContentEntityImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$$PutContentEntityImplToJson(
        _$PutContentEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
