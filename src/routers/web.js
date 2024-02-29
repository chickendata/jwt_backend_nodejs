import express from "express";
import homeController from "../controller/homeController";
import apiController from "../controller/apiController";
const router = express.Router();

/**
 *
 * @param {*} app : express app
 */

const initWebRouter = (app) => {
  router.get("/", homeController.handleHelloWorld);
  router.get("/user", homeController.handleUser);
  router.post("/users/create-user", homeController.handleCreateNewUser);
  router.post("/delete-user/:id", homeController.handleDeleteUser);
  router.post("/update-user/:id", homeController.getUpdateUserPage);
  router.post("/users/update-user", homeController.handleUpdateUser);

  //rest api
  router.get("/api/test", apiController.testApi);

  return app.use("/", router);
};

export default initWebRouter;
