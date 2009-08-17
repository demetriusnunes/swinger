# step definition translation function
def t(regex)
  I18N.translate(regex)
end

class I18N
  
  class << self
    attr_accessor :steps, :lang

    def translate(regex)
      if @steps && match = @steps[regex.source]
        Regexp.new(match)
      else
        regex
      end
    end

    def missing_translation?(regex)
      @steps.nil? || @steps[regex].nil?
    end
    
    def load(lang)
      @lang = lang
      @steps = {}
      return if lang.nil? || lang == 'en'
      
      Dir[SWINGER_ROOT + "/swinger/**/*.#{lang}.i18n"].each do |file|
        load_i18n_steps(file)
      end
      @steps = nil if @steps.keys.empty?
    end
    
    def load_i18n_steps(file)
      lines = File.open(file).readlines
      key_or_value = :key
      key, value = nil, nil
      lines.each do |line|
        line = line.strip
        unless line.empty?
          if key_or_value == :key
            key = line
            key_or_value = :value
          else
            value = line
            key_or_value = :key
            @steps[key] = value
          end
        end
      end
    end
    
  end
end