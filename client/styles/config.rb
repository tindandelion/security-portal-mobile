require "pathname"

dir = Pathname(__FILE__).dirname
load dir.parent + 'sencha' + 'resources' + 'themes'

sass_path = dir
css_path = dir.parent 
output_style = :expanded
environment = :development
