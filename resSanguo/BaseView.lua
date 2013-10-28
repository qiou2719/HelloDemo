
BaseView = class("BaseView", function()
    return display.newLayer()
end)

function BaseView:ctor()
  echo("BaseView ctor")
end

return BaseView