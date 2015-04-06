require 'rubygems'
require 'bundler/setup'
require 'docker'

repo = ARGV[0]
repo_name = repo.split('/').last
Excon.defaults[:ssl_verify_peer] = false
Docker.options = {chunk_size: 1}

container = Docker::Container.create('Cmd' => ['/sbin/my_init'], 'Image' => 'mini_ci')
container.start

def run_command(container, command)
  puts "λ #{command}"
  status = container.exec(["bash", "-lc", command]) do |_, chunk|
    print chunk
    STDOUT.flush
  end.last
  if status != 0
    puts "Build failed"
    exit
  end
  status
end

run_command(container, "cd /tmp && git clone #{repo}")
run_command(container, "cd /tmp/#{repo_name} && bundle")
run_command(container, "cd /tmp/#{repo_name} && bundle exec rake")

container.stop

container.delete
