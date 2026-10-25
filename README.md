# Varbase AI Media Base

Generate images and SVGs with AI from the Media Library on a
Varbase 11 site, with the [AI Media](https://www.drupal.org/project/ai_media)
module.

## Documentation

Read the [Varbase AI Media Base documentation](https://docs.varbase.vardot.com/developers/understanding-varbase/varbase-ai-recipes/varbase-ai-media-base) on the Varbase docs site.

## Install

```bash
ddev composer require drupal/varbase_ai_media_base:~1
ddev drush recipe ../recipes/varbase_ai_media_base
ddev drush cr
```

Safe to apply twice.

## Tests

A [varbase-e2e](https://www.npmjs.com/package/@vardot/varbase-e2e) suite in
`tests/features` checks a Varbase 11 site with the recipe applied: the media
types, the AI tab on the Featured image field, Insert Media in Full HTML and
the editorial permissions. CI builds that site, applies the recipe twice and
runs it (`varbase-e2e-test`). Locally:

```bash
npm install
LAUNCH_URL=https://your-site.ddev.site npm test
```
