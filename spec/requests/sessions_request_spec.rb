RSpec.describe SessionsController, type: :request do
  let(:member) { Fabricate(:member) }

  describe '#destroy' do
    before do
      sign_in member.user
    end

    it 'clears session[:current_organization_id]' do
      post set_current_organization_path(member.organization)

      expect(session[:current_organization_id]).not_to be_nil

      delete destroy_user_session_path

      expect(session[:current_organization_id]).to be_nil
    end
  end
end
