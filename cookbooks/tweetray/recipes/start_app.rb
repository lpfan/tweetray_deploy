execute 'chown /opt' do
    command 'chown rab:rab /opt'
end

git '/opt/tweetray' do
    repository 'https://github.com/lpfan/tweetray.git'
    revision 'develop'
    action :sync
    user 'rab'
    group 'rab'
end
