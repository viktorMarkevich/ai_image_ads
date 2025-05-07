class ContextsController < ApplicationController
  before_action :set_context, only: %i[ show edit update destroy ]
  before_action :fetch_campaigns, only: %i[ new edit ]

  # GET /contexts or /contexts.json
  def index
    @contexts = Context.all
  end

  # GET /contexts/1 or /contexts/1.json
  def show
  end

  # GET /contexts/new
  def new
    @context = Context.new
  end

  # GET /contexts/1/edit
  def edit
  end

  # POST /contexts or /contexts.json
  def create
    @context = Context.new(context_params)

    respond_to do |format|
      if @context.save
        format.html { redirect_to @context, notice: "Context was successfully created." }
        format.json { render :show, status: :created, location: @context }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @context.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contexts/1 or /contexts/1.json
  def update
    respond_to do |format|
      if @context.update(context_params)
        format.html { redirect_to @context, notice: "Context was successfully updated." }
        format.json { render :show, status: :ok, location: @context }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @context.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contexts/1 or /contexts/1.json
  def destroy
    @context.destroy!

    respond_to do |format|
      format.html { redirect_to contexts_path, status: :see_other, notice: "Context was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # app/controllers/contexts_controller.rb

  def generate_ideas
    @context = Context.find(params[:id])
    ideas = AdIdeaGenerator.new(@context).call
    @context.update(ad_ideas: ideas)
    redirect_to @context, notice: "Ideas were generated successfully"
  end

  def generate_images
    @context = Context.find(params[:id])

    if @context.ad_ideas.any?
      @context.generated_images.destroy_all
      ImageGenerator.new(@context).call
      redirect_to @context, notice: "Generate images"
    else
      redirect_to @context, alert: "Please, generate ideas first."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_context
      @context = Context.find(params.expect(:id))
    end

    def fetch_campaigns
      @campaigns = TiktokCampaignsFetcher.call
    end

    # Only allow a list of trusted parameters through.
    def context_params
      params.expect(context: [ :name, :industry_description, :landing_page_url, :campaign_id, :adgroup_id ])
    end
end
