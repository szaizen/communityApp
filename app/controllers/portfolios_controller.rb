class PortfoliosController < ApplicationController

  
  def new
    Portfolio.create(user_id: current_user.id)
    redirect_to edit_portfolio_path, notice: 'success!'
  end

  def edit

    if Portfolio.find_by(user_id: current_user.id).nil?
      @portfolio = nil;
    else
      @portfolio = Portfolio.find_by(user_id: current_user.id);
      @port = Portfolio.where(user_id: current_user.id);
    end
    
  end
   
  def update
    @portfolios = portfolios_params.to_hash.map do |id, portfolio_param|
      portfolio = Portfolio.find(id)
      portfolio.update_attributes(portfolio_param)
      portfolio
    end
    redirect_to edit_portfolio_path, notice: 'success!'
  end

  def delete
    Portfolio.find(params[:id]).delete
    redirect_to edit_portfolio_path, notice: 'success!'
  end
 
  private
    def portfolios_params
      params.permit(portfolios: [:name, :url, :port_image, :created_date, :details])[:portfolios]
    end

end
