local fulgoraCliffExplosive = table.deepcopy(data.raw["capsule"]["cliff-explosives"])
fulgoraCliffExplosive.name = "cliffillworld_fulgoran_cliff_explosive"
fulgoraCliffExplosive.default_import_location = "fulgora"
fulgoraCliffExplosive.weight = 1100000
local nauvisCliffExplosive = table.deepcopy(data.raw["capsule"]["cliff-explosives"])
nauvisCliffExplosive.name = "cliffillworld_nauvis_cliff_explosive"
nauvisCliffExplosive.default_import_location = "nauvis"
nauvisCliffExplosive.weight = 1100000

local fulgoranDustTile = table.deepcopy(data.raw["tile"]["fulgoran-dust"])
fulgoranDustTile.name = "cliffillworld_tile_fulgoran_dust"
fulgoranDustTile.mined_sound = "__base__/sound/deconstruct-bricks.ogg"
fulgoranDustTile.is_foundation = true
local fulgoranRockTile = table.deepcopy(data.raw["tile"]["fulgoran-rock"])
fulgoranRockTile.name = "cliffillworld_tile_fulgoran_rock"
fulgoranRockTile.mined_sound = "__base__/sound/deconstruct-bricks.ogg"
fulgoranRockTile.is_foundation = true

local fulgoranLightLandFill = table.deepcopy(data.raw["item"]["landfill"])
fulgoranLightLandFill.name = "cliffillworld_fulgoran_light_landfill"
fulgoranLightLandFill.icon = "__space-age__/graphics/terrain/fulgoran-dust.png"
fulgoranLightLandFill.place_as_tile = {}
fulgoranLightLandFill.place_as_tile.result = "cliffillworld_tile_fulgoran_dust"
fulgoranLightLandFill.place_as_tile.condition_size = 1
fulgoranLightLandFill.place_as_tile.condition = {layers = {ground_tile = true}}
fulgoranLightLandFill.place_as_tile.tile_condition = {}
local fulgoranDeepLandFill = table.deepcopy(data.raw["item"]["landfill"])
fulgoranDeepLandFill.name = "cliffillworld_fulgoran_deep_landfill"
fulgoranDeepLandFill.icon = "__space-age__/graphics/terrain/fulgoran-rock.png"
fulgoranDeepLandFill.place_as_tile = {}
fulgoranDeepLandFill.place_as_tile.result = "cliffillworld_tile_fulgoran_rock"
fulgoranDeepLandFill.place_as_tile.condition_size = 1
fulgoranDeepLandFill.place_as_tile.condition = {layers = {ground_tile = true}}
fulgoranDeepLandFill.place_as_tile.tile_condition = {}

local vulcanusLavaFillTile = table.deepcopy(data.raw["tile"]["volcanic-cracks-hot"])
vulcanusLavaFillTile.name = "cliffillworld_tile_vulcanus_lavacrack"
vulcanusLavaFillTile.mined_sound = "__base__/sound/deconstruct-bricks.ogg"
vulcanusLavaFillTile.is_foundation = true
local vulcanusLandFill = table.deepcopy(data.raw["item"]["landfill"])
vulcanusLandFill.name = "cliffillworld_vulcanus_landfill"
vulcanusLandFill.icon = "__space-age__/graphics/terrain/vulcanus/volcanic-cracks-hot.png"
vulcanusLandFill.place_as_tile = {}
vulcanusLandFill.place_as_tile.result = "cliffillworld_tile_vulcanus_lavacrack"
vulcanusLandFill.place_as_tile.condition_size = 1
vulcanusLandFill.place_as_tile.condition = {layers = {ground_tile = true}}
vulcanusLandFill.place_as_tile.tile_condition = {}

data:extend({
    --Fulgora landfill items
    fulgoranDustTile,
    fulgoranLightLandFill,
    fulgoranRockTile,
    fulgoranDeepLandFill,
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

    --Vulcanus landfill
    vulcanusLavaFillTile,
    vulcanusLandFill,

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

fulgoranDustTile.minable = {result = "cliffillworld_fulgoran_light_landfill", mining_time = 0.5, count = 1, }
fulgoranRockTile.minable = {result = "cliffillworld_fulgoran_deep_landfill", mining_time = 0.5, count = 1, }
vulcanusLavaFillTile.minable = {result = "cliffillworld_vulcanus_landfill", mining_time = 0.5, count = 1, }
