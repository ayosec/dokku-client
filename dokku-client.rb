#!/usr/bin/env ruby

repository = nil

`git remote -v`.split("\n").each do |line|
  git_url = line.split()[1]
  if git_url =~ /dokku@/
    repository = git_url.split(":")
    break
  end
end

if repository.nil?
  STDERR.puts "Dokku repository not found"
  exit 1
end

if ARGV.empty? or ARGV[0] == "help"
  puts "Using app name \033[1m#{repository[1]}\033[m in \033[1m#{repository[0]}\033[m"
  available_commands = IO.popen(["ssh", repository[0], "help"]).read.split("\n")
  puts available_commands.grep(/<app>/).join("\n").gsub(" <app>", "")
else
  command = [ "ssh", repository[0], ARGV[0], repository[1] ] + ARGV.drop(1)
  exec(*command)
end
