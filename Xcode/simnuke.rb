#!/usr/bin/env ruby

# Originally based on https://gist.github.com/cabeca/cbaacbeb6a1cc4683aa5
device_types_output = `xcrun simctl list devicetypes`
device_types = device_types_output.scan /(.*) \((.*)\)/
# puts "Device types: #{device_types}"

runtimes_output = `xcrun simctl list runtimes`
runtimes = runtimes_output.scan /(.*) \(.*\) \((com.apple[^)]+)\)$/
# puts "Runtimes: #{runtimes}"

devices_output = `xcrun simctl list devices`
devices = devices_output.scan /\s\s\s\s(.*) \(([A-Z0-9-]+)\) (.*)/

devices.each do |device|
  puts "Removing device #{device[0]} (#{device[1]})"
  `xcrun simctl delete #{device[1]}`
end

device_types.each do |device_type|
  runtimes.each do |runtime|
    next if !(device_type[0] =~ /[wW]atch/).nil? ^ !(runtime[0] =~ /[wW]atch/).nil?
    puts "Creating #{device_type[0]} with #{runtime[0]}"
    command = "xcrun simctl create '#{device_type[0]}' #{device_type[1]} #{runtime[1]}"
    puts "Command: #{command}"
    command_output = `#{command}`
    sleep 0.5
  end
end