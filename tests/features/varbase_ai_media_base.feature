@varbase-ai-media-base
Feature: Varbase AI Media Base on Varbase 11
  As a site administrator
  I want the recipe to set up AI media generation in the Media Library
  So that editors can generate images and SVGs where they pick media

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The recipe adds the AI image and SVG media types
     When I go to "/admin/structure/media"
     Then I should see "Generated image with AI"
      And I should see "Generated SVG with AI"
      And I should not see "Generated document with AI"

  Scenario: The Featured image field offers the AI image tab right after Image
     When I go to "/node/add/page"
      And I open the "field_featured_image" media library
     Then ".media-library-menu a[data-title='Generate image with AI']" should have a count of 1
      And ".media-library-menu li:first-child a[data-title='Image']" should have a count of 1
      And ".media-library-menu li:nth-child(2) a[data-title='Generate image with AI']" should have a count of 1

  Scenario: Insert Media in Full HTML allows the AI image and SVG types, and SVG Image
     When I go to "/admin/config/content/formats/manage/full_html"
     Then "input[name='filters[media_embed][settings][allowed_media_types][image_ai_gen]']:checked" should have a count of 1
      And "input[name='filters[media_embed][settings][allowed_media_types][svg_ai_gen]']:checked" should have a count of 1
      And "input[name='filters[media_embed][settings][allowed_media_types][svg_image]']:checked" should have a count of 1

  Scenario Outline: The editorial roles may generate media with AI
     When I go to "/admin/people/permissions/<role>"
     Then "input[name='<role>[generate media with ai]']:checked" should have a count of 1
      And "input[name='<role>[create svg_ai_gen media]']:checked" should have a count of 1

    Examples:
      | role           |
      | content_editor |
      | content_admin  |
      | site_admin     |
