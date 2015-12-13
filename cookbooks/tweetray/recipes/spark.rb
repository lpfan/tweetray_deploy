
#
# Cookbook Name:: hadoop_install
# Recipe:: spark 
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


tar_extract 'http://d3kbcqa49mib13.cloudfront.net/spark-1.5.2-bin-hadoop2.6.tgz' do
    target_dir '/usr/local/spark'
    tar_flags ['--strip-components 1']
end
