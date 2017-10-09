describe PgDriveBackup::Settings do
  subject { PgDriveBackup::Settings.config }

  context 'has default settings' do
    it { expect(subject.credentials_path).to eq('config/drive.json') }
    it { expect(subject.key_path).to eq('config/key.txt') }
    it { expect(subject.prefix).to eq('-dump') }

    it { expect(subject.database.host).to eq('localhost') }
  end

  context 'has not default database credentials' do
    it { expect(subject.database.name).to be_nil }
    it { expect(subject.database.user).to be_nil }
    it { expect(subject.database.password).to be_nil }
  end
end
