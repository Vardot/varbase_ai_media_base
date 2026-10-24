# AGENTS.md

Guidance for AI coding agents working on the Varbase AI Media Base recipe.

This is a drupal.org project: [drupal.org/project/varbase_ai_media_base](https://www.drupal.org/project/varbase_ai_media_base).
Issues live in its [issue queue](https://www.drupal.org/project/issues/varbase_ai_media_base) and merge requests on
[git.drupalcode.org](https://git.drupalcode.org/project/varbase_ai_media_base). Its default branch is `1.0.x`; the
GitHub repository is a mirror and takes no issues or pull requests.

## Before you start

- **`README.md`**: what the recipe adds, what it needs, and the known limits.
- **`CHANGELOG.md`**: what changed in each release, and where it was checked.
- The module it configures: AI Media (`Vardot/ai_media`, to be released as drupal.org/project/ai_media).

## When you make a change

- One drupal.org issue and one issue-fork merge request per change, titled `<type>: #<issue> Summary`. The MR
  description ends with the Checkpoints list from `.gitlab/merge_request_templates/default.md`.
- CI must be green before merging: `.gitlab-ci.yml` on git.drupalcode.org validates `composer.json`, lints
  every YAML file, and `varbase-e2e-test` applies the recipe twice on Varbase 11 and runs `tests/features`.
- Add an entry under `## [Unreleased]` in `CHANGELOG.md`.
- No PHP in the repository: no `.php`, `.module`, `.install` or `.inc` file. Behaviour belongs in AI Media.
- The `image_ai_gen` and `svg_ai_gen` view and form displays are copies of the Varbase `image` and
  `svg_image` displays; when those change, copy them again rather than editing by hand.
- Config actions that set a whole value (`setSettings`, `setFilterConfig`, `setComponent`) must carry the existing
  values with them.
- Never bump the version or tag a release without explicit maintainer approval. Tags are three-segment (`1.0.0`)
  and are never moved once pushed.
