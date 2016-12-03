// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_metadata/metadata.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// Function for checking if the [actual] and [expected] values are equal.
typedef bool AnnotationEqual<T>(dynamic actual, T expected);

/// Determine if the metadata has any annotations.
Matcher isAnnotated = predicate((value) {
  if (value is! Annotated) return false;

  return (value as Annotated).annotations.isNotEmpty;
});

/// Determine if the metadata does not contain any annotations.
Matcher notAnnotated = predicate((value) {
  if (value is! Annotated) return true;

  return (value as Annotated).annotations.isEmpty;
});

/// Determines if the metadata annotations is the expected [length].
Matcher hasAnnotations(int length) =>
    predicate((value) {
      if (value is! Annotated) return false;

      return (value as Annotated).annotations.length == length;
    });

/// Uses the [equal] function to determine if an annotation is present on the
/// metadata.
///
/// A [description] can added if necessary which will give information on what
/// is being checked for.
Matcher hasAnnotation<T>(AnnotationEqual<T> equal,
                         T expected,
                        [String description]) =>
    predicate(
        (value) => _hasAnnotation<T>(value, expected, equal),
        description ?? 'has annotation'
    );

/// Uses the [equal] function to determine if an annotation is not present on
/// the metadata.
///
/// A [description] can added if necessary which will give information on what
/// is being checked for.
Matcher missingAnnotation<T>(AnnotationEqual<T> equal,
                             T expected,
                            [String description]) =>
    predicate(
        (value) => !_hasAnnotation<T>(value, expected, equal),
        description ?? 'missing annotation'
    );

/// Determine if the [expected] annotation is present on metadata.
///
/// This function can be used directly when an annotation contains an equality
/// operator or when there is a single instance of an annotation such as
/// `override`. Otherwise use [hasAnnotation] and provide a comparison
/// function.
///
/// A [description] can added if necessary which will give information on what
/// is being checked for.
Matcher annotatedWith<T>(T expected, [String description]) =>
    hasAnnotation<T>(
        _isEqual,
        expected,
        description ?? 'has annotation $expected',
    );

/// Determine if the [expected] annotation is not present on metadata.
///
/// This function can be used directly when an annotation contains an equality
/// operator or when there is a single instance of an annotation such as
/// `override`. Otherwise use [missingAnnotation] and provide a comparison
/// function.
///
/// A [description] can added if necessary which will give information on what
/// is being checked for.
Matcher notAnnotatedWith<T>(T expected, [String description]) =>
    missingAnnotation<T>(
        _isEqual,
        expected,
        description ?? 'missing annotation $expected'
    );

/// Simple equality test of [actual] and [expected].
bool _isEqual<T>(T actual, T expected) =>
    actual == expected;

/// Determines if the [annotated] metadata contain the [expected] value which
/// is verified through the [equal] function.
bool _hasAnnotation<T>(dynamic annotated,
                       T expected,
                       AnnotationEqual<T> equal) {
  if (annotated is! Annotated) return false;

  bool check(dynamic value) => equal(value, expected);

  return annotated.annotations.firstWhere(check, orElse: () => null) != null;
}
