# PgDriveBackup

Simple solution to make encrypted with [ccrypt](http://ccrypt.sourceforge.net/) PostgreSQL backups and storing on [Google Drive API](https://github.com/gimite/google-drive-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pg_drive_backup'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pg_drive_backup

## Usage

### Quick start

Required database config credentials: 

`config/initializers/pg_drive_backup.rb`
```ruby
PgDriveBackup::Settings.configure do |config|
  config.database.name = 'database_name'
  config.database.user = ENV.fetch('PG_USERNAME')
  config.database.password = ENV.fetch('PG_PASSWORD')
end
```

Add your google drive [authorization](https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md) JSON file to `config/drive.json`

Generate your encryption key, for example:
```bash
openssl passwd -1 "somepassword"
```

And put it into `config/key.txt`

Run it:
```ruby
PgDriveBackup::Run.call
```

It uploads your encrypted backup with name like `20171009083306693-dump.sql.cpt`

To decrypt:
```bash
ccrypt -k config/key.txt -d 20171009083306693-dump.sql.cpt
```

### Tunning

Config options:

```ruby
PgDriveBackup::Settings.configure do |config|
  config.credentials_path = 'config/drive.json'       # default: 'config/drive.json'
  config.key_path = 'config/key.txt'                  # default: 'config/key.txt'
  config.prefix = '-dump'                             # default: '-dump'

  config.database.name = 'database_name'              # default: nil
  config.database.user = ENV.fetch('PG_USERNAME')     # default: nil
  config.database.password = ENV.fetch('PG_PASSWORD') # default: nil
  config.database.host = 'localhost'                  # default: 'localhost'
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kirillshevch/pg_drive_backup.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
