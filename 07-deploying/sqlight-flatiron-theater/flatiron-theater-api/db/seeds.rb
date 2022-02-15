p1 = Production.create(title: 'Hamlet', genre: 'drama', director:'Bill Shakespeare', description:'The Tragedy of Hamlet, Prince of Denmark', budget: 100000.00, image:'https://upload.wikimedia.org/wikipedia/commons/6/6a/Edwin_Booth_Hamlet_1870.jpg', ongoing:true)
p2 = Production.create(title: 'cats', genre: 'musical', director:'Andrew Lloyd Webber', description:' Jellicles cats sing and dance', budget: 200000.00, image:'https://upload.wikimedia.org/wikipedia/en/3/3e/CatsMusicalLogo.jpg', ongoing:true)
p3 = Production.create(title: 'Carmen', genre: 'opera', director:'Georges Bizet', description:'Don José and Escamillo fight over Carmen', budget: 100000.00, image:'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Prudent-Louis_Leray_-_Poster_for_the_premi%C3%A8re_of_Georges_Bizet%27s_Carmen.jpg/875px-Prudent-Louis_Leray_-_Poster_for_the_premi%C3%A8re_of_Georges_Bizet%27s_Carmen.jpg', ongoing:false)
p4 = Production.create(title: 'Swan Lake', genre: 'ballet', director:'Giscard Rasquin and Pyotr Ilyich Tchaikovsky', description:'The story of Odette, a princess turned into a swan by an evil sorcerers curse. ', budget: 50000.00, image:'https://upload.wikimedia.org/wikipedia/commons/3/3c/Swanlakemordkin.jpg', ongoing:false)


ProductionRole.create(role:'Hamlet', understudy:true, production: p1)
ProductionRole.create(role:'Ophelia', understudy:true, production: p1)



ProductionRole.create(role:'Grizabella', understudy:true, production: p2)
ProductionRole.create(role:'Mr.Mistoffelees', understudy:false, production: p2)


ProductionRole.create(role:'Carmen', understudy:true, production: p3)
ProductionRole.create(role:'Don José', understudy:false, production: p3)

ProductionRole.create(role:'Odette', understudy:true, production: p4)
ProductionRole.create(role:'Odile', understudy:true, production: p4)

u1 = User.create(name:'ix', password:'123', email:'email@gmail.com')
u2 = User.create(name:'rose', password:'123', email:'rose@gmail.com')
u3 = User.create(name:'ted', password:'123', email:'ted@gmail.com')
u4 = User.create(name:'bill', password:'123', email:'bill123@gmail.com')
u5 = User.create(name:'ridly', password:'123', email:'aliens_r_4real@gmail.com')
u6 = User.create(name:'bishop', password:'123', email:'not_a_robot@gmail.com')




Ticket.create(user:u1, production:p2, price:65.00)
Ticket.create(user:u2, production:p2, price:65.00)
Ticket.create(user:u2, production:p1, price:65.00)

Ticket.create(user:u3, production:p4, price:65.00)
Ticket.create(user:u4, production:p3, price:65.00)
Ticket.create(user:u3, production:p3, price:65.00)

Ticket.create(user:u5, production:p4, price:65.00)
Ticket.create(user:u5, production:p3, price:65.00)
Ticket.create(user:u6, production:p1, price:65.00)
Ticket.create(user:u6, production:p2, price:65.00)
Ticket.create(user:u6, production:p3, price:65.00)
Ticket.create(user:u6, production:p4, price:65.00)