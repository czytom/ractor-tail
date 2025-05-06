# RactorTail

Ractor-safe file tailer for Ruby.

## Usage

```ruby
require "ractor_tail"

tailer = RactorTail::Tailer.new("/var/log/syslog") do |line|
  puts ">> \#{line}"
end

tailer.run
```

Supports logrotate (inode detection) and is safe to run inside Ractors.
