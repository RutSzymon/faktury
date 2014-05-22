module ApplicationHelper
  def active_class(model)
    request.path.split("/")[2].to_i.eql?(model.id) ? "active" : ""
  end

  def disabled_link(text)
    link_to text, "javascript:;", class: "disabled_link"
  end

  def edit_link(model)
    show? ? link_to("Edytuj dane", [:edit, model]) : disabled_link("Edytuj dane")
  end

  def show?
    action_name.eql?("show")
  end
end