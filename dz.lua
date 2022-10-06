function Func(arr)
    local half = Sum(arr)
    local sum1 = 0
    local index = 1
    local j = 1
    for x in pairs(arr) do
        j = j + 1
        sum1 = sum1 + arr[x][2]
        if sum1 * 2 >= half then
            local add = 0
            if math.abs(2 * sum1 - half) < math.abs(2 * (sum1 - arr[x][2]) - half) and Len(arr) ~= 2 then
                add = 1
            end
            index = j + add
            break
        end
    end

    local arr0, arr1 = {}, {}
    local i = 1
    for x in pairs(arr) do
        if i >= index then
            break
        end
        arr[x][3] = arr[x][3] .. '0'
        table.insert(arr0, arr[x])
        i = i + 1
    end
    for x in pairs(arr) do
        if x < index then
            goto continue
        end
        arr[x][3] = arr[x][3] .. '1'
        table.insert(arr1, arr[x])
        ::continue::
        i = i + 1
    end
    if Len(arr1) == 1 then 
        table.insert(Code, arr1[1])
    else
        Func(arr1)
    end
    if Len(arr0) == 1 then
        table.insert(Code, arr0[1])
    else
        Func(arr0)
    end
end


function Sum(arr)
    local out = 0
    for x,v in pairs(arr) do
        out = out + arr[x][2]
        ::continue::
    end
    return out
end

function Len(arr)
    local size = 0
    for _ in pairs(arr) do 
        size = size + 1 
    end
    return size
end

function Compare(a,b)
    return a[2] > b[2]
  end
  


os.execute("chcp 1251")

local alp = {}
io.write('Введите количество символов: ')
local n = io.read('n')
print(type(n))
for j=1,n do
    io.write('Введите символ: ')
    local _ = io.read()
    local a = io.read("l")
    io.write('Введите вероятность символа: ')
    local p = io.read('n')
    alp[j] = {}
    alp[j][1] = a
    alp[j][2] = p
    alp[j][3] = ''
end

table.sort(alp, Compare)
Code = {}
Func(alp)
table.sort(Code, Compare)
for x in pairs(alp) do
    print(Code[x][1], Code[x][2], Code[x][3])
end