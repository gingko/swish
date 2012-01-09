module Dribbble
  class User < Base
    def self.find(id)
      new(get("/#{id}"))
    end

    # It doesn't make sense unless user is a player
    def shots(options={})
      paginated_list(self.class.get("/#{@id}/shots", :query => options))
    end

    # Fetches shots by players that this player follows.
    def shots_following(options={})
      paginated_list(self.class.get("/#{@id}/shots/following", :query => options))
    end

    def draftees(options={})
      paginated_list(self.class.get("/#{@id}/draftees", :query => options))
    end

    def followers(options={})
      paginated_list(self.class.get("/#{@id}/followers", :query => options))
    end

    def following(options={})
      paginated_list(self.class.get("/#{@id}/following", :query => options))
    end
  end
end
