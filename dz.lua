function Func(arr)
    local half = Sum(arr)
    local sum1 = 0
    local index = 0
    local j = 0
    for x in pairs(arr) do
        j = j + 1
        sum1 = sum1 + arr[x]['p']
        if sum1 * 2 >= half then
            index = j + (math.abs(2 * sum1 - half) < math.abs(2 * (sum1 - arr[x]['p']) - half))
            break
    end
    end

    local arr0, arr1 = {}, {}
    local i = 0
    for x in pairs(arr) do
        if i >= index then
            break
        end
        arr[x]['code'] = arr[x]['code'] + '0'
        arr0 = arr[x]
        i = i + 1
    end
    for x in pairs(arr) do
        if i < index then
            ::continue::
        end
        i = i + 1
        arr[x]['code'] = arr[x]['code'] + '1'
        arr1[x] = arr[x]
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
    for x in pairs(arr) do
        out = out + arr[x]['p']
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
alp['а']['Code'] = 1111
print(alp['а']['p'], alp['а']['Code'], Len(alp))

for x in pairs(alp) do
    print(x,alp[x]['p'])
end
print(alp['a'])

Code = {}