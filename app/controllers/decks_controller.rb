class DecksController < ApplicationController
  before_filter :authenticate_user!

  # GET /decks
  # GET /decks.json
  def index
    @decks = current_user.decks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @decks }
    end
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
    @deck = current_user.decks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deck }
    end
  end

  # GET /decks/new
  # GET /decks/new.json
  def new
    @deck = Deck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deck }
    end
  end

  # GET /decks/1/edit
  def edit
    @deck = current_user.decks.find(params[:id])
  end

  # POST /decks
  # POST /decks.json
  def create
    @deck = current_user.decks.build(params[:deck])

    respond_to do |format|
      if @deck.save
        format.html { redirect_to decks_path , notice: 'Deck was successfully created.' }
        format.json { render json: @deck, status: :created, location: @deck }
      else
        format.html { render action: "new" }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /decks/1
  # PUT /decks/1.json
  def update
    @deck = current_user.decks.find(params[:id])

    respond_to do |format|
      if @deck.update_attributes(params[:deck])
        format.html { redirect_to decks_path , notice: 'Deck was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck = current_user.decks.find(params[:id])
    @deck.destroy

    respond_to do |format|
      format.html { redirect_to decks_url }
      format.json { head :no_content }
    end
  end

  def study
    @deck = current_user.decks.find(params[:id])
    @cards_count = @deck.cards.need_to_study.count
    @card = @deck.cards.need_to_study.first
  end

  def again_current_card_and_fetch_next
    @deck = current_user.decks.find(params[:id])
    @card = @deck.cards.need_to_study.first
    @card.study_again!
    redirect_to study_deck_url(@deck)
  end

  def study_tommorow_current_card_and_fetch_next
    @deck = current_user.decks.find(params[:id])
    @card = @deck.cards.need_to_study.first
    @card.study_tommorow!
    redirect_to study_deck_url(@deck)
  end

  def study_three_days_later_current_card_and_fetch_next
    @deck = current_user.decks.find(params[:id])
    @card = @deck.cards.need_to_study.first
    @card.study_three_days_later!
    redirect_to study_deck_url(@deck)
  end

  def study_a_week_later_current_card_and_fetch_next
    @deck = current_user.decks.find(params[:id])
    @card = @deck.cards.need_to_study.first
    @card.study_a_week_later!
    redirect_to study_deck_url(@deck)
  end

  def study_a_month_later_current_card_and_fetch_next
    @deck = current_user.decks.find(params[:id])
    @card = @deck.cards.need_to_study.first
    @card.study_a_month_later!
    redirect_to study_deck_url(@deck)
  end

  def never_study_current_card_and_fetch_next
    @deck = current_user.decks.find(params[:id])
    @card = @deck.cards.need_to_study.first
    @card.never_study!
    redirect_to study_deck_url(@deck)
  end
end
