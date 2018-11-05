require "rails_helper"

RSpec.describe BookingsController, type: :controller do
  let(:booking) { create(:booking) }
  let(:valid_attributes) do
    { flight_id: 1,
      user_id: 1,
      passengers_attributes: [
        name: "Femi Senjobi",
        email: "femi@gmail.com",
        phone: "08987654346",
        address: "Yaba, Lagos"
      ] }
  end
  let(:invalid_attributes) do
    { flight_id: nil,
      user_id: 1,
      passengers_attributes: nil }
  end

  let(:valid_booking) { create(:booking, :invalid) }

  describe 'GET #show' do
    it "assigns the requested booking as @booking" do
      get :show, id: booking.to_param
      expect(assigns(:booking)).to eq(booking)
    end
  end

  describe "GET #new" do
    it "assigns a new booking as @booking" do
      get :new, flight_id: booking.flight_id
      expect(assigns(:booking)).to be_a_new(Booking)
    end
  end

  describe 'GET #edit' do
    it "assigns the requested booking as @booking" do
      get :edit, id: booking.id
      expect(assigns(:booking)).to eq(booking)
    end
  end

  describe 'POST #create' do
    context "with valid params" do
      it "creates a new Booking" do
        booking[:flight_id] = 1
        expect do
          post :create, booking: valid_attributes
        end.to change(Booking, :count).by(1)
      end

      it "assigns a newly created booking as @booking" do
        booking[:flight_id] = 1
        post :create, booking: valid_attributes
        expect(assigns(:booking)).to be_persisted
      end

      it "redirects to the created booking" do
        post :create, booking: valid_attributes
        expect(response).to render_template(:new)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved booking as @booking" do
        post :create, booking: invalid_attributes
        expect(assigns(:booking)).to be_a_new(Booking)
      end

      it "re-renders the 'new' template" do
        post :create, booking: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end

  describe 'PUT #update' do
    context "with valid params" do
      it "updates the requested booking" do
        put :update, id: booking.to_param, booking: valid_attributes
        booking.reload
        expect(booking.passengers.first.email).to eq("femi@gmail.com")
      end

      it "assigns the requested booking as @booking" do
        put :update, id: booking.to_param, booking: valid_attributes
        expect(assigns(:booking)).to eq(booking)
      end

      it "redirects to the booking" do
        put :update, id: booking.to_param, booking: valid_attributes
        expect(response).to redirect_to(booking)
      end
    end

    context "with invalid params" do
      it "assigns the booking as @booking" do
        put :update, id: booking.to_param, booking: invalid_attributes
        expect(assigns(:booking)).to eq(booking)
      end

      it "re-renders the 'edit' template" do
        put :update, id: booking.to_param, booking: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end

  describe 'DELETE #destroy' do
    it "destroys the requested booking" do
      booking = create(:booking)
      expect do
        delete :destroy, id: booking.to_param
      end.to change(Booking, :count).by(-1)
    end

    it "redirects to the bookings list" do
      booking = create(:booking)
      delete :destroy, id: booking.to_param
      expect(response).to redirect_to(bookings_url)
    end
  end
end
