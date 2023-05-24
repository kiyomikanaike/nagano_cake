class Public::AddressController < ApplicationController

def new
end

def create
end

def edit
end

def update
end

def destroy
end

private

def address_params
    params.require(:address).permit(:address_postal_code,:address_address,:address_name)
end

end