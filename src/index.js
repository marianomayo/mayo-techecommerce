const express = require("express");

const session = require('express-session');
const PORT = 3000;

const db = require("./db");

const ProductRouter = require("./Router/ProductRouter");

const BrandRouter = require("./Router/BrandRouter");

const PageRouter = require("./Router/PageRouter");

const UserRouter = require("./Router/UserRouter");
const middlewareDePrueba = (req, res, next) => {
  console.log("Llego una petición al servidor");
  next();
};

const app = express();

app.use(
  session({
    secret: "secreto123",
    resave: false,
    saveUninitialized: false,
    cookie: {maxAge: 60 * 60 * 100},
  })
);

app.use(express.json());

app.use(middlewareDePrueba);

app.use(express.static("public"));


app.use("/", PageRouter); 

app.use("/brand", BrandRouter);


app.use("/user", UserRouter);

/*Entrega parte 4 product */
app.use("/product", ProductRouter);

app.listen(PORT, () => {
  db.authenticate().then(() => console.log("Conectado a la base de datos!"));
  console.log(`Servidor corriendo en el puerto: ${PORT}`);
});