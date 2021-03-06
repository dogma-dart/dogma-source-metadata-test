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

/// A matcher for [FieldMetadata] instances.
const Matcher isFieldMetadata = const isInstanceOf<FieldMetadata>();

/// A matcher for [FieldMetadata] defined as a property.
///
///     Foo get foo() => _foo;
///     set foo(Foo value) { _foo = value; }
final Matcher isProperty = predicate((value) {
  if (value is! FieldMetadata) return false;

  return (value as FieldMetadata).isProperty;
}, 'property');

/// A matcher for [FieldMetadata] defined as a field.
///
///     Foo foo;
final Matcher isField = predicate((value) {
  if (value is! FieldMetadata) return false;

  return !(value as FieldMetadata).isProperty;
}, 'field');

/// A matcher for [FieldMetadata] that provides a getter.
final Matcher hasGetter = predicate((value) {
  if (value is! FieldMetadata) return false;

  return (value as FieldMetadata).getter;
}, 'can get value of field');

/// A matcher for [FieldMetadata] without a getter.
final Matcher noGetter = predicate((value) {
  if (value is! FieldMetadata) return false;

  return !(value as FieldMetadata).getter;
}, 'cannot get value of field');

/// A matcher for [FieldMetadata] that provides a setter.
final Matcher hasSetter = predicate((value) {
  if (value is! FieldMetadata) return false;

  return (value as FieldMetadata).setter;
}, 'can set value of field');

/// A matcher for [FieldMetadata] without a setter.
final Matcher noSetter = predicate((value) {
  if (value is! FieldMetadata) return false;

  return !(value as FieldMetadata).setter;
}, 'cannot set value of field');

/// A matcher for [FieldMetadata] that is final.
final Matcher isFinal = predicate((value) {
  if (value is! FieldMetadata) return false;

  final field = value as FieldMetadata;

  // Final field is not a property and contains no setter
  return !field.isProperty && !field.setter;
}, 'field is final');

/// A matcher for [FieldMetadata] that is not final.
final Matcher isNotFinal = predicate((value) {
  if (value is! FieldMetadata) return false;

  // A final field does not have a setter
  return (value as FieldMetadata).setter;
}, 'field is not final');

Matcher hasFields(int count) =>
    predicate((value) {
      if (value is LibraryMetadata) {
        return (value as LibraryMetadata).fields.length == count;
      } else if (value is ClassMetadata) {
        return (value as ClassMetadata).fields.length == count;
      } else {
        return false;
      }
    });

final Matcher hasNoFields =
    predicate((value) {
      if (value is LibraryMetadata) {
        return (value as LibraryMetadata).fields.isEmpty;
      } else if (value is ClassMetadata) {
        return (value as ClassMetadata).fields.isEmpty;
      } else {
        return true;
      }
    });
