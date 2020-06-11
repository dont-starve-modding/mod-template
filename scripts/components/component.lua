local Component = Class(function(self, inst)
    self.inst = inst
    self.some_property = nil
end)

local function do_something_internally(inst)
    print("Component: so something internally...")
end

function Component:DoSomething()
    return self.some_property
end


function Component:OnSave()
    print("component: OnSave")
    return
    {
        some_property = self.some_property
    }
end

function Component:OnLoad(data)
    print("component: OnLoad")
end

function Component:OnRemoveEntity()
    -- print("component: OnRemoveEntity")
end

function Component:LongUpdate(dt)
    -- print("component: LongUpdate" .. dt)
end


return Component