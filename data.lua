local fulgoraCliffExplosive = table.deepcopy(data.raw["capsule"]["cliff-explosives"])
fulgoraCliffExplosive.name = "cliffillworld_fulgoran_cliff_explosive"
fulgoraCliffExplosive.default_import_location = "fulgora"
fulgoraCliffExplosive.weight = 1100000
local nauvisCliffExplosive = table.deepcopy(data.raw["capsule"]["cliff-explosives"])
nauvisCliffExplosive.name = "cliffillworld_nauvis_cliff_explosive"
nauvisCliffExplosive.default_import_location = "nauvis"
nauvisCliffExplosive.weight = 1100000

data:extend({
    --Fulgora landfill items
    {
        type = "item",
        name = "cliffillworld_fulgoran_light_landfill",
        icon = "__space-age__/graphics/terrain/fulgoran-dust.png",
        icon_size = 64,
        subgroup = "terrain",
        order = "c[landfill]-a[dirt]",
        stack_size = 200,
        place_as_tile = {
            result = "fulgoran-dust",
            condition_size = 1,
            condition = {layers = {ground_tile = true}},
            tile_condition = {}
        }
    },
    {
        type = "item",
        name = "cliffillworld_fulgoran_deep_landfill",
        icon = "__space-age__/graphics/terrain/fulgoran-rock.png",
        icon_size = 64,
        subgroup = "terrain",
        order = "c[landfill]-a[dirt]",
        stack_size = 200,
        place_as_tile = {
            result = "fulgoran-rock",
            condition_size = 1,
            condition = {layers = {ground_tile = true}},
            tile_condition = {}
        }
    },
    fulgoraCliffExplosive,

    --Fulgora landfill recipes
    {
        type = "recipe",
        name = "cliffillworld_fulgoran_light_landfill",
        energy_required = 0.5,
        enabled = false,
        category = "electromagnetics",
        ingredients = {
            {type = "fluid", name = "electrolyte", amount = 10},
            {type = "fluid", name = "petroleum-gas", amount = 10},
            {type = "item", name = "stone", amount = 50},
            {type = "item", name = "rail-support", amount = 1},
        },
        results = {{type = "item", name = "cliffillworld_fulgoran_light_landfill", amount = 16}},
        surface_conditions = {{property = "magnetic-field", min = 99, max = 99}},
    },
    {
        type = "recipe",
        name = "cliffillworld_fulgoran_deep_landfill",
        energy_required = 0.5,
        enabled = false,
        category = "electromagnetics",
        ingredients = {
            {type = "fluid", name = "electrolyte", amount = 20},
            {type = "fluid", name = "petroleum-gas", amount = 20},
            {type = "item", name = "stone", amount = 100},
            {type = "item", name = "rail-support", amount = 2},
            {type = "item", name = "refined-concrete", amount = 10},
        },
        results = {{type = "item", name = "cliffillworld_fulgoran_deep_landfill", amount = 16}},
        surface_conditions = {{property = "magnetic-field", min = 99, max = 99}},
    },

    --Fulgora landfill tech
    {
        type = "technology",
        name = "cliffillworld_fulgoran_light_landfill",
        icon = "__space-age__/graphics/terrain/fulgoran-rock.png",
        icon_size = 64,
        prerequisites = {"electromagnetic-science-pack", "elevated-rail", "landfill"},
        unit = {
            count = 500,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"space-science-pack", 1},
                {"production-science-pack", 1},
                {"electromagnetic-science-pack", 1},
            },
            time = 20
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "cliffillworld_fulgoran_light_landfill"
            }
        },
        order = "b-d"
    },
    {
        type = "technology",
        name = "cliffillworld_fulgoran_deep_landfill",
        icon = "__space-age__/graphics/terrain/fulgoran-rock.png",
        icon_size = 64,
        prerequisites = {"cliffillworld_fulgoran_light_landfill", "rail-support-foundations"},
        unit = {
            count = 750,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"space-science-pack", 1},
                {"production-science-pack", 1},
                {"electromagnetic-science-pack", 1},
                {"metallurgic-science-pack", 1},
            },
            time = 40
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "cliffillworld_fulgoran_deep_landfill"
            }
        },
        order = "b-d"
    },

    --Fulgora cliff explosives
    {
        type = "recipe",
        name = "cliffillworld_fulgoran_cliff_explosive",
        energy_required = 10,
        enabled = false,
        category = "chemistry-or-cryogenics",
        ingredients = {
            {type = "fluid", name = "petroleum-gas", amount = 20},
            {type = "fluid", name = "light-oil", amount = 10},
            {type = "item", name = "rocket-fuel", amount = 2},
            {type = "item", name = "sulfur", amount = 10},
            {type = "item", name = "barrel", amount = 1},
        },
        results = {{type = "item", name = "cliffillworld_fulgoran_cliff_explosive", amount = 1}},
        surface_conditions = {{property = "magnetic-field", min = 99, max = 99}},
    },

    --Fulgora cliff explosives tech
    {
        type = "technology",
        name = "cliffillworld_fulgoran_cliff_explosive",
        icon = "__base__/graphics/icons/cliff-explosives.png",
        icon_size = 64,
        prerequisites = {"electromagnetic-science-pack", "elevated-rail"},
        unit = {
            count = 1000,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"space-science-pack", 1},
                {"electromagnetic-science-pack", 1},
            },
            time = 50
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "cliffillworld_fulgoran_cliff_explosive"
            }
        },
        order = "b-d"
    },

    --Vulcanus landfill item
    {
        type = "item",
        name = "cliffillworld_vulcanus_landfill",
        icon = "__space-age__/graphics/terrain/vulcanus/volcanic-cracks-hot.png",
        icon_size = 64,
        subgroup = "terrain",
        order = "c[landfill]-a[lava]",
        stack_size = 200,
        place_as_tile = {
            result = "volcanic-cracks-hot",
            condition_size = 1,
            condition = {layers = {ground_tile = true}},
            tile_condition = {}
        }
    },

    --Vulcanus landfill recipe
    {
        type = "recipe",
        name = "cliffillworld_vulcanus_landfill",
        energy_required = 0.5,
        enabled = false,
        category = "metallurgy",
        ingredients = {
            {type = "fluid", name = "molten-iron", amount = 50},
            {type = "fluid", name = "water", amount = 100},
            {type = "item", name = "stone", amount = 50},
            {type = "item", name = "tungsten-plate", amount = 1},
            {type = "item", name = "tungsten-carbide", amount = 1},
        },
        results = {{type = "item", name = "cliffillworld_vulcanus_landfill", amount = 1}},
        surface_conditions = {{property = "pressure", min = 4000, max = 4000}},
    },

    --Vulcanus landfill tech
    {
        type = "technology",
        name = "cliffillworld_vulcanus_landfill",
        icon = "__space-age__/graphics/terrain/vulcanus/volcanic-cracks-hot.png",
        icon_size = 64,
        prerequisites = {"metallurgic-science-pack", "landfill"},
        unit = {
            count = 500,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"space-science-pack", 1},
                {"metallurgic-science-pack", 1},
            },
            time = 20
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "cliffillworld_vulcanus_landfill"
            }
        },
        order = "b-d"
    },

    --Nauvis cliff explosives
    nauvisCliffExplosive,
    {
        type = "recipe",
        name = "cliffillworld_nauvis_cliff_explosive",
        energy_required = 8,
        enabled = false,
        category = "chemistry-or-cryogenics",
        ingredients = {
            {type = "item", name = "explosives", amount = 10},
            {type = "item", name = "grenade", amount = 1},
            {type = "item", name = "barrel", amount = 1},
        },
        results = {{type = "item", name = "cliffillworld_nauvis_cliff_explosive", amount = 1}},
        surface_conditions = {{property = "gravity", min = 10, max = 10}},
    },

    --Nauvis cliff explosives tech
    {
        type = "technology",
        name = "cliffillworld_nauvis_cliff_explosive",
        icon = "__base__/graphics/icons/cliff-explosives.png",
        icon_size = 64,
        prerequisites = {"explosives", "chemical-science-pack"},
        unit = {
            count = 750,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
            },
            time = 20
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "cliffillworld_nauvis_cliff_explosive"
            }
        },
        order = "b-d"
    },
})

local fulgoran_light_landfill = data.raw.item.cliffillworld_fulgoran_light_landfill.place_as_tile.tile_condition
table.insert(fulgoran_light_landfill,"oil-ocean-shallow")

local fulgoran_deep_landfill = data.raw.item.cliffillworld_fulgoran_deep_landfill.place_as_tile.tile_condition
table.insert(fulgoran_deep_landfill,"oil-ocean-deep")

local vulanus_landfill = data.raw.item.cliffillworld_vulcanus_landfill.place_as_tile.tile_condition
table.insert(vulanus_landfill,"lava")
table.insert(vulanus_landfill,"lava-hot")