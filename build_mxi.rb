require "erb"

major_version = "0"
minor_version = "0"
revision = `svn info|grep Revision`.gsub(/^Revision:\s+/,"").chomp

MXI_VERSION = "#{major_version}.#{minor_version}.#{revision}"

open("iPhone_UI_#{MXI_VERSION}.mxi","w") do |f|
  f << ERB.new(IO.read("iPhone UI.mxirb")).result
end

%x(open 'iPhone_UI_#{MXI_VERSION}.mxi')