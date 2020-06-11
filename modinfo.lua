name = "My mod name"
version = "1.0.0"
description = "Version " .. version .. "\n\n This mod is very good."
author = "my-name"

api_version = 10

dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true

icon_atlas = "my-mod-name.xml"
icon = "my-mod-name.tex"

-- forumthread = "/topic/xxx-abc/"

all_clients_require_mod = true
client_only_mod = false
server_filter_tags = { "tag1", "tag2" }

configuration_options =
{
    {
        name = "property_name",
        label = "Property Name",
        options = {
            { description = "Low", data = "low" },
            { description = "Default", data = "default" },
            { description = "High", data = "high" },
        },
        default = "default"
    } 
}
