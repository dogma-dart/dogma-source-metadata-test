// Copyright (c) 2016, the Dogma Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

//---------------------------------------------------------------------
// Imports
//---------------------------------------------------------------------

import 'package:dogma_source_analyzer/metadata.dart';
import 'package:test/test.dart';

//---------------------------------------------------------------------
// Library contents
//---------------------------------------------------------------------

/// A matcher for [UriReferencedMetadata] instances.
const Matcher isUriReferencedMetadata =
    const isInstanceOf<UriReferencedMetadata>();

/// A matcher for references that are not prefixed.
final Matcher notPrefixed = predicate((value) {
  if (value is! UriReferencedMetadata) return true;

  return (value as UriReferencedMetadata).prefix.isEmpty;
}, 'Metadata is not prefixed');

/// A matcher for references that contain a prefix.
final Matcher isPrefixed = predicate((value) {
  if (value is! UriReferencedMetadata) return false;

  return (value as UriReferencedMetadata).prefix.isNotEmpty;
}, 'Metadata is prefixed');

/// Matches the [prefix] on [UriReferencedMetadata].
Matcher prefixedBy(String prefix) =>
    predicate((value) {
      if (value is! UriReferencedMetadata) return false;

      return (value as UriReferencedMetadata).prefix == prefix;
    }, 'Metadata is prefixed by $prefix');

/// A matcher that checks if all names in the referenced library are exposed.
final Matcher showsAllNames = predicate((value) {
  if (value is! UriReferencedMetadata) return false;

  return (value as UriReferencedMetadata).shownNames.isEmpty;
}, 'Metadata shows all names');

/// A matcher that checks if no names in the referenced library are hidden.
final Matcher hidesNoNames = predicate((value) {
  if (value is! UriReferencedMetadata) return false;

  return (value as UriReferencedMetadata).hiddenNames.isEmpty;
}, 'Metadata does not hide any names');

/// A matcher that checks if any names are explicitly shown.
final Matcher showsNames = predicate((value) {
  if (value is! UriReferencedMetadata) return false;

  return (value as UriReferencedMetadata).shownNames.isNotEmpty;
}, 'Metadata shows names');


/// A matcher that checks if any names are explicitly hidden.
final Matcher hidesNames = predicate((value) {
  if (value is! UriReferencedMetadata) return false;

  return (value as UriReferencedMetadata).hiddenNames.isNotEmpty;
}, 'Metadata hides names');

/// Matches [UriReferencedMetadata] that explicitly shows the [name].
///
/// This checks the [UriReferencedMetadata.shownNames] value to determine if
/// the [name] is contained in the list. If it is not there then false will
/// be returned.
Matcher showsName(String name) =>
    predicate((value) {
      if (value is! UriReferencedMetadata) return false;

      return (value as UriReferencedMetadata).shownNames.contains(name);
    }, 'Metadata shows metadata named $name');

/// Matches [UriReferencedMetadata] that explicitly hides the [name].
///
/// This checks the [UriReferencedMetadata.hiddenNames] value to determine if
/// the [name] is contained in the list. If it is not there then false will
/// be returned.
Matcher hidesName(String name) =>
    predicate((value) {
      if (value is! UriReferencedMetadata) return false;

      return (value as UriReferencedMetadata).hiddenNames.contains(name);
    }, 'Metadata hides metadata named $name');
