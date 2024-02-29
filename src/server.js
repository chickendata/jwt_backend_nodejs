import express from "express";
import configViewEngine from "./config/viewEngine";
import initWebRouter from "./routers/web";
import initApiRouter from "./routers/api";
import configCors from "./config/cors";
require("dotenv").config();
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
// import connection from "./config/connectDB";

const app = express();

const PORT = process.env.PORT || 8080;

//config cors
configCors(app);
//config view engine
configViewEngine(app);

//config body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//config cookie parser
app.use(cookieParser());

//Test connection
// connection();

//init web routes
initWebRouter(app);

//init api routes
initApiRouter(app);

app.use((req, res) => {
  return res.send("404 not found");
});
app.listen(PORT, () => {
  console.log(`Server running in port ${PORT}`);
});
