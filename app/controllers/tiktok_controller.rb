class TiktokController < ApplicationController
  def adgroups
    campaign_id = params[:campaign_id]
    @context = Context.new(campaign_id: campaign_id)
    @adgroups = TiktokAdgroupsFetcher.call(campaign_id)

    render turbo_stream: turbo_stream.replace(
      "adgroups_frame",
      partial: "contexts/adgroup_select",
      locals: { context: @context, adgroups: @adgroups }
    )
  end
end
