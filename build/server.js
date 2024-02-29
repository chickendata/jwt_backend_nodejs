"use strict";

var _express = _interopRequireDefault(require("express"));
var _viewEngine = _interopRequireDefault(require("./config/viewEngine"));
var _web = _interopRequireDefault(require("./routers/web"));
var _api = _interopRequireDefault(require("./routers/api"));
var _cors = _interopRequireDefault(require("./config/cors"));
var _bodyParser = _interopRequireDefault(require("body-parser"));
var _cookieParser = _interopRequireDefault(require("cookie-parser"));
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }
require("dotenv").config();
// import connection from "./config/connectDB";

var app = (0, _express["default"])();
var PORT = process.env.PORT || 8080;

//config cors
(0, _cors["default"])(app);
//config view engine
(0, _viewEngine["default"])(app);

//config body parser
app.use(_bodyParser["default"].json());
app.use(_bodyParser["default"].urlencoded({
  extended: true
}));

//config cookie parser
app.use((0, _cookieParser["default"])());

//Test connection
// connection();

//init web routes
(0, _web["default"])(app);

//init api routes
(0, _api["default"])(app);
app.use(function (req, res) {
  return res.send("404 not found");
});
app.listen(PORT, function () {
  console.log("Server running in port ".concat(PORT));
});