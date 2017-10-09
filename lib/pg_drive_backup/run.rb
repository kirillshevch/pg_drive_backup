module PgDriveBackup
  class Run
    def self.call
      config = Settings.config

      filename = Time.now.strftime('%Y%m%d%H%M%S%L') + config.prefix

      system("PGPASSWORD=#{config.database.password}
                pg_dump #{config.database.name} > #{filename}.sql
                -h #{config.database.host}
                -U #{config.database.user}")

      system("ccrypt -k #{config.key_path} -e #{filename}.sql")

      session = GoogleDrive::Session.from_service_account_key(config.credentials_path)

      if session.upload_from_file("#{filename}.sql.cpt")
        system("rm -r #{filename}.sql.cpt")
      end
    end
  end
end
