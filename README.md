# Varbase AI Media Base

Generate images, SVGs and documents with AI from the Media Library on a
Varbase 11 site, with the [AI Media](https://www.drupal.org/project/ai_media)
module.

## What it adds

| Media type | Generator | Offered in |
|---|---|---|
| Generated image with AI (`image_ai_gen`) | Image (`text_to_image`) | Blog and page **Featured image**, Full HTML **Insert Media** |
| Generated SVG with AI (`svg_ai_gen`) | SVG (`chat`, sanitised) | Full HTML **Insert Media** |
| Generated document with AI (`doc_ai_gen`) | Document (`chat`, as PDF, Word, Markdown or text) | Full HTML **Insert Media** |

- Each tab reads **Generate … with AI**, is marked **New**, and sits right
  after Image.
- Each type carries every Varbase view mode of its non-AI counterpart (Image,
  SVG image, Document), stores files in `ai-generated/YYYY-MM`, and is
  translatable.
- Grants **Generate media with AI** and create/edit/delete for the three types
  to content editors, content admins and site admins.
- No custom PHP or shell code in the recipe; the code is in AI Media.

## Requirements

- Varbase 11 (Drupal ^11.4), `svg_image`.
- AI Media (`drupal/ai_media`), which has no release yet: its `1.0.x-dev`.
- Default AI providers: **text_to_image** for images, **chat** for SVGs and
  documents (`varbase_ai_base` and an OpenAI or Anthropic key give them).

## Install

```bash
ddev composer require drupal/varbase_ai_media_base:1.0.x-dev
ddev drush recipe ../recipes/varbase_ai_media_base
ddev drush cr
```

Safe to apply twice.

## Known limits

- Video needs a provider with **image_to_video**; none of OpenAI, Anthropic or
  amazee.io offers it yet, so no video type is added here.
- PDF output does not join Arabic letters; use Word for right-to-left
  languages.
