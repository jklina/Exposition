module Exposition
  module Admin::FlashesHelper
    def user_facing_flashes
      flash.to_hash.slice("alert", "error", "notice", "success")
    end
  end
end
