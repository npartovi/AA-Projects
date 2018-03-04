require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns

    return @columns if @columns
    data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        cats
    SQL

    @columns = data.first.map {|el| el.to_sym}
    
  end

  def self.finalize!

    self.columns.each do |name|
      define_method(name) do
        self.attributes[name]
      end

      define_method("#{name}=") do |arg|
        self.attributes[name] = arg
      end
    end

    @attributes
  end

  def self.table_name=(table_name)

    @table_name = table_name
    
  end

  def self.table_name

    @table_name || self.to_s.tableize
    
  end
  
  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})

    params.each do |key, value|
      if self.class.columns.include?(key.to_sym)
        self.send.()


  end

  def attributes

    @attributes = {} unless @attributes
    @attributes
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
