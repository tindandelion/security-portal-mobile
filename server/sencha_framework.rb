module SenchaFramework
  def load_sencha_framework
    (framework_path + framework_filename).read
  end
  
  def framework_path
    settings.public_folder + 'sencha'
  end
  
  def framework_filename
    return 'sencha-touch-all-debug.js' unless settings.production? 
    'sencha-touch-all.js'
  end
end

