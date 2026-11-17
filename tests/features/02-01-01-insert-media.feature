@varbase-ai-media-base
Feature: Insert Media in Full HTML offers the generated media types
  As a content editor
  I want Insert Media in Full HTML to offer Image and SVG Image
  So that generated images and SVGs can go into the body text

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Insert Media in Full HTML allows Image and SVG Image
     When I go to "/admin/config/content/formats/manage/full_html"
     Then the Drupal checkbox "filters[media_embed][settings][allowed_media_types][image]" is checked
      And the Drupal checkbox "filters[media_embed][settings][allowed_media_types][svg_image]" is checked
