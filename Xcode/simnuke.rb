#!/usr/bin/env ruby

# Originally based on https://gist.github.com/cabeca/cbaacbeb6a1cc4683aa5
device_types_output = `xcrun simctl list devicetypes`
device_types = device_types_output.scan /(.*) \((.*)\)/

runtimes_output = `xcrun simctl list runtimes`
runtimes = runtimes_output.scan /(.*) \(.*\) \((com.apple[^)]+)\)$/

devices_output = `xcrun simctl list devices`
devices = devices_output.scan /\s\s\s\s(.*) \(([A-Z0-9-]+)\) (.*)/

devices.each do |device|
  success = `xcrun simctl delete #{device[1]}`
  puts "#{$?.exitstatus == 0 ? "Removed" : "Couldn't remove"} #{device[0].lstrip} (#{device[1]})"
end

device_types.each do |device_type|
  runtimes.each do |runtime|
    next if !(device_type[0] =~ /[wW]atch/).nil? ^ !(runtime[0] =~ /[wW]atch/).nil?
    command = "xcrun simctl create '#{device_type[0]}' #{device_type[1]} #{runtime[1]}"
    uuid = `#{command}`.rstrip
    puts "#{$?.exitstatus == 0 ? "Created" : "Couldn't create"} #{device_type[0]} with #{runtime[0]} (#{uuid})"
  end
end