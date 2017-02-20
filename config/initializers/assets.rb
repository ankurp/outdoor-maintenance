# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(
  static.css
  job_postings.css
  locations.css
  job_requests.css
  users.css
  dashboards.css
  registrations.css
  devise/sessions.css
  job_postings.js
  job_requests.js
  locations.js
  static.js
  users.js
  dashboards.js
  registrations.js
  devise/sessions.js
)
