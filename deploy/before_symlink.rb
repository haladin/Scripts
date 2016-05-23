Chef::Log.info("Creating cron job for S3 Sync")
env = Hash["AWS_ACCESS_KEY_ID" => "#{ node[:deploy]['scripts'][:environment_variables][:AWS_ACCESS_KEY_ID]}", "AWS_SECRET_ACCESS_KEY" => "#{ node[:deploy]['scripts'][:environment_variables][:AWS_SECRET_ACCESS_KEY]}", "REGION" => "#{ node[:deploy]['scripts'][:environment_variables][:REGION]}"]

cron 'S3_sync' do
	user'ec2-user'
	minute '15'
	hour '18'
	day '*'
	month '*'
	weekday '*'
	environment env
	command "aws s3 sync /srv/nfs/export s3://mybucket.deyan "
	action :create
end