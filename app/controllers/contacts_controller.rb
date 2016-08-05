class ContactsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contacts = current_user.contacts
    group = Group.find_by(name: params[:group])
    @contacts = group.contacts.where(user_id: current_user)
  end

  def show
    contact = Contact.find_by(id: params[:id])
    if current_user.contacts.include?(contact)
      @contact = contact
    else
      flash[:warning] = "You can only view your contatcs "
      redirect_to '/contacts'
    end
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @contact = Contact.create(
    first_name:params[:first_name],
    middle_name:params[:middle_name],
    last_name:params[:last_name],
    email:params[:email],
    phone_number:params[:phone_number],
    bio:params[:bio],
    user_id: current_user.id

    )
    flash[:success] = "Contact created."
    redirect_to "/contacts/#{@contact.id}"

  end



  def edit
    @contact = Contact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(
    first_name:params[:first_name],
    middle_name:params[:middle_name],
    last_name:params[:last_name],
    email:params[:email],
    phone_number:params[:phone_number],
    bio:params[:bio]
    )
    flash[:success] = "Contact updated."
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:success] = "Contact deleted."
    redirect_to "/"
  end
end
