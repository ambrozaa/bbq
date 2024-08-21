require 'rails_helper'
require 'pundit/rspec'

RSpec.describe EventPolicy do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user) }
  let(:other_event) { Event.new }

  # объект тестирования (политика)
  subject { EventPolicy }

  permissions :create? do
    # авторизованный пользователь может создать Event
    it "allows users to create events.rb" do
      expect(subject).to permit(user, event)
    end

    # анонимный пользователь не может создать Event
    it "does not allow non-users to create events.rb" do
      expect(subject).not_to permit(nil, event)
    end
  end

  permissions :show? do
    # авторизованный пользователь может смотреть Event
    it "allows users to show events.rb" do
      expect(subject).to permit(user, event)
      expect(subject).to permit(other_user, event)
    end

    # анонимный пользователь не может смотреть  Event
    it "does not allow non-users to show events.rb" do
      expect(subject).not_to permit(nil, event)
    end
  end

  permissions :edit?, :update?, :destroy? do
    it 'allows the event owner to edit the event' do
      expect(subject).to permit(user, event)
    end

    it 'does not allow a non-owner to edit the event' do
      expect(subject).not_to permit(other_user, event)
    end

    it 'does not allow non-users to edit the event' do
      expect(subject).not_to permit(nil, event)
    end
  end
end
