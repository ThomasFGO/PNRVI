class FeedsController < ApplicationController
  def index
    @shop_cards = ShopCard.all
  end
end

#SELECT "shop_cards".* FROM "shop_cards" WHERE "shop_cards"."ref_card_id" IN (SELECT "search_cards"."id" FROM "search_cards" WHERE "search_cards"."user_id" = $1)

#@catches = Catch.where(user_id: current_user.friends).or(current_user.catches).includes(:user, :specie)
#SELECT "catches".* FROM "catches" WHERE ("catches"."user_id" IN (SELECT "users"."id" FROM "users"
#INNER JOIN "friendships" ON "users"."id" = "friendships"."friend_id" WHERE "friendships"."user_id" = $1) OR "catches"."user_id" = $2)

