--FGLX worte 99.98% of code Dodo worte 0.02%
local menuref = gui.Reference("MENU")
local base = gui.Tab(gui.Reference("Misc"), "Ghost Client", "Ghost Client")
local menubox = gui.Groupbox(base, "Rage-Bot", 16, 16, 608, 500)
local ESP = gui.Groupbox(base, "ESP", 16, 590, 608, 500)
local aa = gui.Groupbox(base, "Anti Aim", 16, 710, 608, 500)
local misc = gui.Groupbox(base, "Misc", 16, 1375, 608, 500)
local rage = gui.Groupbox(menubox, "Improvments", 0, 0, 500, 500)
local rage2 = gui.Groupbox(menubox, "Jitter Auto MinDamage", 0, 306, 500, 500)
local aa2 = gui.Groupbox(aa, "Jitter Yaw", 0, 0, 500, 500)
local aa3 = gui.Groupbox(aa, "Manual AA", 0, 200, 500, 500)

local misc2 = gui.Groupbox(misc, "Fun", 0, 0, 500, 500)
local misc3 = gui.Groupbox(misc, "Jitter FakeLag", 0, 165, 500, 500)
local misc4 = gui.Groupbox(misc, "Jitter SlowWalk", 0, 368, 500, 500)
local snap = gui.Checkbox(ESP, "checkSnap", "Snap Lines", false);
local Betterdt = gui.Checkbox(rage, "checkDoubleTap", "DoubleTap", false);
local dt_setting1 = gui.Combobox(rage, "dt.switch1", "Set This to Rapid", "Off", "Shift" , "Rapid")
local dt_setting2 = gui.Combobox(rage, "dt.switch2", "Set This to Shift", "Off", "Shift" , "Rapid")
local resolver = gui.Checkbox(rage, "checkResolver", "Resolver", false);
local watermark = gui.Checkbox(misc2, "checkWatermark", "WaterMark", true);
local dt_keya = gui.GetValue("rbot.accuracy.movement.slowkey")
local Left = gui.Checkbox(aa3, "checkLeft", "Enable Left", false);
local Right = gui.Checkbox(aa3, "checkRight", "Enable Right", false);
local Back = gui.Checkbox(aa3, "checkBack", "Enable BackWards", fawlse);
local Rightaa = gui.Keybox( aa3, "akeyR", "Right AA", 0)
local Leftaa = gui.Keybox( aa3, "akeyL", "Left AA", 0)
local Backaa = gui.Keybox( aa3, "akeyB", "Backwards AA", 0)
local limit = gui.Slider(aa2, "limit", "Limit", 0, -180, 180);
local freq = gui.Slider(aa2, "frequency", "Frequency", 0, 1, 20);
local center = gui.Slider(aa2, "center", "Center", 180, -180, 180);
local limitFake = gui.Slider(misc3, "limitFake", "Limit", 0, 0, 17);
local freqFake = gui.Slider(misc3, "frequencyFake", "Frequency", 0, 1, 100);
local centerFake = gui.Slider(misc3, "centerFake", "Center", 3, 3, 17);
local whyamiwastingmytime = gui.Checkbox(misc2, "checkFake", "FakeDuck Animation", false);
local limitSlow = gui.Slider(misc4, "limitSlow", "Limit", 0, 1, 100);
local freqSlow = gui.Slider(misc4, "frequencySlow", "Frequency", 0, 1, 50);
local centerSlow = gui.Slider(misc4, "centerSlow", "Center", 30, 1, 100);
local limitAmin = gui.Slider(rage2, "limitAim", "Limit", 0, 1, 100);
local freqAmin = gui.Slider(rage2, "frequencyAim", "Frequency", 0, 1, 200);
local centerAim = gui.Slider(rage2, "centerAim", "Center", 1, 1, 100);

local keyR = gui.GetValue("misc.Ghost Client.akeyR")
local keyL = gui.GetValue("misc.Ghost Client.akeyL")
local keyB = gui.GetValue("misc.Ghost Client.akeyB")





local getLocal = function() return entities.GetLocalPlayer() end
local name = 'GhostClient Beta';
local seperator = '|';
local fps = "fps";

local count = 0;
local last = globals.RealTime();

local frame_rate = 0.0
local get_abs_fps = function()
    frame_rate = 0.9 * frame_rate + (1.0 - 0.9) * globals.AbsoluteFrameTime()
    return math.floor((1.0 / frame_rate) + 0.5)
end





dt_setting1:SetDescription("Set This to Rapid (this is needed for Improved DobuleTap)")
;
dt_setting2:SetDescription("Set This to Shift (this is needed for Improved DobuleTap)")
;
whyamiwastingmytime:SetDescription("Do the Dirty When u FakeDuck")
;
Right:SetDescription("Please Turn OFF At Targets")
;
Left:SetDescription("Please Turn OFF At Targets")
;
Back:SetDescription("Please Turn OFF At Targets")
;
resolver:SetDescription("Improves Current Reslover")
;
watermark:SetDescription("Gives us some Promo in your clips")
;
snap:SetDescription("Lines To the Enemy ")
; 
Betterdt:SetDescription("Improves Current DoubleTap [When Slow Walking]")
;
local debugFont = draw.CreateFont( "Rowdies", 100);




local function OnDraw3() 
   local dt_keya = gui.GetValue("rbot.accuracy.movement.slowkey")
 
   local dt_set1 = gui.GetValue("misc.Ghost Client.dt.switch1")
   local dt_set2 = gui.GetValue("misc.Ghost Client.dt.switch2")
      if Betterdt:GetValue() then
        if input.IsButtonDown(dt_keya) then
         gui.SetValue("rbot.accuracy.weapon.asniper.doublefire", dt_set2)
        else
         gui.SetValue("rbot.accuracy.weapon.asniper.doublefire", dt_set1)
        end
      end  
