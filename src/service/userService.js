import bcryptjs from "bcryptjs";
import db from "../models/index";

const salt = bcryptjs.genSaltSync(10);

const getUserList = async () => {
  //test relationships
  let newUser = await db.User.findOne({
    where: { id: 1 },
    attributes: ["id", "username", "email"],
    include: { model: db.Group, attributes: ["name", "description"] },
    raw: true,
    nest: true,
  });

  let roles = await db.Role.findAll({
    include: { model: db.Group, where: { id: 1 } },
    raw: true,
    nest: true,
  });

  //Get list user
  let user = [];
  user = await db.User.findAll();
  return user;
};

const hashUserPassword = (userPassword) => {
  const hashPassword = bcryptjs.hashSync(userPassword, salt);
  return hashPassword;
  //   const check = bcryptjs.compareSync(password, hashPassword);
};

const createNewUser = async (email, password, username) => {
  let hashPassword = hashUserPassword(password);
  try {
    await db.User.create({
      username: username,
      email: email,
      password: hashPassword,
    });
  } catch (err) {
    console.log(err);
  }
};

const deleteUser = async (userId) => {
  await db.User.destroy({
    where: { id: userId },
  });
};

const updateUser = async (email, username, id) => {
  await db.User.update(
    { email: email, username: username },
    {
      where: { id: id },
    }
  );
};

const getUserByID = async (id) => {
  let user = {};
  user = await db.User.findOne({
    where: { id: id },
  });
  return user.get({ plain: true });
};

module.exports = {
  createNewUser,
  getUserList,
  deleteUser,
  getUserByID,
  updateUser,
};
