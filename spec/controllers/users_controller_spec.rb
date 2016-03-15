require 'rails_helper'

describe UsersController do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  # i'm not entirely clear if there is supposed to be a `with` or not...

  context 'with `with`' do
    it 'passes with random data' do
      expect {
        post :create
      }.to have_enqueued_job(ActionMailer::DeliveryJob).with {|arg| expect(arg).to eq(SecureRandom.uuid)}
    end

    it 'doesn\'t print anything' do
      expect {
        post :create
      }.to have_enqueued_job(ActionMailer::DeliveryJob).with {|arg| puts 'nothing gets printed'}
    end
  end

  context 'without `with`' do
    it 'passes with random data' do
      expect {
        post :create
      }.to have_enqueued_job(ActionMailer::DeliveryJob) {|arg| expect(arg).to eq(SecureRandom.uuid)}
    end

    it 'doesn\'t print anything' do
      expect {
        post :create
      }.to have_enqueued_job(ActionMailer::DeliveryJob) {|arg| puts 'nothing gets printed'}
    end
  end
end
