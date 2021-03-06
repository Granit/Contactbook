class TagsController < ApplicationController
  # GET /kontakts
  # GET /kontakts.xml

  def index

  	@tags = Tag.search(params[:search], current_user.id)

	@t_id = params[:t_id]
	unless @t_id.nil?
		@tag = Tag.find(@t_id)
		@kontakts = @tag.kontakts
		@kontakt_names = []
  		@kontakts.each{|tag|
		@kontakt_names.push(tag.name)
	}
	end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  # GET /kontakts/1
  # GET /kontakts/1.xml
  def show
    @tag = Tag.find(params[:id])
	@kontakts = @tag.kontakts
	@kontakt_names = []
  	@kontakts.each{|kontakt|
	@kontakt_names.push(kontakt.name)
	}
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /kontakts/new
  # GET /kontakts/new.xml
  def new
  	
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  # GET /kontakts/1/edit
  def edit
    @tag = Tag.find(params[:id])

  end

  # POST /kontakts
  # POST /kontakts.xml
  def create
  	#Kontakt {"name"=>"sdfds", "lastname"=>"sdfsdf", "address"=>"fds fsd", "tags_attributes"=>{"0"=>{"name"=>"metka1 metka2"}}} was successfully created.

    @tag = Tag.new(params[:tag])
	@tag['user_id'] = current_user.id

    respond_to do |format|
      if @tag.save
        flash[:notice] = "Tag #{params[:tag][:name]} was successfully created."
        format.html { redirect_to(@tag) }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kontakts/1
  # PUT /kontakts/1.xml
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        flash[:notice] = 'Tag was successfully updated.'
        format.html { redirect_to(@tag) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kontakts/1
  # DELETE /kontakts/1.xml
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(tags_url) }
      format.xml  { head :ok }
    end
  end

  def tag_filter
  	@kontakts = Kontakt.search(params[:search], current_user.id)
  	@tags = Tag.search(params[:search], current_user.id)
  	@tag_names = ['']
  	@tags.each{|tag|
	@tag_names.push(tag.name)
	}

	@kontakt_names = []
	@kontakts.each{|kontakt|
	@kontakt_names.push(kontakt.name)
	}
  end
  
  def add_tag
  	@tags = Tag.find_tag(params[:id], current_user.id)
  	render :partial => "kontakts/showtags"
  end
  
end


#Kontakt.find_by_name('name1')
#Kontakt.find_all_by_address('addree, 4')
#
#
#Kontakt.find_all_by_address('addree, 4', :order=>'created_at DESC')

=begin
<select id="editlevel" name="editlevel" onchange="
   <%= remote_function(
           :update => 'lques', 
           :url => {:action => :lques}, 
           :with => "'level=' + $('editlevel').value %>
">

</select>

<select id="lques" name="lques">
</select>


<% form_for :category, :url => { :action => "show" } do |f| %>
  <%= select_tag :id, options_from_collection_for_select(Category.find(:all), :id, :name),
  { :onchange => "this.form.submit();"} %>
<% end %>


<% form_for :kontakt, :url => { :action => "new" } do |f| %>
  <%= select_tag :id, options_from_collection_for_select(Tag.find(:all), :id, :name),
  { :onchange => "this.form.submit();"} %>
<% end %>



<tr class="odd">
<td>Tags</td>
<td width="20%"><% @new_tags.each do |tag| %>
<%=h tag.name %><br / >
<% end %>&nbsp;
</td>
</tr>

<%= render :partial => "tagform" %>


:onchange => remote_function(:url => {:action => 'say_hello'},
  :with => "'id=' + this.value",
  :update => "mydiv")} %>
  
  
=end

