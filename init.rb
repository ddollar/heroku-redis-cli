require "heroku/command/base"
require "uri"

# redis support commands
#
class Heroku::Command::Redis < Heroku::Command::Base

  REDIS_PROVIDERS = %w( OPENREDIS_URL REDISTOGO_URL )

  # redis:cli [NAME]
  #
  # open a redis cli, use config var NAME if specified
  #
  def cli
    config = api.get_config_vars(app).body
    matches = config.keys & ((args.length.zero?) ? REDIS_PROVIDERS : [args.first])

    case matches.length
      when 0 then error "No redis add-on found"
      when 1 then
        uri = URI.parse(config[matches.first])
        exec "redis-cli -h #{uri.host} -p #{uri.port} -a #{uri.password}"
      else error <<-ERROR
More than one redis add-on found, please specify one with:
heroku redis:cli
      ERROR
    end
  end

end
