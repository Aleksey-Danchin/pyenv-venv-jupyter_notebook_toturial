# Эталонное решение: диагностика Python-среды в Linux

## Команды

Выполните все 7 команд последовательно:

```bash
which python3
whereis python3
echo $PATH
ls -l /usr/bin/python3
readlink -f /usr/bin/python3
python3 -m pip --version
python3 -m site
```

## Что проверить в выводе

| Шаг | Команда | На что смотреть |
|-----|---------|-----------------|
| 1 | `which python3` | Путь к бинарю, обычно `/usr/bin/python3`. |
| 2 | `whereis python3` | Несколько путей: бинарь, библиотеки, man-страницы. |
| 3 | `echo $PATH` | Список директорий через `:`, порядок = приоритет. |
| 4 | `ls -l /usr/bin/python3` | Символ `l` в начале и стрелка `->` = симлинк. |
| 5 | `readlink -f /usr/bin/python3` | Конечный бинарь, например `/usr/bin/python3.12`. |
| 6 | `python3 -m pip --version` | Версия pip и путь `from ...` к его Python. |
| 7 | `python3 -m site` | Пути `site-packages`, `USER_BASE`, `USER_SITE`. |

## Критерии выполнения

- Все 7 команд отработали без ошибок.
- Вы понимаете, что показывает каждая строка вывода.
- Вы можете объяснить, какой Python сейчас активен и почему.
