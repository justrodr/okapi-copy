class PropertiesController < ApplicationController
  

  def new

    @property = Property.new
  end
  
  # def index #TODO if needed
  #   @properties = Property.paginate(:page=>params[:page], :per_page: 5)
  # end
  def error
  end

  def show
    @property = Property.find params[:id]
  end
  
  def destroy
     @property = Property.find params[:id]
     @orders = Order.where(property: @property.id)
     @orders.each do |p|
      p.update(canceled: true)
     end
     @property.destroy
    #  flash[:notice] = "Property #{@property.prop_name} destroyed"
     session[:properties] = Property.where(user: User.find_by(email: session[:email]))
     redirect_to dash_path
  end 
  
  def edit
    if !Property.exists?(id: params[:id])
      render "properties/error",  layout: false, status: :not_found
    else
      @property = Property.find params[:id]
    end 
  end
  
  def update
    @states = {"alabama" => 1,	"al" => 1, "alaska" => 1, "ak" => 1, "arizona" => 1,"az" => 1,"arkansas" => 1,"ar" => 1,"california" => 1,"ca" => 1,"colorado" => 1,"co" => 1,"connecticut" => 1,"ct" => 1,"delaware" => 1,"de" => 1,"district of columbia" => 1,"dc" => 1,"florida" => 1,"fl" => 1,"georgia" => 1,"ga" => 1,"hawaii" => 1,"hi" => 1,"idaho" => 1,
"id" => 1,"illinois" => 1,"il" => 1,"indiana" => 1,"in" => 1,"iowa" => 1,"ia" => 1,"kansas" => 1,'ks' => 1,'kentucky' => 1,'ky' => 1,'louisiana' => 1,'la' => 1,'maine' => 1,'me' => 1,'montana' => 1,'mt' => 1,'nebraska' => 1,'ne' => 1,'nevada' => 1,'nv' => 1,'new hampshire' => 1,'nh' => 1,'new jersey' => 1,'nj' => 1,'new mexico' => 1,'nm' => 1,
'new york' => 1,'ny' => 1,'north carolina' => 1,'nc' => 1,'north dakota' => 1,'nd' => 1,'ohio' => 1,'oh' => 1,'oklahoma' => 1,'ok' => 1,'oregon' => 1,'or' => 1,'maryland' => 1,'md' => 1,'massachusetts' => 1,'ma' => 1,'michigan' => 1,'mi' => 1,'minnesota' => 1,'mn' => 1,'mississippi' => 1,'ms' => 1,'missouri' => 1,'mo' => 1,
'pennsylvania' => 1,'pa' => 1,'rhode island' => 1,'ri' => 1,'south carolina' => 1,'sc' => 1,'south dakota' => 1,'sd' => 1,'tennessee' => 1,'tn' => 1,'texas' => 1,'tx' => 1,'utah' => 1,'ut' => 1,'vermont' => 1,'vt' => 1,'virginia' => 1,'va' => 1,'washington' => 1,'wa' => 1,'west virginia' => 1,'wv' => 1,'wisconsin' => 1,'wi' => 1,'wyoming' => 1,'wy' => 1}
  
    @property = Property.find params[:property][:id]
    @property.tenant_phone = params[:property][:tenant_phone]
    @property.zipcode = params[:property][:zipcode]
    @property.address = params[:property][:address]
    @property.city = params[:property][:city]
    @property.state = params[:property][:state]
    @property.prop_name = params[:property][:prop_name]
    @property.tenant_name = params[:property][:tenant_name]
    if @property.tenant_phone != "" && (!((@property.tenant_phone =~ /\d{3}-\d{3}-\d{4}/) || (@property.tenant_phone =~ /\b\d{10}\b/)))
        flash[:warning] = "Please enter a valid phone number"
        redirect_to edit_property_path(@property)
        return
    end 
    
    if(@states[@property.state.downcase] != 1)
        flash[:warning] = "Please enter a valid state"
        redirect_to edit_property_path(@property)
        return    
    end
    if !(@property.zipcode =~ /\b\d{5}\b/)
        flash[:warning] = "Please enter a valid zipcode"
        redirect_to edit_property_path(@property)
        return    
    end
    puts @property.address.length
    if (@property.address.length < 8 || @property.address.length > 40 || !(@property.address=~ /\d/) || !(@property.address=~ /[a-zA-Z+]/))
        flash[:warning] = "Please enter a valid address"
        redirect_to edit_property_path(@property)
        return    
    end
    
    if !(@property.city =~ /[a-zA-Z]/) || @property.city.length > 40
        flash[:warning] = "Please enter a valid city"
        redirect_to edit_property_path(@property)
        return    
    end
    if @property.prop_name != "" && !(@property.prop_name =~ /[a-zA-Z]/) || @property.prop_name.length > 40
        flash[:warning] = "Please enter a valid property name"
        redirect_to edit_property_path(@property)
        return    
    end
    if !(@property.tenant_name =~ /[0-9a-zA-Z]/) || @property.tenant_name.length > 40
        flash[:warning] = "Please enter a valid tenant name"
        redirect_to edit_property_path(@property)
        return    
    end
     if(@property.update_attributes(prop_params))
        # flash[:notice] = "#{@property.prop_name} was successfully updated."
        redirect_to dash_path
     else
       flash[:warning] = @property.errors.full_messages.to_sentence
       redirect_to edit_property_path(@property)
     end

  end

  def create(property = nil)
    @states = {"alabama" => 1,	"al" => 1, "alaska" => 1, "ak" => 1, "arizona" => 1,"az" => 1,"arkansas" => 1,"ar" => 1,"california" => 1,"ca" => 1,"colorado" => 1,"co" => 1,"connecticut" => 1,"ct" => 1,"delaware" => 1,"de" => 1,"district of columbia" => 1,"dc" => 1,"florida" => 1,"fl" => 1,"georgia" => 1,"ga" => 1,"hawaii" => 1,"hi" => 1,"idaho" => 1,
"id" => 1,"illinois" => 1,"il" => 1,"indiana" => 1,"in" => 1,"iowa" => 1,"ia" => 1,"kansas" => 1,'ks' => 1,'kentucky' => 1,'ky' => 1,'louisiana' => 1,'la' => 1,'maine' => 1,'me' => 1,'montana' => 1,'mt' => 1,'nebraska' => 1,'ne' => 1,'nevada' => 1,'nv' => 1,'new hampshire' => 1,'nh' => 1,'new jersey' => 1,'nj' => 1,'new mexico' => 1,'nm' => 1,
'new york' => 1,'ny' => 1,'north carolina' => 1,'nc' => 1,'north dakota' => 1,'nd' => 1,'ohio' => 1,'oh' => 1,'oklahoma' => 1,'ok' => 1,'oregon' => 1,'or' => 1,'maryland' => 1,'md' => 1,'massachusetts' => 1,'ma' => 1,'michigan' => 1,'mi' => 1,'minnesota' => 1,'mn' => 1,'mississippi' => 1,'ms' => 1,'missouri' => 1,'mo' => 1,
'pennsylvania' => 1,'pa' => 1,'rhode island' => 1,'ri' => 1,'south carolina' => 1,'sc' => 1,'south dakota' => 1,'sd' => 1,'tennessee' => 1,'tn' => 1,'texas' => 1,'tx' => 1,'utah' => 1,'ut' => 1,'vermont' => 1,'vt' => 1,'virginia' => 1,'va' => 1,'washington' => 1,'wa' => 1,'west virginia' => 1,'wv' => 1,'wisconsin' => 1,'wi' => 1,'wyoming' => 1,'wy' => 1}

    @current_user =  User.find_by(email: session[:email])
    @property = property || Property.new(prop_params)
    if(@current_user)
     @property.user = @current_user.id
    end
    same_prop = Property.find_by(address: @property.address)
    if(same_prop && same_prop.city == @property.city && same_prop.zipcode == @property.zipcode)
      flash[:danger] = "Property already Exists"
      redirect_to dash_path
      return
    end
    @property.tenant_phone = params[:property][:tenant_phone]
    @property.zipcode = params[:property][:zipcode]
    @property.address = params[:property][:address]
    @property.city = params[:property][:city]
    @property.state = params[:property][:state]
    @property.prop_name = params[:property][:prop_name]
    @property.tenant_name = params[:property][:tenant_name]
    
    if(@states[@property.state.downcase] != 1)
        flash[:warning] = "Please enter a valid state"
        redirect_to dash_path
        return    
    end
    if !(@property.zipcode =~ /\b\d{5}\b/)
        flash[:warning] = "Please enter a valid zipcode"
        redirect_to dash_path
        return    
    end
    puts @property.address.length
    if (@property.address.length < 8 || @property.address.length > 40 || !(@property.address=~ /\d/) || !(@property.address=~ /[a-zA-Z+]/))
        flash[:warning] = "Please enter a valid address"
        redirect_to dash_path
        return    
    end
    
    if !(@property.city =~ /[a-zA-Z]/) || @property.city.length > 40
        flash[:warning] = "Please enter a valid city"
        redirect_to dash_path
        return    
    end
    if @property && (!(@property.tenant_name =~ /[0-9a-zA-Z]/) || @property.tenant_name.length > 40)
        flash[:warning] = "Please enter a valid tenant name"
        redirect_to dash_path
        return    
    end
    if @property.prop_name != "" && !(@property.prop_name =~ /[a-zA-Z]/) || @property.prop_name.length > 40
        flash[:warning] = "Please enter a valid property name"
        redirect_to dash_path
        return    
    end

    if(@property.save)
      session[:test] = @property.user
      session[:properties] = Property.where(user: User.find_by(email: session[:email]))
      puts session[:properties].length
      redirect_to dash_path
    else
      # flash[:warning] = "Property Not Saved"
      redirect_to dash_path ###FIXME
    end
  end

  def add
    if !Property.exists?(id: params[:id])
      render "properties/error",  layout: false, status: :not_found
    end
  end

  private 
      def prop_params
        params.require(:property).permit(:prop_name, :tenant_name, :tenant_email, :tenant_phone, :address, :frequency, :city, :state, :zipcode)
      end
  end

