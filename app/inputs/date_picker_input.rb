class DatePickerInput < SimpleForm::Inputs::StringInput
  def input
    template.content_tag(:div, class: "datepicker input-append"){
      template.concat @builder.text_field(attribute_name, input_html_options.merge("data-format" => "yyyy-MM-dd"))
      template.concat template.content_tag(:span, class: "add-on"){
        template.concat template.content_tag(:i, nil, data: { "date-icon" => "icon-calendar" })
      }
    }
  end
end