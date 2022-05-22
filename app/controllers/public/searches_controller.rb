class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!
	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		@records = Item.search_for(@content, @method)
	end
end