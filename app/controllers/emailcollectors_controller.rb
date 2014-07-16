class EmailcollectorsController < ApplicationController

def create
	@emailcollector = Emailcollector.create(params[:emailcollector].permit(:email))
	redirect_to '/'
end

end
