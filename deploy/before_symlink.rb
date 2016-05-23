Chef::Log.info("Creating cron job for S3 Sync")

env = Hash["aws_access_key_id" => "#{ node[:deploy]['scripts'][:environment_variables][:aws_access_key_id]}",
				"aws_secret_access_key" => "#{ node[:deploy]['scripts'][:environment_variables][:aws_secret_access_key]}",
				"region" => "#{ node[:deploy]['scripts'][:environment_variables][:region]}"]

cron 'name_of_cron_entry' do
  minute '0'
  hour '20'
  day '*'
  month '11'
  weekday '1-5'
  environment env
  command "aws s3 sync /mnt/nfs s3://mybucket.deyan "
  action :create
end