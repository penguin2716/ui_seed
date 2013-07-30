#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'socket'
require 'twitter'



context = binding
socket = TCPSocket.open('localhost', 0x3939)

while socket.gets
  begin
    context.eval $_
  rescue
    puts "error for code: #{$_}"
  end
end

socket.close
