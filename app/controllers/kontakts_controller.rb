class KontaktsController < ApplicationController
  # GET /kontakts
  # GET /kontakts.xml
  def index
    #@kontakts = Kontakt.all
	@kontakts = Kontakt.search(params[:search], current_user.id)
	#@kontakt_names = []
	#@kontakts.each{|kontakt|
	#@kontakt_names.push(kontakt.name)
	#}
	@k_id = params[:k_id]
	unless @k_id.nil?
		@kontakt = Kontakt.find(@k_id)
		@tags = @kontakt.tags
		@tag_names = []
  		@tags.each{|tag|
		@tag_names.push(tag.name)
	}
	end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kontakts }
    end
  end

  # GET /kontakts/1
  # GET /kontakts/1.xml
  def show
  	
    @kontakt = Kontakt.find(params[:id])
    if current_user.id == @kontakt.user_id
	@tags = @kontakt.tags
	@tag_names = []
  	@tags.each{|tag|
	@tag_names.push(tag.name)
	}
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kontakt }
    end
    else
    respond_to do |format|
      format.html { redirect_to('/kontakts') }
      format.xml  { head :ok }
    end
    end
  end

  # GET /kontakts/new
  # GET /kontakts/new.xml
  def new
  	
    @kontakt = Kontakt.new
	@tags = @kontakt.tags
	@new_tags = Tag.search(nil, current_user.id)-@tags
	@tag_names = ['']
  	@new_tags.each{|tag|
	@tag_names.push(tag.name)
	}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kontakt }
    end
  end

  # GET /kontakts/1/edit
  def edit
    @kontakt = Kontakt.find(params[:id])
    unless current_user.id == @kontakt.user_id
    respond_to do |format|
      format.html { redirect_to('/kontakts') }
      format.xml  { head :ok }
    end
    end
		#@tags = @kontakt.tags
		#@tag_names = []
  		#@tags.each{|tag|
		#@tag_names.push(tag.name)
		#}
  end

  # POST /kontakts
  # POST /kontakts.xml
  def create
  	#Kontakt {"name"=>"sdfds", "lastname"=>"sdfsdf", "address"=>"fds fsd", "tags_attributes"=>{"0"=>{"name"=>"metka1 metka2"}}} was successfully created.

    @kontakt = Kontakt.new(params[:kontakt])
 	#tt = eval(params[:tags])
 	params[:tagids] ||=[]
 	params[:tagids].each{|tagid|
 	@kontakt.tags.push(Tag.find(tagid))
 	}
	@kontakt['user_id'] = current_user.id
	@kontakt['name'] = (params[:kontakt][:lastname].to_s+" "+params[:kontakt][:firstname].to_s + " "+ params[:kontakt][:middlename].to_s).strip if @kontakt['name'].blank?
    respond_to do |format|
      if @kontakt.save
        flash[:notice] = "Contact was successfully created."
        format.html { redirect_to(@kontakt) }
        format.xml  { render :xml => @kontakt, :status => :created, :location => @kontakt }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kontakt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kontakts/1
  # PUT /kontakts/1.xml
  def update
    @kontakt = Kontakt.find(params[:id])

    respond_to do |format|
      if @kontakt.update_attributes(params[:kontakt])
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to(@kontakt) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kontakt.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kontakts/1
  # DELETE /kontakts/1.xml
  def destroy
  	
    @kontakt = Kontakt.find(params[:id])
    @kontakt.destroy if current_user.id == @kontakt.user_id

    respond_to do |format|
      format.html { redirect_to(kontakts_url) }
      format.xml  { head :ok }
    end
  end

  def add_tag
  	@tags = Tag.find_tag(params[:id], current_user.id)
  	render :partial => "kontakts/showtags"
  end
  
end
