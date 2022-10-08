# Кодировка методом Шеннона-Фано

## Выполнил студент БББО-05-20 Романько Максим

## Использование

Чтобы запустить программу, необходимо перейти в папку с ней и в консоль ввести команду:

```console
lua54.exe fano.lua
```

Появляется ввод режима вводы данных

```console
1. Ввод строки
2. Посимвольный ввод
```

Режим вводе целой строки для кодирования

```console
Выберите режим работы: 1
Введите строку: фывфыаапнгшльтимавуцывапрнгшщзждьтирпекукуывенрошщл

Кодировка методом Шеннона-Фано
|  Символ  |    Вероятность   | Код
|    в     |    0.078         | 111
|    ы     |    0.078         | 1101
|    а     |    0.078         | 1100
|    н     |    0.059         | 1011
|    р     |    0.059         | 1010
|    у     |    0.059         | 1001
|    п     |    0.059         | 1000
|    ш     |    0.059         | 0111
|    щ     |    0.039         | 01101
|    ф     |    0.039         | 01100
|    е     |    0.039         | 0101
|    к     |    0.039         | 01001
|    и     |    0.039         | 01000
|    т     |    0.039         | 0011
|    л     |    0.039         | 00101
|    ь     |    0.039         | 00100
|    г     |    0.039         | 00011
|    д     |    0.020         | 000101
|    ж     |    0.020         | 000100
|    з     |    0.020         | 000011
|    ц     |    0.020         | 000010
|    м     |    0.020         | 000001
|    о     |    0.020         | 000000
```

Интерфейс ввода количества символов и их вероятностей при посимвольном вводе:

```console
Введите количество символов: 6
Введите символ: а
Введите вероятность символа: 0.23
Введите символ: б
Введите вероятность символа: 0.17
Введите символ: в
Введите вероятность символа: 0.1
Введите символ: г
Введите вероятность символа: 0.15
Введите символ: д
Введите вероятность символа: 0.1
Введите символ: е
Введите вероятность символа: 0.25
```
После выводится таблица с кодирвкой введенных символов в соотвествии с методом Шеннона-Фано

```console
Кодировка методом Шеннона-Фано
|  Символ  |    Вероятность   | Код
|    е     |    0.250         | 00
|    а     |    0.230         | 01
|    б     |    0.170         | 100
|    г     |    0.150         | 101
|    д     |    0.100         | 110
|    в     |    0.100         | 111
```