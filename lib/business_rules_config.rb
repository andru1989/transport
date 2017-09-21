module BusinessRulesConfig
  class << self
    def self.read_rules
      YAML.load_file("#{Rails.root}/config/config_files/business_rules_config.yml")[Rails.env]
    end

    read_rules.each do |key, val|
      define_method key do
        return val
      end
    end
  end
end
