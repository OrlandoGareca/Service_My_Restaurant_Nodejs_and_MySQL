var API_KEY = 1234
var mysql = require('mysql')
var express = require('express')
var router = express.Router()
var moment = require('moment')

//var crypto = require('crypto');
//var uuid = require('uuid')

//var con = mysql.createConnection({
//    host: 'localhost',
//    user: 'root',
//    password: '',
//    database: 'myrestaurant'
//})



//password ultil
/*var genRandomString = function (length) {
    return crypto.randomBytes(Math.ceil(length/2))
        .toString('hex')// convert to hexa format
        .slice(0, length); //return required number of characters
}

var sha512 = function (password, salt) {
    var hash = crypto.createHmac('sha512', salt); //use sha512
    hash.update(password);
    var value = hash.digest('hex');
    return {
        salt: salt,
        passwordHash: value
    };
};

function saltHashPassword(userPassword) {
    var salt = genRandomString(16); // gen random string with 16 character to salt
    var passwordData = sha512(userPassword, salt);
    return passwordData;
}
function checkHashPassword(userPassword, salt) {
    var passwordData = sha512(userPassword, salt);
    return passwordData;
}*/

//register err
//change /register/
/*router.post('/users/', (req, res, next) => {
    console.log(req.body)
    if (req.body.key == API_KEY) {
        var post_data = req.body; // get POST params
        //var uid = uid.v4();//Get UUID v4 like '123124asd-123124ads-123124a-asdaa
        var plaint_password = post_data.password;//get password from post params
        var hash_data = saltHashPassword(plaint_password);
        var password = hash_data.passwordHash; //get hash value
        var salt = hash_data.salt; //get salt

        var fbid = req.body.fbid;
        var UserPhone = post_data.UserPhone;
        var Name = post_data.Name;
        var Email = post_data.email;
        //var password = post_data.encrypted_password;
        //var salt = post_data.salt;
        var Address = post_data.Address;
        if (fbid != null) {
            req.getConnection(function (error, conn) {
                conn.query('SELECT * FROM User WHERE email=?', [Email], function (err, result, fields) {
                    conn.on('error', function (err) {
                        console.log('[MySQL ERROR]', err);
                        console.log("entra")
                    });
                    if (result && result.length)
                        res.json('Usuario ya existe..!');
                    else {//cambiar FBID para que sea autoincremental entero
                        conn.query('INSERT INTO User (FBID, UserPhone, Name, email, encrypted_password, salt, Address, created_at, updated_at)' +
                            ' VALUES (?,?,?,?,?,?,?,NOW(),NOW())', [fbid, UserPhone, Name, Email, password, salt, Address], function (err, result, fields) {
                                conn.on('error', function (err) {
                                    console.log('[MySQL ERROR]', err);
                                    res.json('Register error: ', err);
                                });
                                console.log(conn.query)
                                res.json('Register successful');
                            })
                    }
                });
            })
        }
        else {
            res.send(JSON.stringify({ success: false, message: "Missing fbid in body" }))
        }
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})*/
//
//router.get("/", (req, res, next) => {
//    console.log('Password: 123456');
//    var encrypt = saltHashPassword("123456");
//    console.log('Encrypt: ' + encrypt.passwordHash);
//    console.log('Salt:' + encrypt.salt);
//})
//
/*router.post('/login/', (req, res, next) => {
    var post_data = req.body;
    //extract email and password from request
    var user_password = post_data.password;
    var Email = post_data.email;
    req.getConnection(function (error, conn) {
        conn.query('SELECT * FROM User WHERE email=?', [Email], function (err, result, fields) {
            conn.on('error', function (err) {
                console.log('[MySQL ERROR]', err);

            });

            if (result && result.length) {
                var salt = result[0].salt; //get salt  of result if account exists
                var encrypted_password = result[0].encrypted_password;
                var hashed_password = checkHashPassword(user_password, salt).passwordHash;
                if (encrypted_password == hashed_password)
                    res.end(JSON.stringify(result[0]))//if password is true, return all info of user
                else
                    res.end(JSON.stringify('contraseña incorrecta'));
            }
            else {//cambiar FBID para que sea autoincremental entero
                res.json('Usuario no existe..!');
            }
        });
    })
})*/







/*
 * TEST API
 *  */
router.get('/', function (req, res, next) {
    res.send("API Corriendo")
})

