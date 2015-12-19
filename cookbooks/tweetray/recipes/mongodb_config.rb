#
# Cookbook Name:: hadoop_config
# Recipe:: mongo_config
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


template '/etc/mongod.conf' do
    source 'default/mongod.conf'
end
