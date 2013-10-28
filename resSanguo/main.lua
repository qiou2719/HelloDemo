


-- for CCLuaEngine
function __G__TRACKBACK__(errorMessage)
    CCLuaLog("----------------------------------------")
    CCLuaLog("LUA ERROR: "..tostring(errorMessage).."\n")
    CCLuaLog(debug.traceback("", 2))
    CCLuaLog("----------------------------------------")
end

--CCLuaLoadChunksFromZip("res/framework_precompiled.zip")

local function main()
    CCFileUtils:sharedFileUtils():addSearchPath("script/")
    CCFileUtils:sharedFileUtils():addSearchPath("img/")
    CCFileUtils:sharedFileUtils():addSearchPath("ccbi/")
    require("config")
    require("framework.init")
    require("model.GameData")
    require("controller.ControllerFactory")

    -- preload all sounds
    for k, v in pairs(GAME_SFX) do
        audio.preloadSound(v)
    end
    
    --- init
    GameData:Instance():init()

    --- enter first scene
    ControllerFactory:Instance():create(ControllerType.REGIST_CONTROLLER):enter()
end

xpcall(function()
    main()
end, __G__TRACKBACK__)
