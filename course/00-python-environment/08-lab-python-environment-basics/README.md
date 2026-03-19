← [Назад](../07-test-python-environment/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)

# Лабораторная: диагностика Python-среды в Linux

> **Модуль 0 · Лабораторная 08** | Время: ~5 мин

## Задание

Выполните 7 диагностических команд и сравните свой вывод с эталонным.

Для каждой команды:

1. Выполните её в терминале.
2. Убедитесь, что вывод соответствует ожидаемому формату (конкретные пути зависят от вашей системы).

## Шаг 1 — Путь к активному `python3`

```bash
which python3
```

**Эталонный вывод (формат):**

```
/usr/bin/python3
```

Путь может отличаться, но должен указывать на реальный исполняемый файл.

## Шаг 2 — Системные расположения `python3`

```bash
whereis python3
```

**Эталонный вывод (формат):**

```
python3: /usr/bin/python3 /usr/lib/python3 /usr/share/man/man1/python3.1.gz
```

В выводе должно быть несколько путей: бинарь, библиотеки, документация.

## Шаг 3 — Текущее значение `PATH`

```bash
echo $PATH
```

**Эталонный вывод (формат):**

```
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

Директории разделены двоеточием. Порядок определяет приоритет поиска.

## Шаг 4 — Симлинк `/usr/bin/python3`

```bash
ls -l /usr/bin/python3
```

**Эталонный вывод (формат):**

```
lrwxrwxrwx 1 root root 10 мар 14 12:00 /usr/bin/python3 -> python3.12
```

Символ `l` в начале и стрелка `->` означают, что это симлинк.

## Шаг 5 — Конечная цель цепочки симлинков

```bash
readlink -f /usr/bin/python3
```

**Эталонный вывод (формат):**

```
/usr/bin/python3.12
```

Это реальный бинарный файл, на который указывает вся цепочка.

## Шаг 6 — Связка pip и Python

```bash
python3 -m pip --version
```

**Эталонный вывод (формат):**

```
pip 24.0 from /usr/lib/python3/dist-packages/pip (python 3.12)
```

Обратите внимание на путь `from ...` — он показывает, к какому Python привязан pip.

## Шаг 7 — Директории Python-пакетов

```bash
python3 -m site
```

**Эталонный вывод (формат):**

```
sys.path = [
    '/home/user',
    '/usr/lib/python312.zip',
    '/usr/lib/python3.12',
    '/usr/lib/python3.12/lib-dynload',
    '/usr/local/lib/python3.12/dist-packages',
    '/usr/lib/python3/dist-packages',
    '/usr/lib/python3.12/dist-packages',
]
USER_BASE: '/home/user/.local' (exists)
USER_SITE: '/home/user/.local/lib/python3.12/site-packages' (doesn't exist)
ENABLE_USER_SITE: True
```

Здесь видны все директории, куда Python ищет и устанавливает пакеты.

## Самопроверка

Если все 7 команд отработали без ошибок и вы можете объяснить каждую строку вывода — лабораторная выполнена.

Сверьтесь с [эталонным решением](solution.md), если что-то вызвало затруднения.

---

← [Назад](../07-test-python-environment/README.md) | [Оглавление](../../README.md) | [Далее →](../README.md)