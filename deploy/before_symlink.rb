Chef::Log.info("Creating cron job for S3 Sync")

env = Hash["AWS_ACCESS_KEY_ID" => "#{ node[:deploy]['scripts'][:environment_variables][:AWS_ACCESS_KEY_ID]}",
				"AWS_SECRET_ACCESS_KEY" => "#{ node[:deploy]['scripts'][:environment_variables][:AWS_SECRET_ACCESS_KEY]}",
				"REGION" => "#{ node[:deploy]['scripts'][:environment_variables][:region]}"]

cron 'name_of_cron_entry' do
	user 'deply'
	minute '30'
	hour '*'
	day '*'
	month '*'
	weekday '*'
	environment env
	command "aws s3 sync /mnt/nfs s3://mybucket.deyan"
	action :create
end