#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'gtk2'

window = Gtk::Window.new
window.set_size_request(300,50)
window.signal_connect("destroy") { Gtk.main_quit }

button = Gtk::Button.new('Tweet it')
textview = Gtk::TextView.new
textview.accepts_tab = false
textview.wrap_mode = Gtk::TextTag::WRAP_CHAR
button.signal_connect("clicked") { socket.puts textview.buffer.text; textview.buffer.text = '' }

hbox = Gtk::HBox.new
vbox = Gtk::VBox.new

window.add hbox
hbox.pack_start textview
hbox.pack_start vbox, false, false
vbox.pack_start button, false, false, 0

window.show_all

Gtk.main


