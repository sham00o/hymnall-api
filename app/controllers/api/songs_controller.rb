module Api
  class SongsController < Api::BaseController

    # POST /api/{plural_resource_name}
    def create
      set_resource(resource_class.new(resource_params))

      get_resource.stanzas = params[:stanzas]
      get_resource.chorus = params[:chorus]
      get_resource.order = params[:order]

      if get_resource.save
        render json: get_resource, status: :created
      else
        render json: get_resource.errors, status: :unprocessable_entity
      end
    end

    private

      def song_params
        params.permit(:stanzas => [])
      end

      # def query_params
      #   # this assumes that an album belongs to an artist and has an :artist_id
      #   # allowing us to filter by this
      #   params.permit(:artist_id, :title)
      # end

  end
end
