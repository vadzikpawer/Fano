function Func(arr)
    local half = Sum(arr)
    local sum1 = 0
    local index = 1
    local j = 1
    for x in pairs(arr) do
        sum1 = sum1 + arr[x][2]
        if sum1 * 2 >= half then
            local add = 0
            if math.abs(2 * sum1 - half) < math.abs(2 * (sum1 - arr[x][2]) - half) and Len(arr) ~= 2 then
                add = 1
            end
            if Len(arr) == 2 or Len(arr) == 3 then
                index = 2
            else
                index = x + add
            end
            break
        end
    end

    local arr0, arr1 = {}, {}
    local i = 1
    for x in pairs(arr) do
        if i < index then
            goto continue
        end
        arr[x][3] = arr[x][3] .. '0'
        table.insert(arr0, arr[x])
        ::continue::
        i = i + 1
    end
    for x in pairs(arr) do
        if x >= index then
            break
        end
        arr[x][3] = arr[x][3] .. '1'
        table.insert(arr1, arr[x])
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
  

function PrintArr(arr)
    
    print('\n\nКодировка методом Шеннона-Фано')
    print('|  Символ  |    Вероятность   | Код')
    for x in pairs(arr) do
        print(string.format('|    %s     |    %.3f         | %s ',arr[x][1], arr[x][2], arr[x][3]))
    end
    print('\n')
end

function StrToTb(str)
    local out = {}
    str = Clean(str)
    print(str)
    local ln = 0
    for i = 1, #str do
        ln = ln + 1
        local c = str:sub(i,i)
        local index = Is(out, c)
        if index ~= -1 then
            out[index][2] = out[index][2] + 1
        else
            out[Len(out)+1] = {}
            out[Len(out)][1] = c
            out[Len(out)][2] = 1
            out[Len(out)][3] = ''
        end
    end
    for i=1, #out do
        out[i][2] = out[i][2]/ln
    end
    return out
end

function Is(arr, symb)
    local j = -1
    if Len(arr) == 0 then
        return -1
    end
    for i=1, #arr do
        if arr[i][1] == symb then
            return i
        end
    end
    return j
end

function Clean(str)
    for i=1,#str do
        local c = str:sub(i,i)
        if c == '.' or c == ',' or c == '?' or c == '/' then
            str = str:sub(1,i-1) .. str:sub(i+1)
        end
    end
    return str
end


local alp = {}
Code = {}

os.execute("chcp 1251")
print("1. Ввод строки")
print("2. Посимвольный ввод")
io.write('Выберите режим работы: ')
local n = io.read('n')
if n == 2 then
    io.write('Введите количество символов: ')
    n = io.read('n')
    for j=1,n do
        io.write('Введите символ: ')
        local _ = io.read()
        local a = io.read("l")
        io.write('Введите вероятность символа: ')
        local p = io.read('n')
        while  p <= 0 do
            io.write("Вероятность символа не может быть отрицательной или равна 0, Повторите ввод: ")
            p = io.read('n')
        end
        while p > 1 do
            io.write("Вероятность не может быть больше 1, повторите ввод: ")
            p = io.read('n')
        end
        alp[j] = {}
        alp[j][1] = a
        alp[j][2] = p
        alp[j][3] = ''
    end

    if Sum(alp) > 1 then
        print('Суммарная вероятность не может быть больше 1')
        return
    end
elseif n == 1 then
    io.write('Введите строку: ')
    local _ = io.read()
    local a = io.read("l")
    alp = StrToTb(a)
end


table.sort(alp, Compare)

Func(alp)

PrintArr(Code)