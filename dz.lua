function Func(arr)
    local half = Sum(arr)
    local sum1 = 0
    local index = 0
    local j = 0
    for x in pairs(arr) do
        if type(x) ~= "table" then
            goto continue
        end
        j = j + 1
        sum1 = sum1 + arr[x]['p']
        if sum1 * 2 >= half then
            local add = 0
            if math.abs(2 * sum1 - half) < math.abs(2 * (sum1 - arr[x]['p']) - half) then
                add = 1
            end
            index = j + add
            break
        end
        ::continue::
    end

    local arr0, arr1 = {}, {}
    local i = 0
    for x in pairs(arr) do
        if i >= index then
            break
        end
        arr[x]['code'] = arr[x]['code'] .. '0'
        arr0 = arr[x]
        i = i + 1
    end
    for x in pairs(arr) do
        if i < index | type(x) ~= "table" then
            goto continue
        end
        arr[x]['code'] = arr[x]['code'] .. '1'
        arr1[x] = arr[x]
        ::continue::
        i = i + 1
    end
    if Len(arr1) == 1 then 
        table.insert(Code, arr1)
    else
        Func(arr1)
    end
    if Len(arr0) == 1 then
        table.insert(Code, arr0)
    else
        Func(arr0)
    end
end


function Sum(arr)
    local out = 0
    for x,v in pairs(arr) do
        if type(x) ~= "table" then
            goto continue
        end
        print(x)
        out = out + arr[x]['p']
        ::continue::
    end
    return out
end

function Len(arr)
    local size = 0
    for _ in pairs(arr) do size = size + 1 end
    return size
end


os.execute("chcp 65001")
local alp = {}
alp['а'] = {}
alp['а']['p'] = 0.1
alp['а']['code'] = ''

Code = {}

Func(alp)
for x in pairs(alp) do
    print(x, alp[x]['p'], alp[x]['code'])
end
