@varbase-ai-media-base
Feature: Varbase AI Media Base on Varbase 11
  As a site administrator
  I want the recipe to set up AI media generation in the Media Library
  So that editors can generate images and SVGs where they pick media

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Generated media are saved as Image and SVG Image, with no AI media types
     When I go to "/admin/structure/media"
     Then I should see "SVG Image"
      And I should not see "Generated image with AI"
      And I should not see "Generated SVG with AI"
     When I go to "/admin/config/ai/ai-media"
     Then "select[name='generators[image][media_type]'] option[value='image'][selected]" should have a count of 1
      And "select[name='generators[svg][media_type]'] option[value='svg_image'][selected]" should have a count of 1

  Scenario: Insert Media in Full HTML allows Image and SVG Image
     When I go to "/admin/config/content/formats/manage/full_html"
     Then "input[name='filters[media_embed][settings][allowed_media_types][image]']:checked" should have a count of 1
      And "input[name='filters[media_embed][settings][allowed_media_types][svg_image]']:checked" should have a count of 1

  Scenario Outline: The editorial roles may generate media with AI
     When I go to "/admin/people/permissions/<role>"
     Then "input[name='<role>[generate media with ai]']:checked" should have a count of 1
      And "input[name='<role>[create image media]']:checked" should have a count of 1
      And "input[name='<role>[create svg_image media]']:checked" should have a count of 1

    Examples:
      | role           |
      | content_editor |
      | content_admin  |
      | site_admin     |

  Scenario: Site admins may change the AI Media settings, not the AI providers
     When I go to "/admin/people/permissions/site_admin"
     Then "input[name='site_admin[administer ai media]']:checked" should have a count of 1
      And "input[name='site_admin[administer ai]']:checked" should have a count of 0
