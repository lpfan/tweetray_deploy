#
# Cookbook Name:: hadoop_config
# Recipe:: hadoop_config
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


template '/home/hduser/.bashrc' do
    source 'default/hduser_bashrc.erb'
    owner 'hduser'
    group 'hduser'
end

template '/usr/local/hadoop/etc/hadoop/hadoop-env.sh' do
    source 'default/hadoop-env.sh.erb'
end

directory '/media/hadoop/tmp' do
    recursive true
    owner 'hduser'
    group 'hadoop'
end

template '/usr/local/hadoop/etc/hadoop/core-site.xml' do
    source 'default/core-site.xml.erb'
end

template '/usr/local/hadoop/etc/hadoop/mapred-site.xml' do
    source 'default/mapred-site.xml.erb'
end

template '/usr/local/hadoop/etc/hadoop/hds-site.xml' do
    source 'default/hdfs-site.xml.erb'
end

template '/usr/local/hadoop/etc/hadoop/yarn-site.xml' do
    source 'default/yarn-site.xml.erb'
end

directory '/media/hadoop/meta/dfs/namenode' do
    recursive true
    owner 'hduser'
    group 'hadoop'
end

directory '/media/hadoop/data/dfs/datanode' do
    recursive true
    owner 'hduser'
    group 'hadoop'
end

execute 'apply needed permissions for hduser' do
    command 'chown -R hduser:hadoop /usr/local/hadoop'
end

execute 'generate ssh key' do
    user 'hduser'
    command "ssh-keygen -t dsa -q -P '' -f /home/hduser/.ssh/id_dsa"
end

execute 'add ssh key to authorized_keys' do
    user 'hduser'
    command 'cat /home/hduser/.ssh/id_dsa.pub >> /home/hduser/.ssh/authorized_keys'
end

ssh_known_hosts_entry "localhost"

execute 'format hdfs node' do
    user 'hduser'
    command '/usr/local/hadoop/bin/hdfs namenode -format'
end

execute 'start NameNode and DataNode daemon' do
    user 'hduser'
    command '/usr/local/hadoop/sbin/start-dfs.sh'
end

execute 'start yarn' do
    user 'hduser'
    command '/usr/local/hadoop/sbin/start-yarn.sh'
end

execute 'create /user folder at DataNode' do
    user 'hduser'
    command '/usr/local/hadoop/bin/hdfs dfs -mkdir /user'
end

execute 'create /user/hduser folder at DataNode' do
    user 'hduser'
    command '/usr/local/hadoop/bin/hdfs dfs -mkdir /user/hduser'
end
