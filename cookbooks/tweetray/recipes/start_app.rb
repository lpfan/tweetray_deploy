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

bash 'create, activate venv and install all reqs' do
    cwd '/opt/tweetray'
    user 'rab'
    code <<-EOH
    virtualenv env -p /usr/bin/python3
    /opt/tweetray/env/bin/pip install -r reqs.txt
    EOH
end
