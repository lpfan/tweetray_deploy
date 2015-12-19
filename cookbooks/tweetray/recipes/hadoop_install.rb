#
# Cookbook Name:: hadoop_install
# Recipe:: hadoop_install
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
user 'hduser' do
    comment 'Create dedicated hadoop user'
    shell '/bin/bash'
    password '$1$oxcUPjfZ$CzejJ8/BfQFR/vPnLtazS/'
    home '/home/hduser'
    system false
    supports :manage_home => true
end

directory '/home/hduser' do
    owner 'hduser'
    group 'hduser'
    action :create
end

group 'hadoop' do
    action :create
    members 'hduser'
    append true
end

directory '/usr/local/hadoop' do
    owner 'hduser'
    group 'hadoop' 
end

tar_extract 'http://apache.ip-connect.vn.ua/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz' do
    target_dir '/usr/local/hadoop'
    tar_flags ['--strip-components 1']
end


#remote_file '/tmp/hadoop.tar.gz' do
#    source 'http://apache.ip-connect.vn.ua/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz'
#    owner 'hduser'
#    group 'hadoop'
#    mode '0755'
#    action :create
#end
#
#execute 'untar hadoop' do
#    command 'mkdir /usr/local/hadoop && tar xzf /tmp/hadoop.tar.gz -C /usr/local/hadoop --strip-components=1'
#end
