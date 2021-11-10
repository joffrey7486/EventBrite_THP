class AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all
  end

  def new
    @event = Event.find(params[:event])
    @price = @event.price
    @stripe_amount = (@price * 100).to_i
    
  end

  def create
    @event = Event.find(params[:event])
    @stripe_amount = @event.price * 100 # Amount in cents

    customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken]
      })
    
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: 'Montant de l\'inscription',
      currency: 'eur'
    })
    @attendance = Attendance.new(
      stripe_customer_id: charge.id,
      event_id: @event.id,
      user_id: current_user.id
    )

    if @attendance.save
      flash[:inscription_success] = "Vous êtes correctement inscrits !"
      redirect_to event_path(@event.id)
    else
      flash[:danger] = "Il nous manque une ou plusieurs information(s)..."
      render 'new'
    end
      
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_attendance_path
  end    
end
