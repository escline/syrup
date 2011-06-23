module Syrup
  class Account
    # known types are :deposit and :credit
    #attr_accessor :id
    #attr_writer :name, :type, :account_number, :current_balance, :available_balance, :prior_day_balance
    attr_reader :id
    
    def name
      populate
      @name
    end
    
    def type
      populate
      @type
    end
    
    def account_number
      populate
      @account_number
    end
    
    def current_balance
      populate
      @current_balance
    end
    
    def available_balance
      populate
      @available_balance
    end
    
    def prior_day_balance
      populate
      @prior_day_balance
    end
    
    def initialize(attr_hash = nil)
      if attr_hash
        attr_hash.each do |k, v|
          instance_variable_set "@#{k}", v
        end
      end
      
      @cached_transactions = []
    end
      
    def populated?
      @populated
    end
    
    def populated=(value)
      @populated = value
    end
    
    def populate
      unless populated? || @institution.nil?
        @institution.populate_account(id)
      end
    end
    
    def ==(other_account)
      other_account.id == id && other_account.is_a?(Account)
    end
    
    def find_transactions()
      
    end
    
    def merge!(account_with_info)
      if account_with_info
        account_with_info.instance_variables.each do |filled_var|
          self.instance_variable_set(filled_var, account_with_info.instance_variable_get(filled_var))
        end
      end
      self
    end
    
    def is_valid?
      populate
      populated?
    end
    
  end
end