# step definition translation function
def t(regex)
  if $steps_i18n && match = $steps_i18n[regex.source]
    Regexp.new(match)
  else
    regex
  end
end

path = SWINGER_ROOT + '/swinger/step_definitions_i18n.yml'
if File.exist?(path)
  $steps_i18n = YAML.load_file(path)
  $steps_i18n = $steps_i18n[Cucumber.lang]
end