//==========================================
//USER TABLE
// POST / GET
//===========================================
router.get('/user', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {
        var fbid = req.query.fbid
        if (fbid != null) {
            req.getConnection(function (error, conn) {
                conn.query('SELECT userPhone,name,address,fbid FROM User WHERE fbid=?', [fbid], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            })
        }
        else {
            res.send(JSON.stringify({ success: false, message: "Missing fbid in query" }))
        }
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))   
    }        
})
router.post('/user', function (req, res, next) {
    console.log(req.query);
    if (req.body.key == API_KEY) {
        var fbid = req.body.fbid
        var user_phone = req.body.UserPhone
        var user_name= req.body.userName
        var user_address = req.body.userAddress

        if (fbid != null) {
            req.getConnection(function (error, conn) {
                conn.query('INSERT INTO User(FBID,UserPhone,Name,Address) VALUES(?,?,?,?) ON DUPLICATE KEY UPDATE Name=?,Address=?', [fbid,user_phone,user_name,user_address,user_name,user_address], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.affectedRows > 0) {
                            res.send(JSON.stringify({ success: true, message: "Success" }))
                        }
                    
                    }
                })
            })
        }
        else {
            res.send(JSON.stringify({ success: false, message: "Missing fbid in body" }))
        }
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))   
    }        
})


/*router.post('/register/', (req, res, next) => {
    console.log(req.body)
    if (req.body.key == API_KEY) {
        var post_data = req.body; // get POST params
        //var uid = uid.v4();//Get UUID v4 like '123124asd-123124ads-123124a-asdaa
        var plaint_password = post_data.password;//get password from post params
        var hash_data = saltHashPassword(plaint_password);
        var password = hash_data.passwordHash; //get hash value
        var salt = hash_data.salt; //get salt

        var fbid = req.body.fbid;
        var UserPhone = post_data.UserPhone;
        var Name = post_data.Name;
        var Email = post_data.email;
        //var password = post_data.encrypted_password;
        //var salt = post_data.salt;
        var Address = post_data.Address;
        console.log(plaint_password,fbid,UserPhone,Name,Email,API_KEY)
       
            req.getConnection(function (error, conn) {
                conn.query('SELECT * FROM User WHERE email=?', [Email], function (err, result, fields) {
                    conn.on('error', function (err) {
                        console.log("entra"),
                        console.log('[MySQL ERROR]', err);
                        
                    });
                    if (result && result.length)
                        console.log("entra usuario ya existe"),
                        res.json('Usuario ya existe..!');
                        
                    else {//cambiar FBID para que sea autoincremental entero
                        conn.query('INSERT INTO User (UserPhone, Name, email, encrypted_password, salt, Address, created_at, updated_at)' +
                            ' VALUES (?,?,?,?,?,?,NOW(),NOW())', [UserPhone, Name, Email, password, salt, Address], function (err, rows, fields) {
                            if (err) {
                                res.status(500)
                                console.log(err)
                                res.send(JSON.stringify({ success: false, message: err.message }))
                            }
                            else {
                                if (rows.affectedRows > 0) {
                                    res.send(JSON.stringify({ success: true, message: "Registro exitoso" }))
                                }
                            
                            }
                        })
                    }
                });
            })
       
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Clave APi incorrecta" }))
    }        
})*/

