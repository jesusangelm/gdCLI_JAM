#!/usr/bin/env ruby
#
#sencillo script para cargar archivos a GoogleDrive.
#

require "rubygems"
begin
  require "google_drive"
rescue LoadError
  puts "Necesitas instalar google_drive: gem install google_drive"
  exit!(1)
end

config_file = "#{ENV['HOME']}/.gdJAM"
unless File.exist?(config_file)
  puts "Escribe tu correo GoogleDrive y clave (uno por cada linea) en " +
       "`~/.gdJAM`"
  exit!(1)
end

user,password = File.read(config_file).split("\n")

if ARGV[0].nil?
  puts "Favor especifica un archivo para ser cargado"
  exit!(1)
end

#logeandose de manera tradicional... e insegura :/
session = GoogleDrive.login(user, password)

#subir un archivo
session.upload_from_file(ARGV[0])
