<%
std_opts = "features --tags ~@wip"
std_opts << " --tags ~@wip-jruby" if defined?(JRUBY_VERSION)
begin
  require 'rspec/expectations'
  std_opts << ' --tags ~@rspec1'
rescue LoadError
  # rspec 1
  std_opts << ' --tags ~@rspec2'
end
wip_opts = "--color --tags @wip:3"
wip_opts << ",@wip-jruby:3" if defined?(JRUBY_VERSION)
legacy_opts = ''
legacy_opts << " --tags ~@wire" if defined?(JRUBY_VERSION)
legacy_opts << " --tags ~@wip-jruby" if defined?(JRUBY_VERSION)
%>
default: <%= std_opts %> --format rerun --out rerun.txt --format pretty --format json --out test_report.json --format html --out test_report.html --tags ~@jruby
jruby: <%= std_opts %> --tags ~@spork --tags ~@wire
jruby_win: <%= std_opts %> --tags ~@spork --tags ~@wire CUCUMBER_FORWARD_SLASH_PATHS=true
windows_mri: <%= std_opts %> --tags ~@jruby --tags ~@spork --tags ~@wire --tags ~@needs-many-fonts CUCUMBER_FORWARD_SLASH_PATHS=true
ruby_1_8_7: <%= std_opts %> --tags ~@jruby --tags ~@fails_on_1_8_7
ruby_1_9: <%= std_opts %> --tags ~@jruby --tags ~@fails_on_1_9
ruby_2_0: <%= std_opts %> --tags ~@jruby --tags ~@fails_on_1_9
wip: --wip <%= wip_opts %> features
none: --format pretty
rerun: --format html --out rerun_report.html --format pretty @rerun.txt
legacy: legacy_features -r legacy_features -f progress --tags ~@spork <%= legacy_opts %>
parallel: <%= std_opts %> --expand --format json --out parallel_report<%= ENV['TEST_ENV_NUMBER'] %>.json --format progress --format html --out parallel_report<%= ENV['TEST_ENV_NUMBER'] %>.html
