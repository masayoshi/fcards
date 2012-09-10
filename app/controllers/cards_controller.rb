class CardsController < ApplicationController
  before_filter :authenticate_user!, :find_deck

  # GET /cards
  # GET /cards.json
  def index

    if params[:keyword].present?
      @keyword = params[:keyword]
      @cards = @deck.cards.search(@keyword).paginate(page: params[:page])
    else
      @cards = @deck.cards.paginate(page: params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards }
    end
  end

  # get /cards/1
  # get /cards/1.json
  def show
    @card = @deck.cards.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card }
    end
  end

  # get /cards/new
  # get /cards/new.json
  def new
    @card = @deck.cards.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @card }
    end
  end

  # get /cards/1/edit
  def edit
    @card = @deck.cards.find(params[:id])
  end

  # post /cards
  # post /cards.json
  def create
    @card = @deck.cards.new(params[:card])

    respond_to do |format|
      if @card.save
        format.html { redirect_to deck_card_path(@deck, @card), notice: 'card was successfully created.' }
        format.json { render json: @card, status: :created, location: @card }
      else
        format.html { render action: "new" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # put /cards/1
  # put /cards/1.json
  def update
    @card = @deck.cards.find(params[:id])

    respond_to do |format|
      if @card.update_attributes(params[:card])
        format.html { redirect_to deck_card_path(@deck, @card), notice: 'card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # delete /cards/1
  # delete /cards/1.json
  def destroy
    @card = @deck.cards.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to deck_cards_url(@deck) }
      format.json { head :no_content }
    end
  end

  private

  def find_deck
    @deck = current_user.decks.find(params[:deck_id])
  end
end
