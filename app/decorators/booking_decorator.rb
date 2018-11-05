class BookingDecorator < Draper::Decorator
  delegate_all

  def actions
    if departed?
      ""
    else
      h.link_to(h.content_tag(
                  :span,
                  "",
                  class: "glyphicon glyphicon-edit",
                  title: "Edit"
      ), h.edit_booking_path(object))
    end
  end

  def status
    if departed?
      "Departed"
    else
      "Scheduled"
    end
  end

  def departed?
    object.flight.departure < Time.now
  end
end
