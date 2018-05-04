#
# Cookbook:: snmp
# Recipe:: _debian
#
# The MIT License (MIT)
#
# Copyright:: 2017, Thomas Wimprine
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

apt_update 'update'

pkgname = node['platform_version'].to_i <= 7 ? 'tooold' : 'snmpd'

return if pkgname == 'tooold'

package pkgname do
    action :install
end

service "snmpd" do
    supports :restart => true
    action [:enable, :start]
end

directory "/etc/snmp" do
action :create
owner "root"
group "root"
mode 0750
end

template '/etc/snmp/snmpd.conf' do
source 'snmpd.conf.erb'
notifies :restart, resources(:service => 'snmpd'), :immediately
end