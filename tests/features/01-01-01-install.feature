@varbase-ai-media-base
Feature: Varbase AI Media Base sets up AI Media on Varbase 11
  As a site administrator
  I want the recipe to set up AI media generation in the Media Library
  So that editors can generate images and SVGs where they pick media

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The recipe installs AI, SVG Image and AI Media
     When I go to "/admin/modules"
     Then the Drupal checkbox "modules[ai][enable]" is checked
      And the Drupal checkbox "modules[svg_image][enable]" is checked
      And the Drupal checkbox "modules[ai_media][enable]" is checked

  Scenario: Generated media are saved as Image and SVG Image, with no AI media types
     When I go to "/admin/structure/media"
     Then I should see "SVG Image"
      And I should not see "Generated image with AI"
      And I should not see "Generated SVG with AI"
     When I go to "/admin/config/ai/ai-media"
     Then "select[name='generators[image][media_type]'] option[value='image'][selected]" should have a count of 1
      And "select[name='generators[svg][media_type]'] option[value='svg_image'][selected]" should have a count of 1

  # CI sets no AI provider, so the switch itself is not shown there; the
  # setting that places it is.
  Scenario: Generate with AI is a switch inside the Image and SVG Image tabs
     When I go to "/admin/config/ai/ai-media"
     Then "input[name='tab_position'][value='inside']:checked" should have a count of 1
