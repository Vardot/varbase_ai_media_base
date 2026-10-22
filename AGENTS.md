# AGENTS.md

Guidance for AI coding agents working on the Varbase AI Media Base recipe.

This is a **private** recipe on GitHub (`Vardot/varbase_ai_media_base`), not a drupal.org project.
Issues, pull requests and CI all live on GitHub.

## Before you start

- **`README.md`**: what the recipe adds, what it needs, and the known limits.
- **`CHANGELOG.md`**: what changed in each release, and where it was checked.
- The module it configures: AI Media (`Vardot/ai_media`, to be released as drupal.org/project/ai_media).

## When you make a change

- One issue and one pull request per change. The PR says `Closes #<issue>` and ends with the Checkpoints list from
  `.github/pull_request_template.md`.
- Add an entry under `## [Unreleased]` in `CHANGELOG.md`.
- No PHP in the repository: no `.php`, `.module`, `.install` or `.inc` file. Behaviour belongs in AI Media.
- The `image_ai_gen`, `svg_ai_gen` and `doc_ai_gen` view and form displays are copies of the Varbase `image`,
  `svg_image` and `document` displays; when those change, copy them again rather than editing by hand.
- Config actions that set a whole value (`setSettings`, `setFilterConfig`, `setComponent`) must carry the existing
  values with them.
- Never bump the version or tag a release without explicit maintainer approval. Tags are three-segment (`1.0.0`)
  and are never moved once pushed.
