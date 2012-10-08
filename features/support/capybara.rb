Spinach.hooks.before_scenario do
  Capybara.current_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
end