# This file should contain all the record creation needed to seed the
# database with its default values.  The data can then be loaded with
# the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Wallet.delete_all
Pocket.delete_all
alice = User.create(username: 'alice',
                    email: 'alice@example.com',
                    password: 'secret',
                    password_confirmation: 'secret')
bob = User.create(username: 'bob',
                  email: 'bob@example.com',
                  password: 'secret',
                  password_confirmation: 'secret')
w1 = Wallet.create(crypto: "aesStandard",
                   ctext: "bdff36f843d24a85409793a893daa8e2488cc893a868ba3531272c69c8b8264fdb593be87e5ad19b423b322fd3e181a42e7509c530d16ee4e04ad4ea0dfb6cd6cc0d426f9ce5d069c153ff9715cac5704a1e0d1360bedac7edb1754dd415b914",
                   name: "No Password",
                   salt: "5020c0c054c460a5")
w2 = Wallet.create(crypto: "aesWeak",
                   ctext:"b69df731ab39c3fbf9f0970297b6e82243a2c8fe4561448222b5e8b8cce49202ed50e1295364ee32319ed11918cd5588",
                   name:"Password is 'test'",
                   salt:"24afb667036033b")
w3 = Wallet.create(name: 'Empty')
Pocket.create(user: alice,
              wallet: w1,
              access: :rw)
Pocket.create(user: alice,
              wallet: w2,
              access: :rw)
Pocket.create(user: bob,
              wallet: w1,
              access: :ro)
Pocket.create(user: bob,
              wallet: w3,
              access: :rw)

