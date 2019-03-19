local text = {"",}
local lastLine = 1

local moduleName

--获取本文件的注释
local moduleInfo = {lines[1]:match("%-%-%- *(.+)"),}
for i=2,#lines do
    if lines[i]:find("@module") then
        moduleName = lines[i]:match("%-%- *@module *(.+)")
        table.insert(text, "## "..lines[i]:match("%-%- *@module *(.+)"))
        table.insert(text, "")
        lastLine = i
        break
    else
        table.insert(moduleInfo, lines[i]:match("%-%- *(.+)"))
    end
end
moduleInfo = table.concat( moduleInfo, "\r\n")
table.insert(text, moduleInfo)
table.insert(text, "")

--每个函数循环处理
while lastLine < #lines do
    --匹配注释第一行，开始处理该函数
    if lines[lastLine]:find("%-%-%- *.+") == 1 and not lines[lastLine]:find("%-%-%-%-") and lines[lastLine+1]:find("%-%- *.+") == 1 then
        --函数解释
        local functionInfo = lines[lastLine]:match("%-%-%- *(.+)")
        --table.insert(text, functionInfo)
        local functionName
        local all = {}
        for i=lastLine+1,#lines do
            if lines[i]:find("function ") == 1 then
                lastLine = i+2
                functionName = lines[i]:match("function *(.+)")
                break
            elseif lines[i]:find("%-%-%- *.+") == 1 then
                break
            else
                table.insert(all,lines[i])
            end
        end
        if functionName then--匹配成功
            functionName = functionName:gsub(" *, *",", ")
            --加上函数开头
            table.insert(text, "### "..moduleName.."."..functionName)
            table.insert(text, "")
            table.insert(text, functionInfo)
            table.insert(text, "")

            --上次处理的函数信息行数
            local last = 1

            --筛选出传入参数值
            local para = {}
            for i=last,#all do
                if all[i]:find("%-%- *@return") == 1 or all[i]:find("%-%- *@usage") == 1 then
                    last = i
                    break
                else
                    if all[i]:find("%-%- *@") == 1 then
                        --获取参数信息与解释
                        local ft,fi = all[i]:match("%-%- *@(%w+) (.+)")
                        if not ft then
                            ft,fi = all[i]:match("%-%- *@(%w+)%[opt=.+%] (.+)")
                            local choseType = all[i]:match("%-%- *@%w+%[opt=(.+)%] .+")
                            if fi then fi = "**可选参数，默认为`"..(choseType or "nil").."`**，"..fi end
                        end
                        if ft then
                            table.insert(para, {type=ft,info=(fi or "")})
                        end
                    else
                        if para[#para] then
                            para[#para].info = para[#para].info.."<br>"..(all[i]:match("%-%- *(.+)") or "")
                        end
                    end
                end
                if i == #all then last = i end--没匹配到下一个，避免出错，直接结束本区块
            end
            local paraText = {"|传入值类型|释义|","|-|-|"}
            for i=1,#para do
                table.insert(paraText,"|"..para[i].type.."|"..para[i].info.."|")
            end
            table.insert(text, "* 参数")
            table.insert(text, "")
            if #para ~= 0 then
                table.insert(text, table.concat(paraText,"\r\n"))
            else
                table.insert(text, "无")
            end
            table.insert(text, "")

            --筛选出返回值参数
            local returnInfo = {}
            for i=last,#all do
                if all[i]:find("%-%- *@return") == 1 then
                    table.insert(returnInfo, all[i]:match("%-%- *@return *(.+)") or "")
                elseif all[i]:find("%-%- *@usage") == 1 then
                    last = i
                    break
                else
                    if returnInfo[#returnInfo] then
                        returnInfo[#returnInfo] = returnInfo[#returnInfo].."<br>"..(all[i]:match("%-%- *@return *(.+)") or "")
                    end
                end
                if i == #all then last = i end--没匹配到下一个，避免出错，直接结束本区块
            end
            table.insert(text, "* 返回值")
            table.insert(text, "")
            if #returnInfo ~= 0 then
                table.insert(text, table.concat(returnInfo,"\r\n"))
            else
                table.insert(text, "无")
            end
            table.insert(text, "")

            if last ~= #all+1 then
                --筛选出示例参数
                local example = {}
                for i=last,#all do
                    local usage
                    if all[i]:find("%-%- *@usage.+") == 1 then
                        usage = all[i]:match("%-%- *@usage *(.+)") or ""
                    elseif all[i]:find("%-%- *.+") == 1 and all[i]:find("%-%- *@usage") ~= 1 and all[i]:find("%-%- *@return") ~= 1 then
                        usage = all[i]:match("%-%- *(.+)") or ""
                    end
                    if usage and usage:gsub(" *","") ~= "" then--过滤掉空行
                        table.insert(example, usage)
                    end
                    if i == #all then last = i end--没匹配到下一个，避免出错，直接结束本区块
                end

                --第一个字符为中文的，该行直接注释掉
                for i=1,#example do
                    local first = example[i]:byte()
                    if not (first>0 and first<=127) then
                        example[i] = "-- "..example[i]
                    end
                end

                table.insert(text, "* 例子")
                table.insert(text, "")
                if #example ~= 0 then
                    table.insert(text, "```lua")
                    table.insert(text, table.concat(example,"\r\n"))
                    table.insert(text, "```")
                else
                    table.insert(text, "无")
                end
                table.insert(text, "")
            end



            table.insert(text, "---")
            table.insert(text, "")
        else
            lastLine = lastLine + 1
        end
    else
        lastLine = lastLine + 1
    end
end

result = table.concat(text, "\r\n")
