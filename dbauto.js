use admin
db.createUser(
    {
      user: "myUserAdmin",
      pwd: "abc123",
      roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
    });

use data

use auth
db.createUser({user:"Mary", pwd: "123", roles: [{role:"userAdminAnyDatabase", db: "admin"}, {role:"readWrite", db:"auth"}, {role:"readWrite", db:"data"}]});

use data
db.createUser({user:"Om",  pwd: "123", roles: [{role:"userAdminAnyDatabase", db: "admin"}, {role:"readWrite", db:"auth"}, {role:"readWrite", db:"data"}]});

use auth
db.createCollection("users");
db.users.insert({"name":"Daria",pwd: "123",key:"mykey",secret:"mysecret"});
db.users.find();
db.createCollection("tokens");

use data
db.createCollection("accounts");
db.accounts.insert({name:"helloworld",employees:"12",valuation:100});


use admin
db.updateUser("myUserAdmin",{roles:[{role:"readWrite",db:"auth"},{role:"readWrite",db:"data"},{role:"userAdminAnyDatabase",db:"admin"}]});

exit
