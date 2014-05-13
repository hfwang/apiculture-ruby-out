Apiculture.register_template do |builder|
  builder.configure_options do |template_options|
    template_options["gem_name"] = ask("Gem name? (in underscore_case)",
                                       :default => template_options["gem_name"])
    template_options["module_name"] = template_options["module_name"] ||
      Apiculture::StringUtils.camelize(template_options["gem_name"])
    template_options["module_name"] = ask("Module name? (in UpperCamelCase)",
                                          :default => template_options["module_name"])
  end

  builder.generate do |outputter, destination|
    create_file_from_template "gemspec", "#{outputter.options['gem_name']}.gemspec"
  end
end
