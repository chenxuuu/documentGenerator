--- 按照指定分隔符分割字符串
-- @string str 输入字符串
-- @string delimiter 分隔符
-- @return 分割后的字符串列表
-- @usage "123,456,789":split(',') -> {'123','456','789'}
function string.split(str, delimiter)
    local strlist, tmp = {}, string.byte(delimiter)
    if delimiter == "" then
        for i = 1, #str do strlist[i] = str:sub(i, i) end
    else
        for substr in string.gmatch(str .. delimiter, "(.-)" .. (((tmp > 96 and tmp < 123) or (tmp > 64 and tmp < 91) or (tmp > 47 and tmp < 58)) and delimiter or "%" .. delimiter)) do
            table.insert(strlist, substr)
        end
    end
    return strlist
end

json = require("json")

local rt = {}
local doc = text:gsub("\r",""):split("\n")

local last = {}
for i=1,#doc do
    if doc[i]:find("> %*%*(.+)%*%*") == 1 then
        if last.prefix then
            rt[last.prefix] = last
            print(last.body)
            last = {}
        end
        last.prefix = doc[i]:match("> %*%*(.+)%*%*"):gsub("\r","")
    elseif last.prefix and doc[i]:len() > 2 and not last.description then
        last.description = doc[i]:gsub("\r","")
        if last.prefix:find("%(.+%)") then--对有参数的接口进行处理
            local args = last.prefix:match("%(.+%)")
            if not args:find(",") then--只有一个参数的情况
                last.body = last.prefix:gsub("%((.+)%)","(${1:%1})")
            else
                local gt = args:sub(2,-2):split(",")
                local tt = {}
                for i=1,#gt do
                    table.insert(tt,"${"..i..":"..gt[i].."}")
                end
                last.body = last.prefix:gsub("%((.+)%)","("..table.concat(tt,",")..")")
            end
        else
            last.body = last.prefix
        end
    elseif last.description then
        local tempi = i+3
        while doc[tempi] and doc[tempi]:find("> %*%*") ~= 1 do
            last.description = last.description..doc[tempi].."\r\n"
            tempi = tempi + 1
        end
        rt[last.prefix] = last
        print(last.body)
        last = {}
    end
end
if last.prefix then
    rt[last.prefix] = last
    print(last.body)
    last = {}
end

result = json:encode(rt)

print("done!")

