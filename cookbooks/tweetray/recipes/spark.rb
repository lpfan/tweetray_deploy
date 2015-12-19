
#
# Cookbook Name:: hadoop_install
# Recipe:: spark 
#
# Copyright (c) 2015 The Authors, All Rights Reserved.


tar_extract 'http://d3kbcqa49mib13.cloudfront.net/spark-1.5.2-bin-hadoop2.6.tgz' do
    target_dir '/usr/local/spark'
    tar_flags ['--strip-components 1']
end

remote_file '/usr/local/spark/lib/mongo-hadoop-core.jar' do
    source 'http://central.maven.org/maven2/org/mongodb/mongo-hadoop-core/1.3.0/mongo-hadoop-core-1.3.0.jar'
    mode '0755'
end

remote_file '/usr/local/spark/lib/mongo-java-driver.jar' do
    source 'http://central.maven.org/maven2/org/mongodb/mongo-java-driver/3.2.0/mongo-java-driver-3.2.0.jar'
    mode '0755'
end
