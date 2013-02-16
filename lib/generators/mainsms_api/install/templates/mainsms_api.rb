MainsmsApi::Configuration.setup YAML.load_file(Rails.root.join('config', 'mainsms.yml'))['mainsms']
