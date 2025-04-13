part of 'theme.dart';

abstract class _Theme<T extends Object?> {
  final T? primary;
  final T? secondary;
  final T? tertiary;
  final T? error;
  final T? warning;
  final T? disable;
  final T? light;
  final T? lightAsFixed;
  final T? dark;
  final T? darkAsFixed;
  final T? mid;
  final T? holo;
  final T? soft;
  final T? deep;
  final T? optional;

  const _Theme({
    this.primary,
    this.secondary,
    this.tertiary,
    this.error,
    this.warning,
    this.disable,
    this.light,
    this.lightAsFixed,
    this.dark,
    this.darkAsFixed,
    this.mid,
    this.holo,
    this.soft,
    this.deep,
    this.optional,
  });

  _Theme<T> copy({
    final T? primary,
    final T? secondary,
    final T? tertiary,
    final T? error,
    final T? warning,
    final T? disable,
    final T? light,
    final T? lightAsFixed,
    final T? dark,
    final T? darkAsFixed,
    final T? mid,
    final T? holo,
    final T? soft,
    final T? deep,
    final T? optional,
  });

  _Theme<T> defaults({
    final T? primary,
    final T? secondary,
    final T? tertiary,
    final T? error,
    final T? warning,
    final T? disable,
    final T? light,
    final T? lightAsFixed,
    final T? dark,
    final T? darkAsFixed,
    final T? mid,
    final T? holo,
    final T? soft,
    final T? deep,
    final T? optional,
  });

  Object? _stringify(T? value);

  Map<String, dynamic>? toMap() {
    final x = {
      "primary": _stringify(primary),
      "secondary": _stringify(secondary),
      "tertiary": _stringify(tertiary),
      "error": _stringify(error),
      "warning": _stringify(warning),
      "disable": _stringify(disable),
      "light": _stringify(light),
      "lightAsFixed": _stringify(lightAsFixed),
      "dark": _stringify(dark),
      "darkAsFixed": _stringify(darkAsFixed),
      "mid": _stringify(mid),
      "holo": _stringify(holo),
      "soft": _stringify(soft),
      "deep": _stringify(deep),
      "optional": _stringify(optional),
    };
    final y = x.entries.where((e) {
      if (e.value == null) return false;
      return true;
    });
    if (y.isEmpty) return null;
    return Map.fromEntries(y);
  }
}

class ThemeColors extends _Theme<Color> {
  const ThemeColors({
    super.primary,
    super.secondary,
    super.tertiary,
    super.error,
    super.warning,
    super.disable,
    super.light,
    super.lightAsFixed,
    super.dark,
    super.darkAsFixed,
    super.mid,
    super.holo,
    super.soft,
    super.deep,
    super.optional,
  });

  factory ThemeColors.of(String name, bool isDarkMode) {
    final x = ColorTheme._i?._colors[name]?.detect(isDarkMode);
    if (x != null) return x;
    return const ThemeColors();
  }

  factory ThemeColors.baseOf(bool isDarkMode, ThemeData theme) {
    final x = _kDefault.detect(isDarkMode);
    return ThemeColors.of(_kBase, isDarkMode).defaults(
      primary: theme.colorScheme.primary,
      secondary: theme.colorScheme.secondary,
      tertiary: theme.colorScheme.tertiary,
      light: x.light,
      dark: x.dark,
      mid: x.mid,
      optional: x.optional,
      error: x.error,
    );
  }

  factory ThemeColors.parse(Object? source) {
    if (source is! Map) return ThemeColors();
    try {
      final primary = source['primary'];
      final secondary = source['secondary'];
      final tertiary = source['tertiary'];
      final error = source['error'];
      final warning = source['warning'];
      final disable = source['disable'];
      final light = source['light'];
      final lightAsFixed = source['lightAsFixed'] ?? source['light_as_fixed'];
      final dark = source['dark'];
      final darkAsFixed = source['darkAsFixed'] ?? source['dark_as_fixed'];
      final mid = source['mid'];
      final holo = source['holo'];
      final soft = source['soft'];
      final deep = source['deep'];
      final optional = source['optional'];
      return ThemeColors(
        primary: primary is Object ? primary.color : null,
        secondary: secondary is Object ? secondary.color : null,
        tertiary: tertiary is Object ? tertiary.color : null,
        error: error is Object ? error.color : null,
        warning: warning is Object ? warning.color : null,
        disable: disable is Object ? disable.color : null,
        light: light is Object ? light.color : null,
        lightAsFixed: lightAsFixed is Object ? lightAsFixed.color : null,
        dark: dark is Object ? dark.color : null,
        darkAsFixed: darkAsFixed is Object ? darkAsFixed.color : null,
        mid: mid is Object ? mid.color : null,
        holo: holo is Object ? holo.color : null,
        soft: soft is Object ? soft.color : null,
        deep: deep is Object ? deep.color : null,
        optional: optional is Object ? optional.color : null,
      );
    } catch (_) {
      return ThemeColors();
    }
  }

