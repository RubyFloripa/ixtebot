Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = ENV['ROBOT_NAME']

  # The locale code for the language to use.
  config.robot.locale = (ENV['LITA_LOCALE'] || :en).to_sym

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = (ENV['LOGLEVEL'] || :info).to_sym

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  config.robot.admins = ENV['ROBOT_ADMINS'].split(',') if ENV['ROBOT_ADMINS']

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = ENV['LITA_ADAPTER'].to_sym

  # Define port for heroku
  config.http.port = ENV['PORT']

  if (ENV['LITA_ADAPTER'].to_sym == :slack)
    ## Slack adapter options:
    config.adapters.slack.token = ENV['SLACK_TOKEN']
  end

  ## Redis connection credentials:
  config.redis[:url] = ENV['REDISCLOUD_URL']
end
