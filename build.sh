#!/bin/sh
set -ex

# Clone Dogma libraries
git clone https://github.com/dogma-dart/dogma-source-metadata.git ../dogma-source-metadata

# Get version
dart --version

# Get dependencies
pub install

# Verify that the libraries are error and warning-free.
dartanalyzer ${DARTANALYZER_FLAGS} $(ls -rt lib/*.dart)

# Run the tests
pub global activate coverage
OBSERVATORY_PORT=8000
COVERAGE_OUTPUT=coverage.json

dart --checked --observe=${OBSERVATORY_PORT} test/all.dart & \
pub global run coverage:collect_coverage \
    --port=${OBSERVATORY_PORT} \
    --out ${COVERAGE_OUTPUT} \
    --wait-paused \
    --resume-isolates & \
wait

pub global run coverage:format_coverage \
    --packages=.packages \
    --report-on lib \
    --in ${COVERAGE_OUTPUT} \
    --out lcov.info \
    --lcov