//==========================================    
//FAVORITE TABLE
// GET / POST / DELETE
//===========================================
router.get('/favorite', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {
        var fbid = req.query.fbid
        if (fbid != null) {
            req.getConnection(function (error, conn) {
                conn.query('SELECT fbid,foodId,restaurantId,restaurantName,foodName,foodImage,price FROM Favorite WHERE fbid=?', [fbid], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            })
        }
        else {
            res.send(JSON.stringify({ success: false, message: "Missing fbid in query" }))
        }
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

router.get('/favoriteByRestaurant', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {
        var fbid = req.query.fbid
        var restaurant_id = req.query.restaurantId
        if (fbid != null) {
            req.getConnection(function (error, conn) {
                conn.query('SELECT fbid,foodId,restaurantId,restaurantName,foodName,foodImage,price FROM Favorite WHERE fbid=? AND restaurantId=?', [fbid, restaurant_id], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            })
        }
        else {
            res.send(JSON.stringify({ success: false, message: "Missing fbid in query" }))
        }
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

router.post('/favorite', (req, res, next) => {
    console.log(req.body)
    if (req.body.key == API_KEY) {
        var fbid = req.body.fbid
        var food_id = req.body.foodId
        var restaurant_id = req.body.restaurantId
        var restaurant_name = req.body.restaurantName
        var food_name = req.body.foodName
        var food_image = req.body.foodImage
        var food_price = req.body.price
        if (fbid != null) {
            req.getConnection(function (error, conn) {
                conn.query('INSERT INTO Favorite(FBID, FoodId,RestaurantId,RestaurantName,FoodName,FoodImage,Price) VALUES(?,?,?,?,?,?,?)', [fbid, food_id, restaurant_id, restaurant_name, food_name, food_image, food_price], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.affectedRows > 0) {
                            res.send(JSON.stringify({ success: true, message: "Success" }))
                        }

                    }
                })
            })
        }
        else {
            res.send(JSON.stringify({ success: false, message: "Missing fbid in body" }))
        }
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

router.delete('/favorite', function (req, res, next)  {
    console.log(req.query);
    if (req.query.key == API_KEY) {
        var fbid = req.query.fbid
        var food_id = req.query.foodId
        var restaurant_id = req.query.restaurantId
        if (fbid != null) {
            req.getConnection(function (error, conn) {
                conn.query('DELETE FROM Favorite WHERE FBID=? AND FoodId=? AND RestaurantId=?', [fbid, food_id, restaurant_id], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.affectedRows > 0) {
                            res.send(JSON.stringify({ success: true, message: "Success" }))
                        }
                       
                    }
                })
            })
        }
        else {
            res.send(JSON.stringify({ success: false, message: "Missing fbid in query" }))
        }
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

//==========================================
//RESTAURANTE TABLE
// GET 
//===========================================
router.get('/restaurant', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {
      
       
            req.getConnection(function (error, conn) {
                conn.query('SELECT name,address,phone,lat,lng,userOwner,image,paymentUrl FROM Restaurant', function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            })
        }
        
    
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

router.get('/restaurantById', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {

        
        req.getConnection(function (error, conn) {
            var restaurant_id = req.query.restaurantId
            if (restaurant_id != null) {
                conn.query('SELECT name,address,phone,lat,lng,userOwner,image,paymentUrl FROM Restaurant WHERE id=?', [restaurant_id], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            }
                else {
                    res.send(JSON.stringify({ success: false, message: "Missing restaurantId in query" }))
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

router.get('/nearbyrestaurant', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {


        req.getConnection(function (error, conn) {

            var user_lat = parseFloat(req.query.lat)
            var user_lng = parseFloat(req.query.lng)
            var distance = parseFloat(req.query.distance)

            if (user_lat != Number.NaN && user_lng != Number.NaN) {

                conn.query('SELECT * FROM (SELECT id,name,address,phone,lat,lng,userOwner,image,paymentUrl,'
                    + 'ROUND(111.045 * DEGREES(ACOS(COS(RADIANS(?)) * COS(RADIANS(lat))'
                    + '* COS(RADIANS(lng) - RADIANS(?)) + SIN(RADIANS(?))'
                    + '* SIN(RADIANS(lat)))),2) AS distance_in_km FROM Restaurant)tempTable WHERE distance_in_km < ?', [user_lat, user_lng, user_lat, distance], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            }
            else {
                res.send(JSON.stringify({ success: false, message: "Missing lat and lng in query" }))  
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})


//==========================================
//MENU TABLE
// GET 
//===========================================

router.get('/menu', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {


        req.getConnection(function (error, conn) {
            var restaurant_id = req.query.restaurantId
            if (restaurant_id != null) {
                conn.query('SELECT id,name,description,image FROM Menu WHERE id in (SELECT menuId FROM Restaurant_Menu WHERE restaurantId=?)', [restaurant_id], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            }
            else {
                res.send(JSON.stringify({ success: false, message: "Missing restaurantId in query" }))
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})
//==========================================
//FOOD TABLE
// GET 
//===========================================
router.get('/food', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {


            var menu_id = req.query.menuId
        req.getConnection(function (error, conn) {
            if (menu_id != null) {
                conn.query('SELECT id,name,description,image,price, CASE WHEN isSize=1 THEN \'TRUE\' ELSE \'FALSE\' END as isSize,'
                    + 'CASE WHEN isAddon=1 THEN \'TRUE\' ELSE \'FALSE\' END as isAddon,'
                    + 'discount FROM Food WHERE id in (SELECT foodId FROM Menu_Food WHERE menuId=?)', [menu_id], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            }
            else {
                res.send(JSON.stringify({ success: false, message: "Missing menuId in query" }))
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

router.get('/foodById', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {
       
        req.getConnection(function (error, conn) {
            var food_id = req.query.foodId
            if (food_id != null) {
                conn.query('SELECT id,name,description,image,price, CASE WHEN isSize=1 THEN \'TRUE\' ELSE \'FALSE\' END as isSize,'
                    + 'CASE WHEN isAddon=1 THEN \'TRUE\' ELSE \'FALSE\' END as isAddon,'
                    + 'discount FROM Food WHERE id=?', [food_id], function (err, rows, fields) {
                        if (err) {
                            res.status(500)
                            res.send(JSON.stringify({ success: false, message: err.message }))
                        }
                        else {
                            if (rows.length > 0) {
                                res.send(JSON.stringify({ success: true, result: rows }))
                            }
                            else {
                                res.send(JSON.stringify({ success: false, message: "Empty" }))
                            }
                        }
                    })
            }
            else {
                res.send(JSON.stringify({ success: false, message: "Missing foodId in query" }))
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})


router.get('/searchfood', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {

        req.getConnection(function (error, conn) {
            var search_query = '%' + req.query.foodName+ '%'
            if (search_query != null) {
                conn.query('SELECT id,name,description,image,price, CASE WHEN isSize=1 THEN \'TRUE\' ELSE \'FALSE\' END as isSize,'
                    + 'CASE WHEN isAddon=1 THEN \'TRUE\' ELSE \'FALSE\' END as isAddon,'
                    + 'discount FROM Food WHERE name LIKE ?', [search_query], function (err, rows, fields) {
                        if (err) {
                            res.status(500)
                            res.send(JSON.stringify({ success: false, message: err.message }))
                        }
                        else {
                            if (rows.length > 0) {
                                res.send(JSON.stringify({ success: true, result: rows }))
                            }
                            else {
                                res.send(JSON.stringify({ success: false, message: "Empty" }))
                            }
                        }
                    })
            }
            else {
                res.send(JSON.stringify({ success: false, message: "Missing foodName in query" }))
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

//==========================================
//SIZE TABLE
// GET 
//===========================================
router.get('/size', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {


        var food_id = req.query.foodId
        req.getConnection(function (error, conn) {
            if (food_id != null) {
                conn.query('SELECT id,description,extraPrice FROM Size WHERE id in (SELECT sizeId FROM Food_Size WHERE foodId=?)', [food_id], function (err, rows, fields) {
                        if (err) {
                            res.status(500)
                            res.send(JSON.stringify({ success: false, message: err.message }))
                        }
                        else {
                            if (rows.length > 0) {
                                res.send(JSON.stringify({ success: true, result: rows }))
                            }
                            else {
                                res.send(JSON.stringify({ success: false, message: "Empty" }))
                            }
                        }
                    })
            }
            else {
                res.send(JSON.stringify({ success: false, message: "Missing foodId in query" }))
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})
//==========================================
//ADDON TABLE
// GET 
//===========================================
router.get('/addon', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {
        var food_id = req.query.foodId
        req.getConnection(function (error, conn) {
            if (food_id != null) {
                conn.query('SELECT id,description,extraPrice FROM Addon WHERE id in (SELECT AddonId FROM Food_Addon WHERE foodId=?)', [food_id], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            }
            else {
                res.send(JSON.stringify({ success: false, message: "Missing foodId in query" }))
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

//==========================================
//ORDER  TABLE
// GET / POST
//===========================================
router.get('/order', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {
       
        req.getConnection(function (error, conn) {
            var order_fbid = req.query.orderFBID
            if (order_fbid != null) {
                conn.query('SELECT orderId,orderFBID,orderPhone,orderName,orderAddress,orderStatus,orderDate,'
                    + 'restaurantId,transactionId,'
                    + 'CASE WHEN cod=1 THEN \'TRUE\' ELSE \'FALSE\' END as cod,'
                    + 'totalPrice,numOfItem FROM `Order` WHERE orderFBID =? AND numOfItem > 0'
                    + ' ORDER BY orderId DESC', [order_fbid], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {
                        if (rows.length > 0) {
                            res.send(JSON.stringify({ success: true, result: rows }))
                        }
                        else {
                            res.send(JSON.stringify({ success: false, message: "Empty" }))
                        }
                    }
                })
            }
            else {
                res.send(JSON.stringify({ success: false, message: "Missing orderFBID in query" }))
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

router.post('/createOrder', function (req, res, next) {
    console.log(req.body)
    console.log(API_KEY)
    if (req.body.key == API_KEY) {
        var order_phone = req.body.orderPhone
        var order_name = req.body.orderName
        var order_address = req.body.orderAddress
        var order_date = moment(req.body.orderDate, "MM/DD/YYYY").format("YYYY-MM-DD");
        var restaurant_id = req.body.restaurantId
        var transaction_id = req.body.transactionId
        var cod = req.body.cod
        var total_price = req.body.totalPrice
        var num_of_item = req.body.numOfItem
        var order_fbid = req.body.orderFBID
        console.log(order_fbid)
        if (order_fbid != null) {
            req.getConnection(function (error, conn) {
                conn.query('INSERT INTO `Order`(OrderFBID,OrderPhone,OrderName,OrderAddress,OrderStatus,OrderDate,RestaurantId,'
                    + 'TransactionId,COD,TotalPrice,NumOfItem) VALUES(?,?,?,?,?,?,?,?,?,?,?)', [order_fbid, order_phone, order_name, order_address, 0, order_date, restaurant_id, transaction_id, cod, total_price, num_of_item], function (err, rows, fields) {
                    if (err) {
                        res.status(500)
                        res.send(JSON.stringify({ success: false, message: err.message }))
                    }
                    else {       
                        conn.query('SELECT OrderId as orderNumber FROM `Order` WHERE OrderFBID=? AND NumOfItem > 0 '
                            + ' ORDER BY orderNumber DESC  LIMIT 1', [order_fbid], function (err, rows, fields) {
                                if (err) {
                                    res.status(500)
                                    res.send(JSON.stringify({ success: false, message: err.message }))
                                }
                                else {
                                    res.send(JSON.stringify({ success: false,  result:rows }))
                                }
                            })

                    }
                })
            })
        }
        else {
            res.send(JSON.stringify({ success: false, message: "Missing orderFBID in body" }))
        }
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})
//==========================================
//ORDERDETAIL TABLE
// GET / POST
//===========================================
router.get('/orderDetail', function (req, res, next) {
    console.log(req.query);
    if (req.query.key == API_KEY) {

        req.getConnection(function (error, conn) {
            var order_id = req.query.orderId
            if (order_id != null) {
                conn.query('SELECT orderId,itemId,quantity,discount,extraPrice,size,addOn FROM OrderDetail WHERE orderId=?', [order_id], function (err, rows, fields) {
                        if (err) {
                            res.status(500)
                            res.send(JSON.stringify({ success: false, message: err.message }))
                        }
                        else {
                            if (rows.length > 0) {
                                res.send(JSON.stringify({ success: true, result: rows }))
                            }
                            else {
                                res.send(JSON.stringify({ success: false, message: "Empty" }))
                            }
                        }
                    })
            }
            else {
                res.send(JSON.stringify({ success: false, message: "Missing orderId in query" }))
            }
        })
    }


    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})

router.post('/updateOrder', function (req, res, next) {
    console.log(req.body)
  
    if (req.body.key == API_KEY) {
        var order_id = req.body.orderId
        var order_detail

        try {
            order_detail = JSON.parse(req.body.orderDetail)
        }
        catch (err) {
            res.status(500)
            res.send(JSON.stringify({ success: false, message: err.message }))
        }
        if (order_detail != null && order_id != null) {
            var data_insert = []
            for (i = 0; i < order_detail.length; i++) {
                data_insert[i] = [
                    parseInt(order_id),
                    order_detail[i]["foodId"],
                    order_detail[i]["foodQuantity"],
                    order_detail[i]["foodPrice"],
                    0, //discount
                    order_detail[i]["foodsize"],
                    order_detail[i]["foodAddon"],
                    parseFloat(order_detail[i]["foodExtraPrice"]),
                ]
            }
        
            req.getConnection(function (error, conn) {
                conn.query('INSERT INTO OrderDetail(OrderId,ItemId,Quantity,Price,Discount,Size,Addon,ExtraPrice) VALUES(?)', data_insert,  function (err, rows, fields) {
                        if (err) {
                            res.status(500)
                            res.send(JSON.stringify({ success: false, message: err.message }))
                        }
                        else {
                            
                            res.send(JSON.stringify({ success: true, message: "update success" }))
                        }
                    })
            })
        }
        else {
            res.send(JSON.stringify({ success: false, message: "Missing orderId and orderDetail in body" }))
        }
    }
    else {
        res.send(JSON.stringify({ success: false, message: "Wrong APi key" }))
    }
})



module.exports = router;