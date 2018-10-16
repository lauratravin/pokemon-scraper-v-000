require "pry"
class Pokemon

  attr_accessor :db,:name,:type,:id,:hp

  @@all = []
  def initialize (id:,name:,type:,db:)   #key argument. Decent explanation here https://medium.com/@tyler_brewer2/utilizing-ruby-keyword-arguments-462ba8366483
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name,type,db)
    ins = db.prepare("INSERT INTO pokemon (name,type) VALUES (?, ?)")
    ins.execute(name,type)

  #  ins = db.execute.("INSERT INTO pokemon (name,type) VALUES (?, ?)", name, type) is the same that above.
  end

  def self.find(id,db)
    arr = db.execute("SELECT id,name,type FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: arr[0],name: arr[1], type: arr[2], db: db)
  end

  def alter_hp(val,db)
    # binding.pry
    # array1 = db.execute("SELECT * FROM pokemon").flatten
    id = self.id
    # val = 1
    result = db.execute("UPDATE Pokemon SET hp = \"#{val}\" WHERE id = ?",id).flatten
  end


end
