class SagesController < ApplicationController

attr_accessor :thought, :explenation
attr_reader :id

  def initialize(thought, explenation, id=nil)
    @thought = thought
  @explenation = explenation
    @id = id
end

  def save
   if self.id
     self.update
   else
    sql = <<-SQL
      INSERT INTO sages (thought, explenation)
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.thought, self.explenation)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM sages")[0][0]
  end
end

        def self.create(thought:, explenation:)
          sage = Sage.new(thought, explenation)
          sage.save
          sage
        end

  def self.find_by_id(id)
    sql = "SELECT * FROM sages WHERE id = ?"
    result = DB[:conn].execute(sql, thought)[0]
    Sage.new(result[0], result[1], result[2])
end

      def update
        sql = "UPDATE songs SET thought = ?, explenation = ? WHERE id = ?"
        DB[:conn].execute(sql, self.thought, self.explenation, self.id)
      end

  def self.find_or_create_by(thought:, explenation:)
    sage = DB[:conn].execute("SELECT * FROM sages WHERE thought = ? AND explenation = ?, thought,
      explenation")
    if !sage.empty?
      sage_data = sage[0]
      sage = Sage.new(sage_data[0], sage_data[1], sage_data[2])
    else
    sage
  end

end



get "/index" do

  erb :index
end
end
