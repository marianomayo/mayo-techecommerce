const express = require("express");

const PORT = 3000;

const db = require("./db");

const ProductRouter = require("./Router/ProductRouter");

const BrandRouter = require("./Router/BrandRouter");

const PageRouter = require("./Router/PageRouter");

const middlewareDePrueba = (req, res, next) => {
  console.log("Llego una petición al servidor");
  next();
};

const app = express();

app.use(express.json());

app.use(middlewareDePrueba);

app.use(express.static("public"));


app.use("/", PageRouter); 

app.use("/product", ProductRouter);

app.use("/brand", BrandRouter);

app.listen(PORT, () => {
  db.authenticate().then(() => console.log("Conectado a la base de datos!"));
  console.log(`Servidor corriendo en el puerto: ${PORT}`);
});