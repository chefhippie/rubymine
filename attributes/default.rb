#
# Cookbook Name:: rubymine
# Attributes:: default
#
# Copyright 2013, Thomas Boerger
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

default["rubymine"]["version"] = "5.4.3"
default["rubymine"]["directory"] = "RubyMine-5.4.3.2.1"
default["rubymine"]["file_name"] = "RubyMine-#{node["rubymine"]["version"]}.tar.gz"
default["rubymine"]["file_download"] = "http://download-ln.jetbrains.com/ruby/#{node["rubymine"]["file_name"]}"
default["rubymine"]["install_directory"] = "rubymine"
default["rubymine"]["install_prefix"] = "/opt"
default["rubymine"]["desktop_file"] = "/usr/share/applications/rubymine.desktop"
