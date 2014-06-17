module ApplicationHelper
  def check_for_participating_or_organising(event)
    return 'organising' if event.organiser_id == current_user.id
    'participating'
  end
end
