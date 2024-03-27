import "dotenv/config";
import express, { Request, Response } from "express";
import UsuarioRotas from "routes/UsuarioRotas";
import { authentication } from "middlewares/auth";
import { DateTime } from "luxon";

DateTime.local().setZone("America/Sao_Paulo");

const app = express();

app.use(express.json());
app.get("/", (req: Request, res: Response) => {
  res.send("Hello World");
});
app.use("/usuario", authentication, UsuarioRotas);
app.listen(process.env.PORT || 3344);

