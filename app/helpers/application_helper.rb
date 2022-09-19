module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Tutorial Sample App'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def form_with_error_class(object, attribute)
    if object.errors[attribute].present?
      'form-control parsley-error'
    else
      'form-control'
    end
  end

  def form_error_messages(object, attribute)
    return if object.errors[attribute].empty?

    errors = object.errors[attribute].uniq.map do |e|
      tag.li(e, class: 'parsley-required')
    end
    tag.ul(safe_join(errors), class: 'parsley-errors-list filled ml-2')
  end
end
