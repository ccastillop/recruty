# https://qiita.com/alokrawat050/items/dc7f4a7ee1acdc6a449a
module FormHelper

  def errors_for(form, field)
    content_tag(:p, form.object.errors[field].try(:first), class: 'help is-danger')
  end

  def form_group_for(form, field, opts={}, &block)
    label = opts.fetch(:label) { false }
    control_class = opts.fetch(:control_class) { "control" }
    has_errors = form.object.errors[field].present?
    content_tag :div, class: "field #{'is-danger' if has_errors}" do
      concat form.label(label, class: 'label') if label
      concat content_tag(:span, class: control_class, &block)
      concat errors_for(form, field)
    end
  end
end