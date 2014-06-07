# encoding: utf-8
require 'find'
require 'nkf'

pathlist = []
Find.find(".") { |path| pathlist.push(path) if /\w*\.(c|h|cpp)/ =~ path }
p pathlist

contents_modified = ""
pathlist.each{ |file| 
	File.open(file) { |data| 
		contents = data.read
		contents_modified = NKF.nkf("-w -c",contents)
		p contents_modified
		File.open(file,"wb"){ |data| 
			data.write(":"+contents_modified)
		}
	}
}