end




local function OnDraw2()
    if watermark:GetValue() then
    draw.Color(110,110,110, 255)
    draw.FilledRect(5, 5, 245, 35)
    draw.Color(255, 255, 255, 255)
    draw.FilledRect(10, 10, 240, 30)
    draw.Color(0, 0, 0, 255)
    draw.Text(15, 15, name)
    draw.Text(137, 14, seperator)

    local fps = get_abs_fps()

if fps<30 then
draw.Color(150, 0, 0, 255)
elseif fps<60 then
draw.Color(150, 150, 0, 255)
else
draw.Color(0, 150, 0, 255)
end
    
    draw.Text(143, 15, get_abs_fps())
    draw.Text(165, 15, "  fps")
    end
end


local function OnDraw()
    if resolver:GetValue() then
      
    end
end

local function OnDraw4()
    if snap:GetValue() then
        local screenCenterX, screenH = draw.GetScreenSize();
    screenCenterX = screenCenterX * 0.5;

    draw.Color( 255, 255, 255, 255 );

    local players = entities.FindByClass( "CCSPlayer" );

    for i = 1, #players do
        local player = players[ i ];

        if player:IsAlive() then
            local x, y = client.WorldToScreen( player:GetAbsOrigin() );

            if x ~= nil and y ~= nil then
                draw.Line( x, y, screenCenterX, screexnH );
            end
        end
    end
    end
end





local function OnDraw5() 
   local KeyL = gui.GetValue("misc.Ghost Client.akeyR")
 
      if Left:GetValue() then
        if input.IsButtonDown(KeyL) then
         gui.SetValue("rbot.antiaim.yaw", 90) 
         draw.Text( 900, 534, "<====" )


        end
      end  
end


local function OnDraw6() 
   local KeyR = gui.GetValue("misc.Ghost Client.akeyL")
 
      if Right:GetValue() then
        if input.IsButtonDown(KeyR) then
         gui.SetValue("rbot.antiaim.yaw", -90)
         draw.Text( 970, 534, "====>" )

        end
      end  
end


local function OnDraw7() 
   local KeyB = gui.GetValue("misc.Ghost Client.akeyB")
 
      if Back:GetValue() then
        if input.IsButtonDown(KeyB) then
         gui.SetValue("rbot.antiaim.yaw", 180)
         draw.Text( 954, 550, "||" )

        end
      end  
end


local viewmodelZ = (client.GetConVar("viewmodel_offset_z"));
function yourmumsahoe()
if whyamiwastingmytime:GetValue() then
if getLocal() then
if getLocal():IsAlive() then
local shitthisisboring = gui.GetValue('rbot.antiaim.extra.fakecrouchkey')
local andsofuckinguseless = input.IsButtonDown( shitthisisboring )                                            
local yourmum = entities.GetLocalPlayer();
local tbagmodeengaged = yourmum:GetProp('m_flDuckAmount')            
if  andsofuckinguseless == true then
client.SetConVar("viewmodel_offset_z", (viewmodelZ - (tbagmodeengaged*8)), true)
else client.SetConVar("viewmodel_offset_z", viewmodelZ, true)
end end end end end                        
callbacks.Register("Draw", yourmumsahoe)



local function jitter_fakelag()
	maths = (gui.GetValue("misc.Ghost Client.limit") * math.cos((globals.RealTime()) / (gui.GetValue("misc.Ghost Client.frequency")*(0.01)))+ gui.GetValue("misc.Ghost Client.center"));
	gui.SetValue("rbot.antiaim.yaw", maths)
end


callbacks.Register("Draw", jitter_fakelag);




local function jitter_fakelag2()
	maths = (gui.GetValue("misc.Ghost Client.limitFake") * math.cos((globals.RealTime()) / (gui.GetValue("misc.Ghost Client.frequencyFake")*(0.01)))+ gui.GetValue("misc.Ghost Client.centerFake"));
	gui.SetValue("misc.fakelag.factor", maths)
end


callbacks.Register("Draw", jitter_fakelag2);




local function jitter_fakelag3()
	maths = (gui.GetValue("misc.Ghost Client.limitSlow") * math.cos((globals.RealTime()) / (gui.GetValue("misc.Ghost Client.frequencySlow")*(0.01)))+ gui.GetValue("misc.Ghost Client.centerSlow"));
	gui.SetValue("rbot.accuracy.movement.slowspeed", maths)
end


callbacks.Register("Draw", jitter_fakelag3);






local function jitter_fakelag4()
	maths = (gui.GetValue("misc.Ghost Client.limitAim") * math.cos((globals.RealTime()) / (gui.GetValue("misc.Ghost Client.frequencyAim")*(0.01)))+ gui.GetValue("misc.Ghost Client.centerAim"));
	gui.SetValue("rbot.accuracy.weapon.asniper.mindmg", maths)
end


callbacks.Register("Draw", jitter_fakelag4);













callbacks.Register( "Draw", "LuaGuiTest", OnDraw );
callbacks.Register( "Draw", "LuaGuiTest2", OnDraw2 );
callbacks.Register( "Draw", "LuaGuiTest3", OnDraw3 );
callbacks.Register( "Draw", "LuaGuiTest4", OnDraw4 );
callbacks.Register( "Draw", "LuaGuiTest5", OnDraw5 );
callbacks.Register( "Draw", "LuaGuiTest6", OnDraw6 );
callbacks.Register( "Draw", "LuaGuiTest7", OnDraw7 );