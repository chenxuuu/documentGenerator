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

--默认的lua自动整理代码
local luaData = "{\"_G\":{\"body\":\"_G ${0:...}\",\"description\":\"_G\",\"prefix\":\"_G\"},\"_VERSION\":{\"body\":\"_VERSION ${0:...}\",\"description\":\"_VERSION\",\"prefix\":\"_VERSION\"},\"assert\":{\"body\":\"assert ${1:v}${2:[, message]}\",\"description\":\"assert()\",\"prefix\":\"assert\"},\"collectgarbage\":{\"body\":\"collectgarbage ${1:[opt]}${2:[, arg]}\",\"description\":\"collectgarbage()\",\"prefix\":\"collectgarbage\"},\"coroutine.create\":{\"body\":\"coroutine.create  ${1:function} \",\"description\":\"coroutine.create\",\"prefix\":\"coroutine.create\"},\"coroutine.isyieldable\":{\"body\":\"coroutine.isyieldable  \",\"description\":\"coroutine.isyieldable\",\"prefix\":\"coroutine.isyieldable\"},\"coroutine.resume\":{\"body\":\"coroutine.resume  ${1:co}${2:[, val1, \\u00b7\\u00b7\\u00b7]} \",\"description\":\"coroutine.resume\",\"prefix\":\"coroutine.resume\"},\"coroutine.running\":{\"body\":\"coroutine.running  \",\"description\":\"coroutine.running\",\"prefix\":\"coroutine.running\"},\"coroutine.status\":{\"body\":\"coroutine.status  ${1:co} \",\"description\":\"coroutine.status\",\"prefix\":\"coroutine.status\"},\"coroutine.wrap\":{\"body\":\"coroutine.wrap  ${1:function} \",\"description\":\"coroutine.wrap\",\"prefix\":\"coroutine.wrap\"},\"coroutine.yield\":{\"body\":\"coroutine.yield  ${1:...} \",\"description\":\"coroutine.yield\",\"prefix\":\"coroutine.yield\"},\"debug.debug\":{\"body\":\"debug.debug \",\"description\":\"debug.debug ()\",\"prefix\":\"debug.debug\"},\"debug.getfenv\":{\"body\":\"debug.getfenv ${0:...}\",\"description\":\"debug.getfenv (o)\",\"prefix\":\"debug.getfenv\"},\"debug.gethook\":{\"body\":\"debug.gethook  ${1:[thread]} \",\"description\":\"debug.gethook ([thread])\",\"prefix\":\"debug.gethook\"},\"debug.getinfo\":{\"body\":\"debug.getinfo  ${1:[thread],}${2:f}${3:[, what]} \",\"description\":\"debug.getinfo ([thread,] f [, what])\",\"prefix\":\"debug.getinfo\"},\"debug.getlocal\":{\"body\":\"debug.getlocal  ${1:[thread],}${2:f}${3:[, local]} \",\"description\":\"debug.getlocal ([thread,] f, local)\",\"prefix\":\"debug.getlocal\"},\"debug.getmetatable\":{\"body\":\"debug.getmetatable  ${1:value} \",\"description\":\"debug.getmetatable (value)\",\"prefix\":\"debug.getmetatable\"},\"debug.getregistry\":{\"body\":\"debug.getregistry \",\"description\":\"debug.getregistry ()\",\"prefix\":\"debug.getregistry\"},\"debug.getupvalue\":{\"body\":\"debug.getupvalue  ${1:f}, ${2:up} \",\"description\":\"debug.getupvalue (f, up)\",\"prefix\":\"debug.getupvalue\"},\"debug.getuservalue\":{\"body\":\"debug.getuservalue ${0:...}\",\"description\":\"debug.getuservalue (u)\",\"prefix\":\"debug.getuservalue\"},\"debug.getuservalue \":{\"body\":\"debug.getuservalue   ${1:u} \",\"description\":\"debug.getuservalue (u)\",\"prefix\":\"debug.getuservalue \"},\"debug.setfenv\":{\"body\":\"debug.setfenv ${0:...}\",\"description\":\"debug.setfenv (object, table)\",\"prefix\":\"debug.setfenv\"},\"debug.sethook\":{\"body\":\"debug.sethook  ${1:[thead,]}${2:hook}, ${3:mask}${4:[, count]} \",\"description\":\"debug.sethook ([thread,] hook, mask [, count])\",\"prefix\":\"debug.sethook\"},\"debug.setlocal\":{\"body\":\"debug.setlocal  ${1:[thead,]}${2:level}, ${3:local}, ${4:value} \",\"description\":\"debug.setlocal ([thread,] level, local, value)\",\"prefix\":\"debug.setlocal\"},\"debug.setmetatable\":{\"body\":\"debug.setmetatable  ${1:value}, ${2:table} \",\"description\":\"debug.setmetatable (value, table)\",\"prefix\":\"debug.setmetatable\"},\"debug.setupvalue\":{\"body\":\"debug.setupvalue  ${1:f}, ${2:up}, ${3:value} \",\"description\":\"debug.setupvalue (f, up, value)\",\"prefix\":\"debug.setupvalue\"},\"debug.setuservalue\":{\"body\":\"debug.setuservalue  ${1:udata}, ${2:value} \",\"description\":\"debug.setuservalue (udata, value)\",\"prefix\":\"debug.setuservalue\"},\"debug.traceback\":{\"body\":\"debug.traceback  ${1:[thread,]}${2:[message]}${3:[, level]} \",\"description\":\"debug.traceback ([thread,] [message [, level]])\",\"prefix\":\"debug.traceback\"},\"debug.upvalueid\":{\"body\":\"debug.upvalueid  ${1:f}, ${2:n}\",\"description\":\"debug.upvalueid (f, n)\",\"prefix\":\"debug.upvalueid\"},\"debug.upvaluejoin\":{\"body\":\"debug.upvaluejoin  ${1:f1}, ${2:n1}, ${3:f2}, ${4:n2} \",\"description\":\"debug.upvaluejoin (f1, n1, f2, n2)\",\"prefix\":\"debug.upvaluejoin\"},\"dofile\":{\"body\":\"dofile ${1:[filename]}\",\"description\":\"dofile ([filename])\",\"prefix\":\"dofile\"},\"error\":{\"body\":\"error ${0:...}\",\"description\":\"error (message [, level])\",\"prefix\":\"error\"},\"file:close\":{\"body\":\"file:close ${0:...}\",\"description\":\"file:close ()\",\"prefix\":\"file:close\"},\"file:flush\":{\"body\":\"file:flush ${0:...}\",\"description\":\"file:flush ()\",\"prefix\":\"file:flush\"},\"file:lines\":{\"body\":\"file:lines ${0:...}\",\"description\":\"file:lines ()\",\"prefix\":\"file:lines\"},\"file:read\":{\"body\":\"file:read ${0:...}\",\"description\":\"file:read (...)\",\"prefix\":\"file:read\"},\"file:seek\":{\"body\":\"file:seek ${0:...}\",\"description\":\"file:seek ([whence] [, offset])\",\"prefix\":\"file:seek\"},\"file:setvbuf\":{\"body\":\"file:setvbuf ${0:...}\",\"description\":\"file:setvbuf (mode [, size])\",\"prefix\":\"file:setvbuf\"},\"file:write\":{\"body\":\"file:write ${0:...}\",\"description\":\"file:write (...)\",\"prefix\":\"file:write\"},\"getfenv\":{\"body\":\"getfenv ${0:...}\",\"description\":\"getfenv ([f])\",\"prefix\":\"getfenv\"},\"getmetatable\":{\"body\":\"getmetatable ${1:object}\",\"description\":\"getmetatable (object)\",\"prefix\":\"getmetatable\"},\"io.close\":{\"body\":\"io.close ${0:...}\",\"description\":\"io.close ([file])\",\"prefix\":\"io.close\"},\"io.flush\":{\"body\":\"io.flush ${0:...}\",\"description\":\"io.flush ()\",\"prefix\":\"io.flush\"},\"io.input\":{\"body\":\"io.input ${0:...}\",\"description\":\"io.input ([file])\",\"prefix\":\"io.input\"},\"io.lines\":{\"body\":\"io.lines ${0:...}\",\"description\":\"io.lines ([filename])\",\"prefix\":\"io.lines\"},\"io.open\":{\"body\":\"io.open ${0:...}\",\"description\":\"io.open (filename [, mode])\",\"prefix\":\"io.open\"},\"io.output\":{\"body\":\"io.output ${0:...}\",\"description\":\"io.output ([file])\",\"prefix\":\"io.output\"},\"io.popen\":{\"body\":\"io.popen ${0:...}\",\"description\":\"io.popen (prog [, mode])\",\"prefix\":\"io.popen\"},\"io.read\":{\"body\":\"io.read ${0:...}\",\"description\":\"io.read (...)\",\"prefix\":\"io.read\"},\"io.tmpfile\":{\"body\":\"io.tmpfile ${0:...}\",\"description\":\"io.tmpfile ()\",\"prefix\":\"io.tmpfile\"},\"io.type\":{\"body\":\"io.type ${0:...}\",\"description\":\"io.type (obj)\",\"prefix\":\"io.type\"},\"io.write\":{\"body\":\"io.write ${0:...}\",\"description\":\"io.write (...)\",\"prefix\":\"io.write\"},\"ipairs\":{\"body\":\"ipairs ${0:...}\",\"description\":\"ipairs (t)\",\"prefix\":\"ipairs\"},\"load\":{\"body\":\"load ${0:...}\",\"description\":\"load (func [, chunkname])\",\"prefix\":\"load\"},\"loadfile\":{\"body\":\"loadfile ${0:...}\",\"description\":\"loadfile ([filename])\",\"prefix\":\"loadfile\"},\"loadstring\":{\"body\":\"loadstring ${0:...}\",\"description\":\"loadstring (string [, chunkname])\",\"prefix\":\"loadstring\"},\"export\":{\"body\":\"export ${1:x} = ${0:1}\",\"description\":\"export x = 1\",\"prefix\":\"export\"},\"math.abs\":{\"body\":\"math.abs  ${1:x} \",\"description\":\"math.abs\",\"prefix\":\"math.abs\"},\"math.acos\":{\"body\":\"math.acos  ${1:x} \",\"description\":\"math.acos\",\"prefix\":\"math.acos\"},\"math.asin\":{\"body\":\"math.asin  ${1:x} \",\"description\":\"math.asin\",\"prefix\":\"math.asin\"},\"math.atan\":{\"body\":\"math.atan  ${1:y}${2:[, x]} \",\"description\":\"math.atan\",\"prefix\":\"math.atan\"},\"math.atan2\":{\"body\":\"math.atan2 ${0:...}\",\"description\":\"math.atan2 (y, x)\",\"prefix\":\"math.atan2\"},\"math.ceil\":{\"body\":\"math.ceil  ${1:x} \",\"description\":\"math.ceil\",\"prefix\":\"math.ceil\"},\"math.cos\":{\"body\":\"math.cos  ${1:x} \",\"description\":\"math.cos\",\"prefix\":\"math.cos\"},\"math.cosh\":{\"body\":\"math.cosh ${0:...}\",\"description\":\"math.cosh (x)\",\"prefix\":\"math.cosh\"},\"math.deg\":{\"body\":\"math.deg  ${1:x} \",\"description\":\"math.deg\",\"prefix\":\"math.deg\"},\"math.exp\":{\"body\":\"math.exp  ${1:x} \",\"description\":\"math.exp\",\"prefix\":\"math.exp\"},\"math.floor\":{\"body\":\"math.floor  ${1:x} \",\"description\":\"math.floor\",\"prefix\":\"math.floor\"},\"math.fmod\":{\"body\":\"math.fmod  ${1:x},${2:y} \",\"description\":\"math.fmod\",\"prefix\":\"math.fmod\"},\"math.frexp\":{\"body\":\"math.frexp ${0:...}\",\"description\":\"math.frexp (x)\",\"prefix\":\"math.frexp\"},\"math.huge\":{\"body\":\"math.huge ${0:...}\",\"description\":\"math.huge\",\"prefix\":\"math.huge\"},\"math.ldexp\":{\"body\":\"math.ldexp ${0:...}\",\"description\":\"math.ldexp (m, e)\",\"prefix\":\"math.ldexp\"},\"math.log\":{\"body\":\"math.log  ${1:x}${2:[, base]} \",\"description\":\"math.log\",\"prefix\":\"math.log\"},\"math.log10\":{\"body\":\"math.log10 ${0:...}\",\"description\":\"math.log10 (x)\",\"prefix\":\"math.log10\"},\"math.math.randomseed\":{\"body\":\"math.math.randomseed  ${1:x} \",\"description\":\"math.math.randomseed\",\"prefix\":\"math.math.randomseed\"},\"math.max\":{\"body\":\"math.max  ${1:x},${2:...} \",\"description\":\"math.max\",\"prefix\":\"math.max\"},\"math.maxinteger\":{\"body\":\"math.maxinteger ${0:...}\",\"description\":\"math.maxinteger\",\"prefix\":\"math.maxinteger\"},\"math.min\":{\"body\":\"math.min  ${1:x},${2:...} \",\"description\":\"math.min\",\"prefix\":\"math.min\"},\"math.mininteger\":{\"body\":\"math.mininteger ${0:...}\",\"description\":\"math.mininteger\",\"prefix\":\"math.mininteger\"},\"math.modf\":{\"body\":\"math.modf  ${1:x} \",\"description\":\"math.modf\",\"prefix\":\"math.modf\"},\"math.pi\":{\"body\":\"math.pi ${0:...}\",\"description\":\"math.pi\",\"prefix\":\"math.pi\"},\"math.pow\":{\"body\":\"math.pow ${0:...}\",\"description\":\"math.pow (x, y)\",\"prefix\":\"math.pow\"},\"math.rad\":{\"body\":\"math.rad ${0:...}\",\"description\":\"math.rad (x)\",\"prefix\":\"math.rad\"},\"math.random\":{\"body\":\"math.random  ${1:[m]}${2:[, n]} \",\"description\":\"math.random\",\"prefix\":\"math.random\"},\"math.randomseed\":{\"body\":\"math.randomseed ${0:...}\",\"description\":\"math.randomseed (x)\",\"prefix\":\"math.randomseed\"},\"math.sin\":{\"body\":\"math.sin  ${1:x} \",\"description\":\"math.sin\",\"prefix\":\"math.sin\"},\"math.sinh\":{\"body\":\"math.sinh ${0:...}\",\"description\":\"math.sinh (x)\",\"prefix\":\"math.sinh\"},\"math.sqrt\":{\"body\":\"math.sqrt  ${1:x} \",\"description\":\"math.sqrt\",\"prefix\":\"math.sqrt\"},\"math.tan\":{\"body\":\"math.tan  ${1:x} \",\"description\":\"math.tan\",\"prefix\":\"math.tan\"},\"math.tanh\":{\"body\":\"math.tanh ${0:...}\",\"description\":\"math.tanh (x)\",\"prefix\":\"math.tanh\"},\"math.tointeger\":{\"body\":\"math.tointeger  ${1:x} \",\"description\":\"math.tointeger\",\"prefix\":\"math.tointeger\"},\"math.type\":{\"body\":\"math.type  ${1:x} \",\"description\":\"math.type\",\"prefix\":\"math.type\"},\"math.ult\":{\"body\":\"math.ult ${0:...}\",\"description\":\"math.ult (m, n)\",\"prefix\":\"math.ult\"},\"module\":{\"body\":\"module ${0:...}\",\"description\":\"module (name [, ...])\",\"prefix\":\"module\"},\"next\":{\"body\":\"next ${1:table}${2:[, index]}\",\"description\":\"next (table [, index])\",\"prefix\":\"next\"},\"os.clock\":{\"body\":\"os.clock ${0:...}\",\"description\":\"os.clock ()\",\"prefix\":\"os.clock\"},\"os.date\":{\"body\":\"os.date ${0:...}\",\"description\":\"os.date ([format [, time]])\",\"prefix\":\"os.date\"},\"os.difftime\":{\"body\":\"os.difftime ${0:...}\",\"description\":\"os.difftime (t2, t1)\",\"prefix\":\"os.difftime\"},\"os.execute\":{\"body\":\"os.execute ${0:...}\",\"description\":\"os.execute ([command])\",\"prefix\":\"os.execute\"},\"os.exit\":{\"body\":\"os.exit ${0:...}\",\"description\":\"os.exit ([code])\",\"prefix\":\"os.exit\"},\"os.getenv\":{\"body\":\"os.getenv ${0:...}\",\"description\":\"os.getenv (varname)\",\"prefix\":\"os.getenv\"},\"os.remove\":{\"body\":\"os.remove ${0:...}\",\"description\":\"os.remove (filename)\",\"prefix\":\"os.remove\"},\"os.rename\":{\"body\":\"os.rename ${0:...}\",\"description\":\"os.rename (oldname, newname)\",\"prefix\":\"os.rename\"},\"os.setlocale\":{\"body\":\"os.setlocale ${0:...}\",\"description\":\"os.setlocale (locale [, category])\",\"prefix\":\"os.setlocale\"},\"os.time\":{\"body\":\"os.time ${0:...}\",\"description\":\"os.time ([table])\",\"prefix\":\"os.time\"},\"os.tmpname\":{\"body\":\"os.tmpname ${0:...}\",\"description\":\"os.tmpname ()\",\"prefix\":\"os.tmpname\"},\"package.config\":{\"body\":\"package.config ${0:...}\",\"description\":\"package.config\",\"prefix\":\"package.config\"},\"package.cpath\":{\"body\":\"package.cpath ${0:...}\",\"description\":\"package.cpath\",\"prefix\":\"package.cpath\"},\"package.loaded\":{\"body\":\"package.loaded ${0:...}\",\"description\":\"package.loaded\",\"prefix\":\"package.loaded\"},\"package.loaders\":{\"body\":\"package.loaders ${0:...}\",\"description\":\"package.loaders\",\"prefix\":\"package.loaders\"},\"package.loadlib\":{\"body\":\"package.loadlib ${0:...}\",\"description\":\"package.loadlib (libname, funcname)\",\"prefix\":\"package.loadlib\"},\"package.path\":{\"body\":\"package.path ${0:...}\",\"description\":\"package.path\",\"prefix\":\"package.path\"},\"package.preload\":{\"body\":\"package.preload ${0:...}\",\"description\":\"package.preload\",\"prefix\":\"package.preload\"},\"package.searchers\":{\"body\":\"package.searchers ${0:...}\",\"description\":\"package.searchers\",\"prefix\":\"package.searchers\"},\"package.searchpath\":{\"body\":\"package.searchpath ${0:...}\",\"description\":\"package.searchpath (name, path [, sep [, rep]])\",\"prefix\":\"package.searchpath\"},\"package.seeall\":{\"body\":\"package.seeall ${0:...}\",\"description\":\"package.seeall (module)\",\"prefix\":\"package.seeall\"},\"pairs\":{\"body\":\"pairs ${0:...}\",\"description\":\"pairs (t)\",\"prefix\":\"pairs\"},\"pcall\":{\"body\":\"pcall ${0:...}\",\"description\":\"pcall (f, arg1, ...)\",\"prefix\":\"pcall\"},\"print\":{\"body\":\"print ${1:...}\",\"description\":\"print(...)\",\"prefix\":\"print\"},\"require\":{\"body\":\"require\\\"${1:module}\\\"\",\"description\":\"require \\\"...\\\"\",\"prefix\":\"require\"},\"ret\":{\"body\":\"return ${1:...}\",\"description\":\"return ...\",\"prefix\":\"return\"},\"select\":{\"body\":\"select ${1:index}, ${2:...}\",\"description\":\"select (index, \\u00b7\\u00b7\\u00b7)\",\"prefix\":\"select\"},\"setfenv\":{\"body\":\"setfenv ${0:...}\",\"description\":\"setfenv (f, table)\",\"prefix\":\"setfenv\"},\"setmetatable\":{\"body\":\"setmetatable ${1:table}, ${2:metatable}\",\"description\":\"setmetatable (table, metatable)\",\"prefix\":\"setmetatable\"},\"tonumber\":{\"body\":\"tonumber ${1:e}${2:[, base]}\",\"description\":\"tonumber (e [, base])\",\"prefix\":\"tonumber\"},\"tostring\":{\"body\":\"tostring ${1:v}\",\"description\":\"tostring (v)\",\"prefix\":\"tostring\"},\"type\":{\"body\":\"type ${1:v}\",\"description\":\"type (v)\",\"prefix\":\"type\"},\"unpack\":{\"body\":\"unpack ${0:...}\",\"description\":\"unpack (list [, i [, j]])\",\"prefix\":\"unpack\"},\"xpcall\":{\"body\":\"xpcall ${0:...}\",\"description\":\"xpcall (f, err)\",\"prefix\":\"xpcall\"}}"

