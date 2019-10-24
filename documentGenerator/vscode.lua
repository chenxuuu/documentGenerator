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
local doc = text:split("\n")

local last = {}
for i=1,#doc do
    if doc[i]:find("### (.+)") == 1 then
        last.body = doc[i]:match("### (.+)"):gsub("\r","")
    elseif last.body and doc[i]:len() > 2 then
        last.description = doc[i]:gsub("\r","")
        last.prefix = last.body
        rt[last.body] = last
        print(last.body)
        last = {}
    end
end

result = json:encode(rt)

print("done!")

