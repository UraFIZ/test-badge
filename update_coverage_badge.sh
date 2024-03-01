#!/bin/bash

# Run Jest coverage
yarn test-ci

# Extract coverage percentage
COVERAGE=$(jq '.total.lines.pct' coverage/coverage-summary.json)

# Prepare the coverage text for SVG
SVG_COVERAGE_TEXT=$(printf "%.2f%%" "$COVERAGE")
SVG_TITLE_TEXT="lines: $SVG_COVERAGE_TEXT"

# Update the SVG file
# This updates the <title> tag
sed -i '' "s/<title>lines: .*<\/title>/<title>$SVG_TITLE_TEXT<\/title>/g" badges/coverage-lines.svg

# This updates the shadow text for coverage percentage
sed -i '' "s/<text aria-hidden=\"true\" x=\"775\" y=\"150\" fill=\"#010101\" fill-opacity=\".3\" transform=\"scale(.1)\" textLength=\"430\">.*<\/text>/<text aria-hidden=\"true\" x=\"775\" y=\"150\" fill=\"#010101\" fill-opacity=\".3\" transform=\"scale(.1)\" textLength=\"430\">$SVG_COVERAGE_TEXT<\/text>/g" badges/coverage-lines.svg

# This updates the main visible text for coverage percentage
sed -i '' "s/<text x=\"775\" y=\"140\" transform=\"scale(.1)\" fill=\"#fff\" textLength=\"430\">.*<\/text>/<text x=\"775\" y=\"140\" transform=\"scale(.1)\" fill=\"#fff\" textLength=\"430\">$SVG_COVERAGE_TEXT<\/text>/g" badges/coverage-lines.svg

echo "Updated SVG with coverage: $SVG_COVERAGE_TEXT"
