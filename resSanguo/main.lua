


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
    CCFileUtils:sharedFileUtils():addSearchPath("pbs/")
    require("config")
    require("framework.init")
    require("common.PbRegister")
    require("common.NetRegister")
    require("model.GameData")
    require("controller.ControllerFactory")

    -- preload all sounds
    for k, v in pairs(GAME_SFX) do
        audio.preloadSound(v)
    end
    
    -- init
    GameData:Instance():init()

    -- enter first scene
    local playStatesController = ControllerFactory:Instance():create(ControllerType.PLAY_STATES_CONTROLLER)
    display.replaceScene(playStatesController:getScene(), "fade", 0.6, display.COLOR_WHITE)
    net.loop()
end

xpcall(function()
    main()
end, __G__TRACKBACK__)
