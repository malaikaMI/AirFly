require "rails_helper"

RSpec.describe FlightsController, type: :controller do
  let(:flight) { create(:flight) }
  let(:invalid_flight) { create(:flight, :invalid) }
  let(:new_invalid_flight) { attributes_for(:flight, :invalid) }

  describe 'GET #index' do
    it "assigns all flights as @flights" do
      get :index
      expect(assigns(:flights)).to eq([flight])
    end
  end

  describe 'GET #show' do
    it "assigns the requested flight as @flight" do
      get :show, id: flight.to_param
      expect(assigns(:flight)).to eq(flight)
    end
  end

  describe 'GET #new' do
    it "assigns a new flight as @flight" do
      get :new
      expect(assigns(:flight)).to be_a_new(Flight)
    end
  end

  describe 'GET #edit' do
    it "assigns the requested flight as @flight" do
      get :edit, id: flight.to_param
      expect(assigns(:flight)).to eq(flight)
    end
  end

  describe 'POST #create' do
    let(:flight) { attributes_for(:flight) }
    let(:invalid_flight) { attributes_for(:flight) }

    before(:each) do
      flight[:from] = 1
      flight[:to] = 2
    end

    context "with valid params" do
      it "creates a new Flight" do
        expect do
          post :create, flight: flight
        end.to change(Flight, :count).by(1)
      end

      it "assigns a newly created flight as @flight" do
        post :create, flight: flight
        expect(assigns(:flight)).to be_a(Flight)
        expect(assigns(:flight)).to be_persisted
      end

      it "redirects to the created flight" do
        post :create, flight: flight
        expect(response).to redirect_to(Flight.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved flight as @flight" do
        post :create, flight: new_invalid_flight
        expect(assigns(:flight)).to be_a_new(Flight)
      end

      it "re-renders the 'new' template" do
        post :create, flight: new_invalid_flight
        expect(response).to render_template("new")
      end
    end
  end

  describe 'PUT #update' do
    let(:flight) { create(:flight) }
    let(:new_flight) { attributes_for(:flight) }
    context "with valid params" do
      before(:each) do
        new_flight[:from] = 1
        new_flight[:to] = 3
      end
      it "updates the requested flight" do
        put :update, id: flight.to_param, flight: new_flight
        flight.reload
        expect(flight.to).to eq(3)
      end

      it "assigns the requested flight as @flight" do
        put :update, id: flight.to_param, flight: new_flight
        expect(assigns(:flight)).to eq(flight)
      end

      it "redirects to the flight" do
        put :update, id: flight.to_param, flight: new_flight
        expect(response).to redirect_to(flight)
      end
    end

    context "with invalid params" do
      it "assigns the flight as @flight" do
        put :update, id: flight.to_param, flight: new_invalid_flight
        expect(assigns(:flight)).to eq(flight)
      end

      it "re-renders the 'edit' template" do
        put :update, id: flight.to_param, flight: new_invalid_flight
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it "destroys the requested flight" do
      flight = create(:flight)
      expect do
        delete :destroy, id: flight.to_param
      end.to change(Flight, :count).by(-1)
    end

    it "redirects to the flights list" do
      flight = create(:flight)
      delete :destroy, id: flight.to_param
      expect(response).to redirect_to(flights_url)
    end
  end
end
