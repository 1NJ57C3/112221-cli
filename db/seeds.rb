# ! What is the GOAL of the seeds?
=begin
  create dummy data
  verify relationships/models
  increase efficency between iteractions
=end

# ! First thing the seed file needs to do?
# DELETE ALL OF OUR DATA

def create_rand_stats
  rand(1..20)
end

puts "Emptying database..."
User.delete_all
Character.delete_all
Equipment.delete_all

puts "Creating Users...."
u1 = User.create(name: "Nick Z")
u2 = User.create(name: "Brooks")
u3 = User.create(name: "Daniel")
u4 = User.create(name: "Grant")
u5 = User.create(name: "Hannah")
u6 = User.create(name: "Nick A")
u7 = User.create(name: "Lance")
u8 = User.create(name: "Tyler")
u9 = User.create(name: "Phil")

puts "Creating Characters...."
c1 = Character.create(name: "Lord Philington", str: create_rand_stats, int: create_rand_stats, wis: create_rand_stats, dex: create_rand_stats, chr: create_rand_stats, lck: create_rand_stats, vit: create_rand_stats, user_id: u9.id)
c2 = Character.create(name: "Captain Stabbin", str: create_rand_stats, int: create_rand_stats, wis: create_rand_stats, dex: create_rand_stats, chr: create_rand_stats, lck: create_rand_stats, vit: create_rand_stats, user_id: u7.id)
c3 = Character.create(name: "gods_lil_angel09578", str: create_rand_stats, int: create_rand_stats, wis: create_rand_stats, dex: create_rand_stats, chr: create_rand_stats, lck: create_rand_stats, vit: create_rand_stats, user_id: u5.id)

puts "Creating Equipment...."
e1 = Equipment.create(item_name: "Royal Staff", stat: 3, positive: true, character_id: c1.id)
e2 = Equipment.create(item_name: "Royal Garb", stat: 10, positive: false, character_id: c1.id)
e3 = Equipment.create(item_name: "Pointy Dagger", stat: 7 , positive: false, character_id: c2.id)
e4 = Equipment.create(item_name: "Hunter's Bow", stat: 5 , positive: true, character_id: c3.id)

puts "DONE!"