# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# user = User.create(name: 'admin',email: 'zolget86@gmail.com',password:'Z0|a@3783',role:'superadmin')

Mentor.destroy_all

Mentor.create([{                                                 
  email: "kalumunabisimwa5@gmail.com",                        
  bio: "Full-Stack Web Developer",                            
  name: "Alfred Bisimwa",                                     
  phone: "+251924561527",                                     
  approved: true,                                             
  img_url: "https://avatars.githubusercontent.com/u/88894525?v=4"
},
{
  email: "zieecosam@gmail.com",
  bio: "Full-Stack Developer",
  name: "Isaac Imaobong Samuel",
  phone: "+251924561527",
  approved: true,
  img_url: "https://avatars.githubusercontent.com/u/59397159?v=4"
},
 { 
  email: "wuletawwonte@gmail.com",
  bio: "Full-stack developer",
  name: "Wuletaw Wonte",
  phone: "+251924561527",
  approved: true,
  img_url: "https://avatars.githubusercontent.com/u/12524453?v=4"
},
{
  email: "adismail4@gmail.com",
  bio: "Full-Stack web Developer",
  name: "Ismail Akinkunmi",
  phone: "+251924561527",
  approved: true,
  img_url: "https://avatars.githubusercontent.com/u/37457094?v=4"
},
{ 
  email: "me1@gmail.com",
  bio: "Full stack developer",
  name: "Zelalem Mekonnen",
  phone: "+251924561527",
  approved: true,
  img_url: "https://avatars.githubusercontent.com/u/37457094?v=4"
}
])

p "Created #{Mentor.count} Mentors"