  @override
  ThemeColors copy({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? warning,
    Color? disable,
    Color? light,
    Color? lightAsFixed,
    Color? dark,
    Color? darkAsFixed,
    Color? mid,
    Color? holo,
    Color? soft,
    Color? deep,
    Color? optional,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      disable: disable ?? this.disable,
      light: light ?? this.light,
      lightAsFixed: lightAsFixed ?? this.lightAsFixed,
      dark: dark ?? this.dark,
      darkAsFixed: darkAsFixed ?? this.darkAsFixed,
      mid: mid ?? this.mid,
      holo: holo ?? this.holo,
      soft: soft ?? this.soft,
      deep: deep ?? this.deep,
      optional: optional ?? this.optional,
    );
  }

  @override
  ThemeColors defaults({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? warning,
    Color? disable,
    Color? light,
    Color? lightAsFixed,
    Color? dark,
    Color? darkAsFixed,
    Color? mid,
    Color? holo,
    Color? soft,
    Color? deep,
    Color? optional,
  }) {
    return ThemeColors(
      primary: this.primary ?? primary,
      secondary: this.secondary ?? secondary,
      tertiary: this.tertiary ?? tertiary,
      error: this.error ?? error,
      warning: this.warning ?? warning,
      disable: this.disable ?? disable,
      light: this.light ?? light,
      lightAsFixed: this.lightAsFixed ?? lightAsFixed,
      dark: this.dark ?? dark,
      darkAsFixed: this.darkAsFixed ?? darkAsFixed,
      mid: this.mid ?? mid,
      holo: this.holo ?? holo,
      soft: this.soft ?? soft,
      deep: this.deep ?? deep,
      optional: this.optional ?? optional,
    );
  }

  @override
  Object? _stringify(Color? value) {
    if (value == null) return null;
    try {
      return value.toARGB32().toRadixString(16);
    } catch (_) {
      return null;
    }
  }

  @override
  String toString() {
    return '$ThemeColors(primary: $primary, secondary: $secondary, tertiary: $tertiary, error: $error, warning: $warning, disable: $disable, light: $light, lightAsFixed: $lightAsFixed, dark: $dark, darkAsFixed: $darkAsFixed, mid: $mid, holo: $holo, soft: $soft, deep: $deep, optional: $optional)';
  }
}

class ThemeGradients extends _Theme<Gradient> {
  const ThemeGradients({
    super.primary,
    super.secondary,
    super.tertiary,
    super.error,
    super.warning,
    super.disable,
    super.light,
    super.lightAsFixed,
    super.dark,
    super.darkAsFixed,
    super.mid,
    super.holo,
    super.soft,
    super.deep,
    super.optional,
  });

  factory ThemeGradients.of(String name, bool isDarkMode) {
    final x = ColorTheme._i?._gradients[name]?.detect(isDarkMode);
    if (x != null) return x;
    return const ThemeGradients();
  }

  factory ThemeGradients.parse(Object? source) {
    if (source is String) source = jsonDecode(source);
    if (source is! Map) return ThemeGradients();
    try {
      final primary = source['primary'];
      final secondary = source['secondary'];
      final tertiary = source['tertiary'];
      final error = source['error'];
      final warning = source['warning'];
      final disable = source['disable'];
      final light = source['light'];
      final lightAsFixed = source['lightAsFixed'] ?? source['light_as_fixed'];
      final dark = source['dark'];
      final darkAsFixed = source['darkAsFixed'] ?? source['dark_as_fixed'];
      final mid = source['mid'];
      final holo = source['holo'];
      final soft = source['soft'];
      final deep = source['deep'];
      final optional = source['optional'];
      return ThemeGradients(
        primary: primary is Map ? primary.gradient : null,
        secondary: secondary is Map ? secondary.gradient : null,
        tertiary: tertiary is Map ? tertiary.gradient : null,
        error: error is Map ? error.gradient : null,
        warning: warning is Map ? warning.gradient : null,
        disable: disable is Map ? disable.gradient : null,
        light: light is Map ? light.gradient : null,
        lightAsFixed: lightAsFixed is Map ? lightAsFixed.gradient : null,
        dark: dark is Map ? dark.gradient : null,
        darkAsFixed: darkAsFixed is Map ? darkAsFixed.gradient : null,
        mid: mid is Map ? mid.gradient : null,
        holo: holo is Map ? holo.gradient : null,
        soft: soft is Map ? soft.gradient : null,
        deep: deep is Map ? deep.gradient : null,
        optional: optional is Map ? optional.gradient : null,
      );
    } catch (_) {
      return ThemeGradients();
    }
  }

