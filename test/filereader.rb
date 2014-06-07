# encoding: utf-8

require 'nkf'

CODES = {
  NKF::JIS      => "JIS",
  NKF::EUC      => "EUC",
  NKF::SJIS     => "SJIS",
  NKF::UTF8     => "UTF8",
  NKF::BINARY   => "BINARY",
  NKF::ASCII    => "ASCII",
  NKF::UNKNOWN  => "UNKNOWN",
}

while file = ARGV.shift
  str = open(file) {|io| io.gets(nil) }

  printf "%-10s ", file
  if str.nil?
    puts "EMPTY"
  else
    #puts CODES.fetch(NKF.guess(str))
    puts NKF.guess(str)

  end
end

#require 'nkf'

#open("a.c") {|c| file = c.read; puts NKF.guess(file) }
#puts File.open("test2/b.c","r:SHIFT_JIS:UTF-8") {|c| c.read.encoding }

#File.open("autf8.c") {|c|file = c.read; puts NKF.guess(file) }
#puts File.open("test2/butf8.c","r:UTF-8") {|c| c.read.encoding }
