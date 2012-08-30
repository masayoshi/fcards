Fcards::Application.routes.draw do

  resources :decks do
    resources :cards
    get 'study', on: :member
    get 'again_current_card_and_fetch_next', as: "again_this_card", on: :member
    get 'study_tommorow_current_card_and_fetch_next', as: "tommorow_this_card", on: :member
    get 'study_three_days_later_current_card_and_fetch_next', as: "three_days_this_card", on: :member
    get 'study_a_week_later_current_card_and_fetch_next', as: "a_week_this_card", on: :member
    get 'study_a_month_later_current_card_and_fetch_next', as: "a_month_this_card", on: :member
    get 'never_study_current_card_and_fetch_next', as: "never_this_card", on: :member
  end

  devise_for :users

  match '/contact', to: 'static_pages#contact'
  match '/about', to: 'static_pages#about'
  root to: 'static_pages#home'
end
#== Route Map
# Generated on 26 Aug 2012 18:12
#
#                          POST   /decks/:deck_id/cards(.:format)          cards#create
#            new_deck_card GET    /decks/:deck_id/cards/new(.:format)      cards#new
#           edit_deck_card GET    /decks/:deck_id/cards/:id/edit(.:format) cards#edit
#                deck_card GET    /decks/:deck_id/cards/:id(.:format)      cards#show
#                          PUT    /decks/:deck_id/cards/:id(.:format)      cards#update
#                          DELETE /decks/:deck_id/cards/:id(.:format)      cards#destroy
#                    decks GET    /decks(.:format)                         decks#index
#                          POST   /decks(.:format)                         decks#create
#                 new_deck GET    /decks/new(.:format)                     decks#new
#                edit_deck GET    /decks/:id/edit(.:format)                decks#edit
#                     deck GET    /decks/:id(.:format)                     decks#show
#                          PUT    /decks/:id(.:format)                     decks#update
#                          DELETE /decks/:id(.:format)                     decks#destroy
#         new_user_session GET    /users/sign_in(.:format)                 devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                 devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                devise/sessions#destroy
#            user_password POST   /users/password(.:format)                devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)            devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)           devise/passwords#edit
#                          PUT    /users/password(.:format)                devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                  devise/registrations#cancel
#        user_registration POST   /users(.:format)                         devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                 devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                    devise/registrations#edit
#                          PUT    /users(.:format)                         devise/registrations#update
#                          DELETE /users(.:format)                         devise/registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)            devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format)        devise/confirmations#new
#                          GET    /users/confirmation(.:format)            devise/confirmations#show
#                  contact        /contact(.:format)                       static_pages#contact
#                    about        /about(.:format)                         static_pages#about
#                     root        /                                        static_pages#home
