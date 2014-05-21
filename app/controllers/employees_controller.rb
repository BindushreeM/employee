class EmployeesController < ApplicationController

	before_filter :require_login
	protect_from_forgery with: :exception
	helper_method :current_user

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def contact_callback
		@contacts = request.env['omnicontacts.contacts']
		@user = request.env['omnicontacts.user']
           puts "List of contacts of #{user[:name]} obtained from #params[:importer]}:"
        @contacts.each do|contact|
           puts "Contact found: name => #{contact[:name]}, email => #{contact[:email]}"
        end
    end

	def index
	    @employees = Employee.search(params[:search]).order("name").page(params[:page]).per( 9 )

        @contacts = request.env['omnicontacts.contacts']
        respond_to do |format|
           format.html
        end
    end

	def new
		@employee = Employee.new
	end
	
	def create
		@employee = Employee.new(employee_params)

		if @employee.save
			redirect_to employees_path
		else
			render 'new'
		end
	end
   
    def show
		@employee=Employee.find(params[:id])
    end


	def edit
		@employee=Employee.find(params[:id])
	end

	def update
		@employee = Employee.find(params[:id])

        if @employee.update(employee_params)
			redirect_to employees_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to employees_path
	end

	def authenticate
        @title = "Google Authetication"
        client_id = "189338697038-1hta85j83cq3eb9825ll54tbgdit9ued.apps.googleusercontent.com"
        google_root_url = "https://accounts.google.com/o/oauth2/auth?state=profile&redirect_uri="+googleauth_url+"&response_type=code&client_id="+client_id.to_s+"&approval_prompt=force&scope=https://www.google.com/m8/feeds/"
        redirect_to google_root_url
    end

    private
	def employee_params
		params.require(:employee).permit(:name, :id_number, :salary, :designation)
	end

end
# index page
