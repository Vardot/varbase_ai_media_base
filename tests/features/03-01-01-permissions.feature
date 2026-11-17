@varbase-ai-media-base
Feature: The editorial roles may generate media with AI
  As a site administrator
  I want the roles that already add images to generate them with AI
  So that generating, which spends provider credit, stays a permission of its own

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario Outline: The <role> role may generate media with AI
     When I go to "/admin/people/permissions/<role>"
     Then the Drupal checkbox "<role>[generate media with ai]" is checked
      And the Drupal checkbox "<role>[create image media]" is checked
      And the Drupal checkbox "<role>[create svg_image media]" is checked

    Examples:
      | role           |
      | content_editor |
      | content_admin  |
      | site_admin     |

  Scenario: Site admins may change the AI Media settings, not the AI providers
     When I go to "/admin/people/permissions/site_admin"
     Then the Drupal checkbox "site_admin[administer ai media]" is checked
      And the Drupal checkbox "site_admin[administer ai]" is unchecked
