module ApplicationHelper
  def active_class(model)
    request.path.split("/")[2].to_i.eql?(model.id) ? "active" : ""
  end

  def destroy_link(model)
    confirm = "Czy jesteś pewien, że chcesz usunąć ten obiekt?"
    show? ? link_to("Usuń", model, method: :delete, data: { confirm: confirm }) : disabled_link("Usuń")
  end

  def disabled_link(text)
    link_to text, "javascript:;", class: "disabled_link"
  end

  def edit_link(model)
    show? ? link_to("Edytuj dane", [:edit, model]) : disabled_link("Edytuj dane")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, "javascript:;", class: "add_fields btn", data: { id: id, fields: fields.gsub("\n", "") })
  end

  def show?
    action_name.eql?("show")
  end

  def to_currency(number)
    (("%0.2f" % number) + " zł").gsub(".", ",").html_safe
  end
end