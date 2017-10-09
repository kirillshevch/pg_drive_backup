module PgDriveBackup
  class Settings
    extend ::Dry::Configurable

    setting :credentials_path, 'config/drive.json'

    setting :key_path, 'config/key.txt'

    setting :prefix, '-dump'

    setting :database do
      setting :name
      setting :user
      setting :password
      setting :host, 'localhost'
    end
  end
end