  @override
  ThemeGradients copy({
    Gradient? primary,
    Gradient? secondary,
    Gradient? tertiary,
    Gradient? error,
    Gradient? warning,
    Gradient? disable,
    Gradient? light,
    Gradient? lightAsFixed,
    Gradient? dark,
    Gradient? darkAsFixed,
    Gradient? mid,
    Gradient? holo,
    Gradient? soft,
    Gradient? deep,
    Gradient? optional,
  }) {
    return ThemeGradients(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      disable: disable ?? this.disable,
      light: light ?? this.light,
      lightAsFixed: lightAsFixed ?? this.lightAsFixed,
      dark: dark ?? this.dark,
      darkAsFixed: darkAsFixed ?? this.darkAsFixed,
      mid: mid ?? this.mid,
      holo: holo ?? this.holo,
      soft: soft ?? this.soft,
      deep: deep ?? this.deep,
      optional: optional ?? this.optional,
    );
  }

  @override
  ThemeGradients defaults({
    Gradient? primary,
    Gradient? secondary,
    Gradient? tertiary,
    Gradient? error,
    Gradient? warning,
    Gradient? disable,
    Gradient? light,
    Gradient? lightAsFixed,
    Gradient? dark,
    Gradient? darkAsFixed,
    Gradient? mid,
    Gradient? holo,
    Gradient? soft,
    Gradient? deep,
    Gradient? optional,
  }) {
    return ThemeGradients(
      primary: this.primary ?? primary,
      secondary: this.secondary ?? secondary,
      tertiary: this.tertiary ?? tertiary,
      error: this.error ?? error,
      warning: this.warning ?? warning,
      disable: this.disable ?? disable,
      light: this.light ?? light,
      lightAsFixed: this.lightAsFixed ?? lightAsFixed,
      dark: this.dark ?? dark,
      darkAsFixed: this.darkAsFixed ?? darkAsFixed,
      mid: this.mid ?? mid,
      holo: this.holo ?? holo,
      soft: this.soft ?? soft,
      deep: this.deep ?? deep,
      optional: this.optional ?? optional,
    );
  }

  Map<String, dynamic>? _stringifyAlignment(
    AlignmentGeometry? value,
    AlignmentGeometry? optional,
  ) {
    if (value == optional || value is! Alignment) return null;
    return {'x': value.x, 'y': value.y};
  }

  Map<String, dynamic>? _stringifyTransform(GradientTransform? value) {
    if (value == null) return null;
    if (value is GradientRotation) {
      return {
        'type': 'rotation',
        'radians': value.radians,
      };
    }
    return null;
  }

  @override
  Map<String, dynamic>? _stringify(Gradient? value) {
    if (value == null || value.colors.isEmpty) return null;
    final colors = value.colors.map((c) => c.code).whereType<String>().toList();
    if (colors.length < 2) return null;

    final transform = _stringifyTransform(value.transform);

    final base = {
      'colors': colors,
      if (value.stops?.isNotEmpty ?? false) 'stops': value.stops,
      if (transform?.isNotEmpty ?? false) 'transform': transform,
    };

    if (value is LinearGradient) {
      final begin = _stringifyAlignment(value.begin, Alignment.centerLeft);
      final end = _stringifyAlignment(value.end, Alignment.centerRight);
      return {
        ...base,
        'type': 'linear',
        if (begin?.isNotEmpty ?? false) 'begin': begin,
        if (end?.isNotEmpty ?? false) 'end': end,
        if (value.tileMode != TileMode.clamp) 'tileMode': value.tileMode.name,
      };
    } else if (value is RadialGradient) {
      final center = _stringifyAlignment(value.center, Alignment.center);
      final focal = _stringifyAlignment(value.focal, null);
      return {
        ...base,
        'type': 'radial',
        if (value.radius > 0 && value.radius != 0.5) 'radius': value.radius,
        if (center?.isNotEmpty ?? false) 'center': center,
        if (focal?.isNotEmpty ?? false) 'focal': focal,
        if (value.focalRadius > 0) 'focalRadius': value.focalRadius,
        if (value.tileMode != TileMode.clamp) 'tileMode': value.tileMode.name,
      };
    } else if (value is SweepGradient) {
      final center = _stringifyAlignment(value.center, Alignment.center);
      return {
        ...base,
        'type': 'sweep',
        if (center?.isNotEmpty ?? false) 'center': center,
        if (value.startAngle > 0) 'startAngle': value.startAngle,
        if (value.endAngle > 0 && value.endAngle != pi * 2)
          'endAngle': value.endAngle,
        if (value.tileMode != TileMode.clamp) 'tileMode': value.tileMode.name,
      };
    }

    return null;
  }

