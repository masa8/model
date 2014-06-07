
url = "http://test/test"

full = "http://test/test/path"

if /#{url}/ =~ full
 p $'
else
 p "false"
end