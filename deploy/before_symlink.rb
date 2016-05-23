Chef::Log.info("Creating cron job for S3 Sync")

env = Hash["AWS_ACCESS_KEY_ID" => "#{ node[:deploy]['scripts'][:environment_variables][:AWS_ACCESS_KEY_ID]}",
				"AWS_SECRET_ACCESS_KEY" => "#{ node[:deploy]['scripts'][:environment_variables][:AWS_SECRET_ACCESS_KEY]}",
				"REGION" => "#{ node[:deploy]['scripts'][:environment_variables][:region]}"]

cron 's3_sync' do
	hour '17'
	environment env
	command "aws s3 sync /mnt/nfs s3://mybucket.deyan"
	action :create
end