  @override
  String toString() {
    return '$ThemeGradients(primary: $primary, secondary: $secondary, tertiary: $tertiary, error: $error, warning: $warning, disable: $disable, light: $light, lightAsFixed: $lightAsFixed, dark: $dark, darkAsFixed: $darkAsFixed, mid: $mid, holo: $holo, soft: $soft, deep: $deep, optional: $optional)';
  }
}

extension GradientParser on Map {
  Gradient? get gradient {
    final source = this;
    if (source.isEmpty) return null;
    final type = source['type'].toString().toLowerCase();
    final colors = source['colors'];
    final parsedColors = colors is List
        ? colors
            .map((e) => e is Object ? e.color : null)
            .whereType<Color>()
            .toList()
        : <Color>[];
    if (parsedColors.isEmpty) return null;

    final stops = source["stops"];
    final parsedStops = stops is List
        ? stops
            .map((e) => e is num ? e.toDouble() : null)
            .whereType<double>()
            .toList()
        : <double>[];

    if (parsedStops.isNotEmpty && parsedStops.length != parsedColors.length) {
      parsedStops.clear();
    }

    final tileMode =
        source['tileMode'] ?? source['tile_mode'] ?? source['mode'];
    final parsedTileMode = tileMode is String
        ? tileMode.tileMode ?? TileMode.clamp
        : TileMode.clamp;

    final transform = source['transform'];
    final parsedTransform = transform is Map ? transform.transform : null;

    if (type == 'linear') {
      final begin = source['begin'];
      final end = source['end'];
      final parsedBegin = begin is Map ? begin.alignment : null;
      final parsedEnd = end is Map ? end.alignment : null;
      return LinearGradient(
        colors: parsedColors,
        stops: parsedStops.isEmpty ? null : parsedStops,
        begin: parsedBegin ?? Alignment.centerLeft,
        end: parsedEnd ?? Alignment.centerRight,
        tileMode: parsedTileMode,
        transform: parsedTransform,
      );
    } else if (type == 'radial') {
      final center = source['center'];
      final radius = source['radius'];
      final focal = source['focal'];
      final focalRadius = source['focalRadius'] ?? source["focal_radius"];
      final parsedCenter = center is Map ? center.alignment : null;
      final parsedFocal = focal is Map ? focal.alignment : null;
      return RadialGradient(
        center: parsedCenter ?? Alignment.center,
        radius: radius is num ? radius.toDouble() : 0.5,
        colors: parsedColors,
        stops: parsedStops,
        tileMode: parsedTileMode,
        focal: parsedFocal,
        focalRadius: focalRadius is num ? focalRadius.toDouble() : 0,
        transform: parsedTransform,
      );
    } else if (type == 'sweep') {
      final center = source['center'];
      final startAngle = source['startAngle'] ?? source['start_angle'];
      final endAngle = source['endAngle'] ?? source['end_angle'];
      final parsedCenter = center is Map ? center.alignment : null;
      return SweepGradient(
        center: parsedCenter ?? Alignment.center,
        startAngle: startAngle is num ? startAngle.toDouble() : 0,
        endAngle: endAngle is num ? endAngle.toDouble() : pi * 2,
        colors: parsedColors,
        stops: parsedStops,
        tileMode: parsedTileMode,
        transform: parsedTransform,
      );
    }
    return null;
  }

  Alignment? get alignment {
    final source = this;
    if (source.isEmpty) return null;

    final x = source['x'];
    double? parsedX;
    if (x is num) parsedX = x.toDouble();
    if (x is String) parsedX = double.tryParse(x);
    if (parsedX == null) return null;

    final y = source['y'];
    double? parsedY;
    if (y is num) parsedY = y.toDouble();
    if (y is String) parsedY = double.tryParse(y);
    if (parsedY == null) return null;

    return Alignment(parsedX, parsedY);
  }

  GradientTransform? get transform {
    final source = this;
    if (source.isEmpty) return null;
    final type = source['type'].toString().toLowerCase();
    if (type == 'rotation') {
      final radians = source['radians'];
      if (radians is! num) return null;
      return GradientRotation(radians.toDouble());
    }
    return null;
  }
}

extension TileModeParser on String {
  TileMode? get tileMode {
    if (isEmpty) return null;
    final x = TileMode.values.where((e) {
      final source = toLowerCase();
      if (e.toString().toLowerCase() == source) return true;
      if (e.index.toString() == source) return true;
      if (e.name.toLowerCase() == source) return true;
      return false;
    }).firstOrNull;
    return x;
  }
}
