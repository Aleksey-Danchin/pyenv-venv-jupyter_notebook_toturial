← [Назад](../01-what-is-pyenv/README.md) | [Оглавление](../../README.md) | [Далее →](../03-installing-python/README.md)

# Тренажёр: Установка pyenv

> **Модуль 1 · Тренажёр 2** | Время: ~5 мин

## Цель

К концу тренажёра у вас будет установлен pyenv, настроен shell, и команда `pyenv --version` будет работать.

## Подготовка

Убедитесь, что у вас есть доступ к терминалу и подключение к интернету. Все команды выполняются от обычного пользователя (без `sudo`, кроме установки системных пакетов).

---

## Шаг 1 — Установка зависимостей сборки

pyenv компилирует Python из исходников. Для этого нужны **зависимости сборки** (build dependencies)[^глоссарий]([Глоссарий](../../references/glossary.md)) — системные библиотеки и инструменты компиляции.

Установите их через `apt`:

```bash
sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev curl git \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
  libffi-dev liblzma-dev
```

**Ожидаемый результат:**

```
Reading package lists... Done
...
0 upgraded, 0 newly installed, ... to remove and 0 not upgraded.
```

Если пакеты уже установлены, `apt` сообщит, что обновлять нечего — это нормально.

> **Что произошло:** вы установили компилятор C (`build-essential`), заголовочные файлы криптографии (`libssl-dev`), сжатия (`zlib1g-dev`, `libbz2-dev`, `liblzma-dev`), работы с терминалом (`libreadline-dev`, `libncursesw5-dev`) и другие библиотеки, которые Python использует при компиляции модулей стандартной библиотеки.

---

## Шаг 2 — Установка pyenv через pyenv-installer

Официальный способ установки — скрипт `pyenv-installer`, который клонирует репозиторий pyenv в `~/.pyenv`:

```bash
curl https://pyenv.run | bash
```

Команда `curl` загружает скрипт-установщик с сайта pyenv.run, а `| bash` передаёт его на выполнение в shell.

**Ожидаемый результат:**

```
Cloning into '/home/<user>/.pyenv'...
...
Cloning into '/home/<user>/.pyenv/plugins/pyenv-virtualenv'...
...
WARNING: seems you still have not added 'pyenv' to the load path.
```

> **Что произошло:** скрипт склонировал репозиторий pyenv и его плагины в `~/.pyenv`. Предупреждение в конце говорит, что pyenv ещё не добавлен в конфигурацию shell — это мы исправим на следующем шаге.

---

## Шаг 3 — Настройка shell

Чтобы pyenv работал, нужно добавить инициализацию в файл конфигурации shell. Для bash это `~/.bashrc`:

```bash
echo '' >> ~/.bashrc
echo '# pyenv' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

**Ожидаемый результат:**

Команды выполняются без вывода — это нормально.

> **Что произошло:** вы добавили три строки в конец `~/.bashrc`:
>
> 1. `PYENV_ROOT` — переменная с путём к директории pyenv.
> 2. Добавление `$PYENV_ROOT/bin` в `PATH` — чтобы shell находил команду `pyenv`.
> 3. `eval "$(pyenv init -)"` — инициализация shims и автодополнения.

---

## Шаг 4 — Применение изменений

Чтобы изменения вступили в силу, перезагрузите конфигурацию shell:

```bash
exec "$SHELL"
```

Или закройте терминал и откройте новый.

**Ожидаемый результат:**

Терминал перезапустится. Приглашение командной строки появится снова.

> **Что произошло:** `exec "$SHELL"` заменяет текущий процесс shell новым, который читает обновлённый `~/.bashrc` и выполняет инициализацию pyenv.

---

## Шаг 5 — Проверка установки

Убедитесь, что pyenv доступен:

```bash

```

**Ожидаемый результат:**

```
pyenv 2.x.x
```

Конкретная версия зависит от даты установки.

> **Что произошло:** shell нашёл команду `pyenv` в `PATH` (в `~/.pyenv/bin/`) и вывел её версию.

Дополнительная проверка — убедитесь, что shims настроены:

```bash
echo $PATH | tr ':' '\n' | head -5
```

**Ожидаемый результат:**

```
/home/<user>/.pyenv/plugins/pyenv-virtualenv/shims
/home/<user>/.pyenv/shims
/home/<user>/.pyenv/bin
...
```

Директории pyenv должны быть в начале `PATH` — до `/usr/bin`.

> **Что произошло:** вы вывели первые элементы `PATH` и убедились, что pyenv добавил свои директории раньше системных. Именно это позволяет shims перехватывать вызовы `python`.

---

## Итог

Вы установили pyenv и настроили shell для работы с ним. Теперь pyenv готов управлять версиями Python — установка конкретных версий будет рассмотрена в следующем уроке.

## Проверка

```bash
pyenv --version && echo "✅ pyenv установлен"
```

**Ожидаемый результат:**

```
pyenv 2.x.x
✅ pyenv установлен
```

---

← [Назад](../01-what-is-pyenv/README.md) | [Оглавление](../../README.md) | [Далее →](../03-installing-python/README.md)