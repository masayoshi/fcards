module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title page_title
    base_title = "f-cards"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def display_card_status card_status
    case card_status
    when Card::STATUS_FIRST_TIME
      content_tag(:span, "First Time", class: "label")
    when Card::STATUS_AGAIN
      content_tag(:span, "Again", class: "label label-important")
    when Card::STATUS_HARD
      content_tag(:span, "Hard", class: "label label-warning")
    when Card::STATUS_MEDIUM
      content_tag(:span, "Medium", class: "label label-success")
    when Card::STATUS_EASY
      content_tag(:span, "Easy", class: "label label-info")
    when Card::STATUS_ALMOST_DONE
      content_tag(:span, "Almost Done", class: "label label-info")
    when Card::STATUS_DONE
      content_tag(:span, "Done", class: "label label-inverse")
    else
      content_tag(:span, "Invalid Status", class: "label label-inverse")
    end
  end

  def display_card_study_count card_study_count
    if card_study_count < 4
      content_tag(:span, card_study_count, class: "badge badge-success")
    elsif card_study_count < 8
      content_tag(:span, card_study_count, class: "badge badge-warning")
    else
      content_tag(:span, card_study_count, class: "badge badge-important")
    end
  end

  def link_to_eijiro word
    link_to "Eijiro", "http://eow.alc.co.jp/search?q=" + word , target: "_blank"
  end
end
