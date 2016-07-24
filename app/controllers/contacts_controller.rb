class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @contacts = Contact.new(
    first_name:params[:first_name],
    last_name:params[:last_name],
    email:params[:email],
    phone_number:params[:phone_number]
    )
    Contact.save
    render "create.html.erb"
  end

  def show
    @contacts = Contact.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @contacts = Contact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @contacts = Contact.find_by(id: params[:id])
    @contacts.update(
    first_name:params[:first_name],
    last_name:params[:last_name],
    email:params[:email],
    phone_number:params[:phone_number]
    )
    render "update.html.erb"
  end

  def destroy
    @contacts = Contact.find_by(id: params[:id])
    @contacts.destroy
    render "destroy.html.erb"
  end


end