json = require("json")
local rt = json:decode(luaData)
local doc = text:gsub("\r",""):split("\n")

local last = {}
for i=1,#doc do
    if doc[i]:find("### (.+)") == 1 then
        if last.prefix then
            rt[last.prefix] = last
            print(last.body)
            last = {}
        end
        last.prefix = doc[i]:match("### (.+)"):gsub("\r","")
    elseif last.prefix and doc[i]:len() > 2 and not last.description then
        last.description = doc[i]:gsub("\r","")
        if last.prefix:find("%(.+%)") then--对有参数的接口进行处理
            local args = last.prefix:match("%(.+%)")
            if not args:find(",") then--只有一个参数的情况
                last.body = last.prefix:gsub("%((.+)%)"," ${1:%1}")
            else
                local gt = args:sub(2,-2):split(",")
                local tt = {}
                for i=1,#gt do
                    table.insert(tt,"${"..i..":"..gt[i].."}")
                end
                last.body = last.prefix:gsub("%((.+)%)"," "..table.concat(tt,","))
            end
        else
            last.body = last.prefix:gsub("%(.*%)","!")
        end
    elseif doc[i]:find("%- 返回值") == 1 or doc[i]:find("%* 返回值") == 1 and last.description then
        last.description = last.description.."\r\n返回值：\r\n"..doc[i+2]:gsub("<br>","\r\n")
    elseif doc[i]:find("%- 例子") == 1 or doc[i]:find("%* 例子") == 1 and doc[i+2]:find("```") and last.description then
        last.description = last.description.."\r\n例子：\r\n"
        local tempi = i+3
        while doc[tempi]:find("```") ~= 1 do
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

