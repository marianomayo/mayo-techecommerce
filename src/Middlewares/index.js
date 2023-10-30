const { validationResult } = require("express-validator");

const validarErrores = (req, res, next) => {
  const resultado = validationResult(req);
  if (!resultado.isEmpty()) {
    res.status(404).send({
      errors: resultado.array(),
    });
    return;
  }
  next();
};

module.exports = {
  validarErrores,
};
