require "socket"

def http_method(input)
  input.split.first
end

def path(input)
  path = ''
  input.split[1].chars.each do |char|
    break if char == '?'
    path << char
  end
  path
end

def params(input)
  after = false
  cleaned = ''
  input.split[1].chars.each do |char|
    cleaned << char if after
    after = true if char == "?"
  end
  cleaned.split("&").map { |param| param.split("=") }.to_h
end

server = TCPServer.new("localhost", 3003)

loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  http = http_method(request_line)
  path = path(request_line)
  params = params(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts request_line
  client.puts http
  client.puts path
  client.puts params
  client.puts "</pre>"
  client.puts "<h1>Rolls!</h1>"

  rolls = params["rolls"].to_i
  sides = params["sides"].to_i

  rolls.times do 
    roll = rand(sides) + 1
    client.puts "<p>", roll, "</p>"
  end
  client.puts "</body>"
  client.puts "</html>"
  client.close
end

