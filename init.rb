Apiculture.register_template do |builder|
  builder.configure_options do |template_options|
    template_options["gem_name"] = ask("Gem name? (in UpperSnakeCase)",
                                       :default => template_options["gem_name"])
  end

  builder.generate do |outputter, destination|
    create_file_from_template "gemspec", "#{outputter.options['gem_name']}.gemspec"
  end
end
