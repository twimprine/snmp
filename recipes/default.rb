#
# Cookbook:: snmp
# Recipe:: default
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

case node['platform']
when 'windows'
  include_recipe 'snmp::_windows'
when 'redhat', 'rhel'
  include_recipe 'snmp::_rhel'
when 'centos'
  include_recipe 'snmp::_rhel'
when 'ubuntu'
  include_recipe 'snmp::_ubuntu'
when 'AIX'
  include_recipe 'snmp::_aix'
when 'debian'
  include_recipe 'snmp::_debian'
when 'MAC_OS_X'
  include_recipe 'snmp::_OSX'
when 'solaris', 'solaris2'
  include_recipe 'snmp::_solaris'
else
  log "This platform is not supported: #{node['platform']} - #{node['platform_version']}"
end

include_recipe 'snmp::default'