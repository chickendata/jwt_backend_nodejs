import db from "../models/index";

const getAllRole = async () => {
  try {
    let data = await db.Role.findAll({
      order: [["id", "DESC"]],
    });
    return {
      EM: "Get all role succeeds",
      EC: 0,
      DT: data,
    };
  } catch (err) {
    console.log(err);
    return {
      EM: "Something wrongs",
      EC: 1,
      DT: "[]",
    };
  }
};

const createNewRoles = async (roles) => {
  try {
    let currentRoles = await db.Role.findAll({
      attributes: ["url", "description"],
      raw: true,
    });
    const persist = roles.filter(
      ({ url: url1 }) => !currentRoles.some(({ url: url2 }) => url2 === url1)
    );
    if (persist.length === 0) {
      return {
        EM: "Nothing to create ...",
        EC: 0,
        DT: [],
      };
    } else {
      await db.Role.bulkCreate(persist, { ignoreDuplicates: true });
      return {
        EM: `Create roles succeed: ${persist.length} roles`,
        EC: 0,
        DT: [],
      };
    }
  } catch (err) {
    console.log(err);
    return {
      EM: "Something wrongs",
      EC: 1,
      DT: "[]",
    };
  }
};

const deleteRole = async (id) => {
  try {
    let role = await db.Role.findOne({
      where: { id: id },
    });
    await role.destroy();
    return {
      EM: "Delete role succeeds",
      EC: 0,
      DT: [],
    };
  } catch (err) {
    console.log(err);
    return {
      EM: "Something wrongs",
      EC: 1,
      DT: "[]",
    };
  }
};

const getRoleByGroup = async (id) => {
  try {
    if (!id)
      return {
        EM: "Not found any roles",
        EC: 1,
        DT: [],
      };
    let roles = await db.Group.findOne({
      where: { id: id },
      attributes: ["id", "name", "description"],
      include: [
        {
          model: db.Role,
          attributes: ["id", "url", "description"],
          through: { attributes: [] },
        },
      ],
    });
    return {
      EM: "Get role by group succeeds",
      EC: 0,
      DT: roles,
    };
  } catch (err) {
    console.log(err);
    return {
      EM: "Something wrongs",
      EC: 1,
      DT: "[]",
    };
  }
};

const assignRoleToGroup = async (data) => {
  try {
    await db.Group_Role.destroy({
      where: { groupId: +data.groupId },
    });
    await db.Group_Role.bulkCreate(data.groupRoles);
    return {
      EM: "Assign role to group succeeds",
      EC: 0,
      DT: [],
    };
  } catch (err) {
    console.log(err);
    return {
      EM: "Something wrongs with services",
      EC: 1,
      DT: "[]",
    };
  }
};

module.exports = {
  createNewRoles,
  getAllRole,
  deleteRole,
  getRoleByGroup,
  assignRoleToGroup,
};
