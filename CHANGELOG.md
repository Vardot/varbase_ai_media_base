# Changelog

All notable changes to the Varbase AI Media Base recipe are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- The recipe: installs AI Media and adds the "Generated image with AI", "Generated SVG with AI" and
  "Generated document with AI" media types with every Varbase view mode of Image, SVG image and Document. Offers the
  image type after Image on the blog and page Featured image fields, all three in Full HTML's Insert Media, and grants
  "Generate media with AI" with create/edit/delete to the editorial roles.

### Checked
- Local Varbase Starter site on Drupal 11.4.5 with AI 1.4.7, OpenAI (gpt-image-2) for images and Anthropic
  (claude-opus-5) for chat: applied twice; image and SVG generated, reviewed, saved and inserted in a real browser.
