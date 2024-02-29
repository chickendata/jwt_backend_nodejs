"use strict";

var _jsonwebtoken = _interopRequireDefault(require("jsonwebtoken"));
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }
require("dotenv").config();
var nonSecurePaths = ["/logout", "/login", "/register"];
var createJWT = function createJWT(payload) {
  var key = process.env.JWT_SECRET;
  var token = null;
  try {
    token = _jsonwebtoken["default"].sign(payload, key, {
      expiresIn: process.env.JWT_EXPIRES_IN
    });
  } catch (e) {
    console.log(e);
  }
  return token;
};
var verifyToken = function verifyToken(token) {
  var key = process.env.JWT_SECRET;
  var decode = null;
  try {
    decode = _jsonwebtoken["default"].verify(token, key);
  } catch (err) {
    console.log(err);
  }
  return decode;
};
function extractToken(req) {
  if (req.headers.authorization && req.headers.authorization.split(" ")[0] === "Bearer") {
    return req.headers.authorization.split(" ")[1];
  }
  return null;
}
var checkUserJWT = function checkUserJWT(req, res, next) {
  if (nonSecurePaths.includes(req.path)) return next();
  var cookies = req.cookies;
  var tokenFromHeaders = extractToken(req);
  if (cookies && cookies.jwt || tokenFromHeaders) {
    var token = cookies && cookies.jwt ? cookies.jwt : tokenFromHeaders;
    var decode = verifyToken(token);
    if (decode) {
      req.user = decode;
      req.token = token;
      next();
    } else {
      return res.status(401).json({
        EC: -1,
        DT: "",
        EM: "Not authenticate the user"
      });
    }
  } else {
    return res.status(401).json({
      EC: -1,
      DT: "",
      EM: "Not authenticate the user"
    });
  }
};
var checkUserPermission = function checkUserPermission(req, res, next) {
  if (nonSecurePaths.includes(req.path) || req.path === "/account") return next();
  if (req.user) {
    var email = req.user.email;
    var roles = req.user.groupWithRoles.Roles;
    var currentUrl = req.path;
    console.log(">>> check roles", roles);
    console.log(">>> check current url", currentUrl);
    if (!roles || roles.length === 0) {
      return res.status(403).json({
        EC: -1,
        DT: "",
        EM: "you don't have permission this resource ..."
      });
    }
    var canAccess = roles.some(function (item) {
      return item.url === currentUrl || currentUrl.includes(item.url);
    });
    console.log(canAccess);
    if (canAccess === true) {
      next();
    } else {
      return res.status(403).json({
        EC: -1,
        DT: "",
        EM: "you don't have permission this resource ..."
      });
    }
  } else {
    return res.status(401).json({
      EC: -1,
      DT: "",
      EM: "Not authenticate the user"
    });
  }
};
module.exports = {
  createJWT: createJWT,
  verifyToken: verifyToken,
  checkUserJWT: checkUserJWT,
  checkUserPermission: checkUserPermission
};