#
# Cookbook Name:: rubymine
# Recipe:: default
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

remote_file ::File.join(Chef::Config[:file_cache_path], node["rubymine"]["file_name"]) do
  source node["rubymine"]["file_download"]
  action :create_if_missing
end

bash "rubymine_install" do
  code <<-EOH
    tar -xvf #{node["rubymine"]["file_name"]} --transform=s/#{node["rubymine"]["directory"]}/#{node["rubymine"]["install_directory"]}/ -C #{node["rubymine"]["install_prefix"]}
  EOH

  cwd Chef::Config[:file_cache_path]
  action :run

  not_if do
    ::File.directory? ::File.join(node["rubymine"]["install_prefix"], node["rubymine"]["install_directory"])
  end
end

template node["rubymine"]["desktop_file"] do
  source "app.desktop.erb"
  owner "root"
  group "root"
  mode 0644

  variables(
    node["rubymine"]
  )

  only_if do
    node["rubymine"]["desktop_file"]
  end
end
