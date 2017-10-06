require 'spec_helper'

RSpec.describe PgDriveBackup do
  it 'has a version number' do
    expect(PgDriveBackup::VERSION).not_to be nil
  end
end
