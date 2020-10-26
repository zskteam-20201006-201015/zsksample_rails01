require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/microposts', type: :request do
  # Micropost. As you add validations to Micropost, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { content: 'test', user_id: '1' }
    # skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    { content: '', user_id: '' }
    # skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Micropost.create! valid_attributes
      get microposts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      micropost = Micropost.create! valid_attributes
      get micropost_url(micropost)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_micropost_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      micropost = Micropost.create! valid_attributes
      get edit_micropost_url(micropost)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Micropost' do
        expect do
          post microposts_url, params: { micropost: valid_attributes }
        end.to change(Micropost, :count).by(1)
      end

      it 'redirects to the created micropost' do
        post microposts_url, params: { micropost: valid_attributes }
        expect(response).to redirect_to(micropost_url(Micropost.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Micropost' do
        expect do
          post microposts_url, params: { micropost: invalid_attributes }
        end.to change(Micropost, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post microposts_url, params: { micropost: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        # skip('Add a hash of attributes valid for your model')
        { content: 'test_update' }
      end

      it 'updates the requested micropost' do
        expect do
          micropost = Micropost.create! valid_attributes
          patch micropost_url(micropost), params: { micropost: new_attributes }
          micropost.reload
          # skip('Add assertions for updated state')
        end.to change(Micropost, :count).by(1)
      end

      it 'redirects to the micropost' do
        micropost = Micropost.create! valid_attributes
        patch micropost_url(micropost), params: { micropost: new_attributes }
        micropost.reload
        expect(response).to redirect_to(micropost_url(micropost))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        micropost = Micropost.create! valid_attributes
        patch micropost_url(micropost), params: { micropost: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested micropost' do
      micropost = Micropost.create! valid_attributes
      expect do
        delete micropost_url(micropost)
      end.to change(Micropost, :count).by(-1)
    end

    it 'redirects to the microposts list' do
      micropost = Micropost.create! valid_attributes
      delete micropost_url(micropost)
      expect(response).to redirect_to(microposts_url)
    end
  end
end
