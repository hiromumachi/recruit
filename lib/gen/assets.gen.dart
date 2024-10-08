/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/cancel.svg
  SvgGenImage get cancel => const SvgGenImage('assets/image/cancel.svg');

  /// File path: assets/image/delete.svg
  SvgGenImage get delete => const SvgGenImage('assets/image/delete.svg');

  /// File path: assets/image/done.svg
  SvgGenImage get done => const SvgGenImage('assets/image/done.svg');

  /// File path: assets/image/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/image/edit.svg');

  /// File path: assets/image/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/image/logo.svg');

  /// File path: assets/image/plus.svg
  SvgGenImage get plus => const SvgGenImage('assets/image/plus.svg');

  /// File path: assets/image/save.svg
  SvgGenImage get save => const SvgGenImage('assets/image/save.svg');

  /// List of all assets
  List<SvgGenImage> get values => [cancel, delete, done, edit, logo, plus, save];
}

class Assets {
  Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
