require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
   test "the truth" do
      SubscriptionMailer.remind_email(users(:one), properties(:one)).deliver_later(wait_until: (10.month - 2.weeks).from_now)
   end
end
