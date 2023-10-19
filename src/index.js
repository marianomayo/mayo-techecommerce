const express = require("express");

const PORT = 3000;

const ProductRouter = require("./Router/ProductRouter");

const middlewareDePrueba = (req, res, next) => {
  console.log("Llego una petición al servidor", req.body);
  next();
};

const app = express();

app.use(express.json());

app.use(middlewareDePrueba);

app.use("/product", ProductRouter);

app.listen(PORT, () => console.log(`Servidor corriendo en el puerto: ${PORT}`));
