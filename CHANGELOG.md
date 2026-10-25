# Changelog

All notable changes to the Varbase AI Media Base recipe are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- SVG Image in Insert Media for Full HTML, so "Generate SVG with AI" sits right after it
  ([#3632433](https://www.drupal.org/i/3632433)).
### Changed
- Move the documentation to docs.varbase.vardot.com ([#3633024](https://www.drupal.org/i/3633024)).

## [1.0.0-alpha1] - 2026-10-24
### Added
- The recipe on drupal.org, with GitLab CI that validates `composer.json` and lints every YAML file
  ([#3632433](https://www.drupal.org/i/3632433)).
- A varbase-e2e suite and the `varbase-e2e-test` CI job: a fresh Varbase 11 site, the recipe applied twice,
  then the suite ([#3632433](https://www.drupal.org/i/3632433)).
### Changed
- Require AI Media 1.0.0-alpha1 (`drupal/ai_media: ^1.0@alpha`) instead of its dev branch
  ([#3632433](https://www.drupal.org/i/3632433)).
### Removed
- The `enshrined/svg-sanitize <1.0` requirement: every release in that range has security advisories, so
  Composer refused to install the recipe. AI Media requires `^1.0` itself ([#3632433](https://www.drupal.org/i/3632433)).
- The Generated document with AI media type: documents are not part of AI Media
  ([#3632433](https://www.drupal.org/i/3632433)).
- The GitHub Actions workflows and the `.github` templates: CI runs on git.drupalcode.org.

[Unreleased]: https://git.drupalcode.org/project/varbase_ai_media_base/-/compare/1.0.0-alpha1...1.0.x
[1.0.0-alpha1]: https://git.drupalcode.org/project/varbase_ai_media_base/-/tree/1.0.0-alpha1
