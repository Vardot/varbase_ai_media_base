# Changelog

All notable changes to the Varbase AI Media Base recipe are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Changed
- Back to dev: require AI Media 1.0.x-dev (`drupal/ai_media: 1.0.x-dev`) on the 1.0.x branch
  ([#3638779](https://www.drupal.org/i/3638779)).

## [1.0.0-rc3] - 2026-11-17
### Changed
- Require AI Media 1.0.0-rc3 or later (`drupal/ai_media: ^1.0.0-rc3`)
  ([#3638779](https://www.drupal.org/i/3638779)).
- The description says Generate with AI is a switch inside the Image and SVG Image tabs,
  as AI Media places it since 1.0.0-alpha3, not separate tabs ([#3638776](https://www.drupal.org/i/3638776)).

## [1.0.0-rc2] - 2026-11-14
### Changed
- Require AI Media 1.0.0-rc2 or later (`drupal/ai_media: ^1.0.0-rc2`)
  ([#3638185](https://www.drupal.org/i/3638185)).
- Update Node.js to >= 24.0 for the test suite and CI ([#3635710](https://www.drupal.org/i/3635710)).

## [1.0.0-rc1] - 2026-11-05
### Changed
- Require AI Media 1.0.0-rc1 or later (`drupal/ai_media: ^1.0.0-rc1`): the name and alternative text
  are written in the language of the description, the review panel names the model, and the release
  carries accessibility, security and Media Library dialog fixes ([#3635606](https://www.drupal.org/i/3635606)).
- Grant `administer ai media` to the Site admin role, so site admins can run the AI Media settings
  ([#3634877](https://www.drupal.org/i/3634877)).

## [1.0.0-beta1] - 2026-10-29
### Changed
- Require AI Media 1.0.0-beta1 or later (`drupal/ai_media: ^1.0.0-beta1`): Generate with AI sits
  inside each media type's tab as an "Upload | Generate with AI" switch, examples and the AI
  disclosure are in tooltips, the name and alt text of a generated image are written by AI from the
  image, and Focal Point works on a generated image ([#3633992](https://www.drupal.org/i/3633992)).
- Disable telemetry in CI (`DRUPAL_CMS_TELEMETRY=0`) ([#3633857](https://www.drupal.org/i/3633857)).
### Added
- A Claude Code agent and skill for applying and verifying Varbase AI Media
  ([#3633782](https://www.drupal.org/i/3633782)).

## [1.0.0-alpha3] - 2026-10-28
### Changed
- Require AI Media 1.0.0-alpha3 or later (`drupal/ai_media: ^1.0.0-alpha3`)
  ([#3633673](https://www.drupal.org/i/3633673)).

## [1.0.0-alpha2] - 2026-10-25
### Changed
- Generated images are saved as Image media and generated SVGs as SVG Image, with the AI tabs right
  after them; the recipe no longer adds its own media types. Requires AI Media 1.0.0-alpha2 or later.
  Sites on 1.0.0-alpha1: delete the "Generated image with AI" and "Generated SVG with AI" media types
  first, and on a Canvas site clear them from the Canvas component prop expressions before `drush cr`
  ([#3633062](https://www.drupal.org/i/3633062)).
- Move the documentation to docs.varbase.vardot.com ([#3633024](https://www.drupal.org/i/3633024)).
### Added
- SVG Image in Insert Media for Full HTML, so "Generate SVG with AI" sits right after it
  ([#3632433](https://www.drupal.org/i/3632433)).
### Removed
- The `image_ai_gen` and `svg_ai_gen` media types and their fields and displays
  ([#3633062](https://www.drupal.org/i/3633062)).

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

[Unreleased]: https://git.drupalcode.org/project/varbase_ai_media_base/-/compare/1.0.0-rc3...1.0.x
[1.0.0-rc3]: https://git.drupalcode.org/project/varbase_ai_media_base/-/tree/1.0.0-rc3
[1.0.0-rc2]: https://git.drupalcode.org/project/varbase_ai_media_base/-/tree/1.0.0-rc2
[1.0.0-rc1]: https://git.drupalcode.org/project/varbase_ai_media_base/-/tree/1.0.0-rc1
[1.0.0-beta1]: https://git.drupalcode.org/project/varbase_ai_media_base/-/tree/1.0.0-beta1
[1.0.0-alpha3]: https://git.drupalcode.org/project/varbase_ai_media_base/-/tree/1.0.0-alpha3
[1.0.0-alpha2]: https://git.drupalcode.org/project/varbase_ai_media_base/-/tree/1.0.0-alpha2
[1.0.0-alpha1]: https://git.drupalcode.org/project/varbase_ai_media_base/-/tree/1.0.0-alpha1
