-- register some new flowers to fill in missing dye colours
-- flower registration (borrowed from default game)

local function add_simple_flower(name, desc, box, f_groups)

	f_groups.snappy = 3
	f_groups.flower = 1
	f_groups.flora = 1
	f_groups.attached_node = 1

	minetest.register_node("flowers2:" .. name, {
		description = desc,
		drawtype = "plantlike",
		waving = 1,
		tiles = {"flowers2_" .. name .. ".png"},
		inventory_image = "flowers2_" .. name .. ".png",
		wield_image = "flowers2_" .. name .. ".png",
		sunlight_propagates = true,
		paramtype = "light",
		walkable = false,
		buildable_to = true,
		stack_max = 99,
		groups = f_groups,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = box
		}
	})
	if minetest.get_modpath("lucky_block") then
		luck_block:add_blocks({ {"dro", {"flowers2:"..name}, 5} })
	end
end

local flowers = {
	{"poppy", "Poppy", {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}, {color_red = 1}},
	{"mountain_edelweiss", "Edelweiss", {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}, {color_white = 1}},
	{"forest_columbine", "Wild Columbine", {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}, {color_red = 1}},
	{"grass_prairie", "Prairie Grass", {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}, {color_orange = 1}},
	{"grass_cord", "Cord Grass", {-2 / 16, -0.5, -2 / 16, 2 / 16, 5 / 16, 2 / 16}, {color_green = 1}},
}

for _,item in pairs(flowers) do
	add_simple_flower(unpack(item))
end


--= Register Biome Decoration Using Plants Mega Pack Lite

--= Desert Biome

-- Cactus
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:sandstone"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"desert", "sandstone"},
	decoration = {
		"flowers2:cactus_echinocereus", "flowers2:cactus_matucana",
		"flowers2:cactus_baseball", "flowers2:cactus_golden"
	}
})

-- Desert Plants
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:desert_sand", "default:sandstone", "default:sand"},
	sidelen = 16,
	fill_ratio = 0.004,
	biomes = {"desert", "sandstone"},
	decoration = {
		"flowers2:desert_kangaroo", "flowers2:desert_brittle",
		"flowers2:desert_ocotillo", "flowers2:desert_whitesage"
	}
})

--=  Prairie Biome

-- Grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:prairie_dirt", "default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo"},
	decoration = {
		"flowers2:grass_prairie", "flowers2:grass_cord",
		"flowers2:grass_wheatgrass", "flowers2:desert_whitesage"
	}
})

-- Flowers
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"ethereal:prairie_grass", "default:dirt_with_grass",
		"ethereal:grove_dirt", "ethereal:bamboo_dirt"
	},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo", "bamboo"},
	decoration = {
		"flowers2:flower_jacobsladder", "flowers2:flower_thistle",
		"flowers2:flower_wildcarrot"
	}
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"ethereal:prairie_grass", "default:dirt_with_grass",
		"ethereal:grove_dirt"
	},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"prairie", "grassy", "grassytwo", "grove"},
	decoration = {
		"flowers2:flower_delphinium", "flowers2:flower_celosia",
		"flowers2:flower_daisy", "flowers2:flower_bluerose"
	}
})

-- Shrubs
minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"ethereal:prairie_grass", "default:dirt_with_grass",
		"ethereal:grove_dirt", "ethereal:jungle_grass",
		"ethereal:gray_dirt", "default:dirt_with_rainforest_litter"
	},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {
		"prairie", "grassy", "grassytwo", "grove", "junglee",
		"grayness", "jumble"
	},
	decoration = {"flowers2:shrub_kerria", "flowers2:shrub_spicebush"}
})

--= Jungle Biome

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:jungle_dirt", "default:dirt_with_grass", "default:dirt_with_rainforest_litter"},
	sidelen = 16,
	fill_ratio = 0.007,
	biomes = {"junglee", "jumble"},
	decoration = {
		"flowers2:rainforest_guzmania", "flowers2:rainforest_devil",
		"flowers2:rainforest_lazarus", "flowers2:rainforest_lollipop",
		"flowers2:mushroom_woolly"
	}
})

--= Cold Biomes

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"default:dirt_with_snow", "ethereal:cold_dirt",
		"ethereal:gray_dirt"
	},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"snowy", "alpine", "grayness"},
	decoration = {
		"flowers2:mountain_edelweiss", "flowers2:mountain_armeria",
		"flowers2:mountain_bellflower", "flowers2:mountain_willowherb",
		"flowers2:mountain_bistort"
	}
})

--= Mushroom Biome

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:mushroom_dirt"},
	sidelen = 16,
	fill_ratio = 0.005,
	biomes = {"mushroom"},
	decoration = {
		"flowers2:mushroom_powderpuff", "flowers2:mushroom_chanterelle",
		"flowers2:mushroom_parasol"
	}
})

--= Lakeside

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand", "default:dirt_with_grass"},
	sidelen = 16,
	fill_ratio = 0.015,
	biomes = {"sandclay", "grassy_ocean", "grassy", "grassytwo", "jumble", "swamp"},
	decoration = {
		"flowers2:wetlands_cattails", "flowers2:wetlands_pickerel",
		"flowers2:wetlands_mannagrass", "flowers2:wetlands_turtle"
	},
	spawn_by = "default:water_source",
	num_spawn_by = 1
})

--= Harsh Biomes

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"ethereal:mushroom_dirt", "default:dirt_with_grass",
		"ethereal:gray_dirt", "ethereal:cold_dirt",
		"ethereal:dirt_with_snow", "ethereal:jungle_dirt",
		"ethereal:prairie_dirt", "ethereal:grove_dirt",
		"ethereal:dry_dirt", "ethereal:fiery_dirt", "default:sand",
		"default:desert_sand", "flowers2:red", "ethereal:bamboo_dirt",
		"default:dirt_with_rainforest_litter"
	},
	sidelen = 16,
	fill_ratio = 0.004,
	biomes = {
		"mushroom", "prairie", "grayness", "plains", "desert",
		"junglee", "grassy", "grassytwo", "jumble", "snowy", "alpine",
		"fiery", "mesa", "bamboo"
	},
	decoration = {"flowers2:spooky_thornbush", "flowers2:spooky_baneberry"}
})

--= Poppy's growing in Clearing Biome in memory of RealBadAngel

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"default:dirt_with_grass",
	},
	sidelen = 16,
	fill_ratio = 0.004,
	biomes = {"clearing"},
	decoration = {"flowers2:poppy"}
})
