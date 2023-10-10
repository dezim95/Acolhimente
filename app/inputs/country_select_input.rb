class CountrySelectInput < SimpleForm::Inputs::CollectionSelectInput
  def input(wrapper_options)
    @builder.country_select(attribute_name, priority_countries, input_options, input_html_options)
  end

  private

  def priority_countries
    options.fetch(:priority_countries, [])
  end
end
