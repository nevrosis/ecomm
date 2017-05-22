class Sale < ApplicationRecord

  before_create :populate_uuid

  belongs_to :item

  include AASM

  aasm column: 'state' do
    state :pending, initial: true
    state :processing
    state :finished
    state :failure

    event :process, after: :charge_card do
      transitions from: :pending, to: :processing
    end

    event :finish do
      transitions from: :processing, to: :finished
    end

    event :fail do
      transitions from: :processing, to: :failure
    end


  end

  def charge_card

    begin
      save!
      charge = Stripe::Charge.create(
        amount:       self.amount,
        description:  'Item sale',
        currency:     'usd',
        card:         self.stripe_token
        )
      self.update(stripe_id: charge.id)

      self.finish!

    rescue Stripe::StripeError => e
      self.update_attributes(error: e.message)
      self.fails!

    end



    #token = params[:stripeToken]

    #begin


    #@sale = item.sales.create!(buyer_email: current_user.email)

  end

  private

  def populate_uuid
    self.uuid = SecureRandom.uuid()
  end

end
