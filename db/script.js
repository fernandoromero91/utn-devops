db = db.getSiblingDB('utn_devops');

db.createUser({
  user: "root",
  pwd: "yari",
  roles: [{ role: "readWrite", db: "utn_devops" }]
});

db.createCollection("users");
db.users.insert({ name: "Fernando Romero", email: "fer.romero@romero.com" });
db.users.insert({ name: "Rafael Arrieta", email: "rafael.arrieta@arrieta.com" });
db.users.insert({ name: "Angel Ariel Montes", email: "angel.ariel.montes@montes.com" });
db.users.insert({ name: "Georgiy Strashko", email: "georgiy.strashko@strashko.com" });
db.users.insert({ name: "Marcelo Nicolas Waisman", email: "marcelo.nicolas.waisman@waisman.com" });