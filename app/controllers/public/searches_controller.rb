class Public::SearchesController < ApplicationController
	#全てのアクションの前にユーザーがログインしているか確認する。
  #ログインしていない時、ログインページに遷移。
  before_action :authenticate_customer!

	def search
		# @model = params[:model]
		@content = params[:content]
		# @method = params[:method]
		# @records = Item.search_for(@content)
		@records = Item.where('name LIKE ?', '%'+@content+'%')
	end
end