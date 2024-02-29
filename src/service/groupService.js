import db from "../models/index";

const getGroup = async () => {
  try {
    let data = await db.Group.findAll({
      order: [["name", "ASC"]],
    });
    return {
      EM: "get group success",
      EC: 0,
      DT: data,
    };
  } catch (e) {
    console.log(e);
    return {};
  }
};

module.exports = { getGroup };
