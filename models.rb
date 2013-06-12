db = URI.parse(ENV['DATABASE_URL'])
ActiveRecord::Base.establish_connection(
  adapter: db.scheme == 'postgres' ? 'postgresql' : db.schema,
  host: db.host,
  username: db.user,
  password: db.password,
  database: db.path[1..-1],
  encoding: 'utf8'
)


class Deployment < ActiveRecord::Base
end
