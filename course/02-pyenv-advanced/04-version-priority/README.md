← [Назад](../03-pyenv-shell/README.md) | [Оглавление](../../README.md) | [Далее →](../05-test-version-switching/README.md)

# Приоритет версий в pyenv

> **Модуль 2 · Урок 4** | Время: ~20 мин

## Цепочка приоритетов

В предыдущих трёх уроках вы познакомились с тремя способами задать версию Python. Теперь важно понять, как pyenv выбирает версию, когда заданы сразу несколько настроек.

При каждом вызове `python` pyenv проверяет источники **в строгом порядке**:

```
shell  →  local  →  global  →  system
  ↓         ↓         ↓          ↓
PYENV_   .python-  ~/.pyenv/  /usr/bin/
VERSION  version   version    python3
```

1. **shell** — переменная окружения `PYENV_VERSION` (установленная через `pyenv shell`).
2. **local** — файл `.python-version` в текущей директории или ближайшей родительской.
3. **global** — файл `~/.pyenv/version` (установленный через `pyenv global`).
4. **system** — системный Python, установленный через пакетный менеджер ОС.

Побеждает **первый найденный** источник. Если `PYENV_VERSION` установлена — остальные проверки не выполняются.

## Эксперимент: демонстрация приоритетов

Проведём эксперимент, чтобы увидеть приоритеты в действии. Предположим, у вас установлены версии 3.11.7, 3.12.0 и 3.13.0.

### Шаг 1 — Только global

```bash
pyenv global 3.12.0
pyenv version
```

```
3.12.0 (set by /home/user/.pyenv/version)
```

### Шаг 2 — Добавляем local

```bash
mkdir -p /tmp/priority-test && cd /tmp/priority-test
pyenv local 3.11.7
pyenv version
```

```
3.11.7 (set by /tmp/priority-test/.python-version)
```

Local перекрыл global.

### Шаг 3 — Добавляем shell

```bash
pyenv shell 3.13.0
pyenv version
```

```
3.13.0 (set by PYENV_VERSION environment variable)
```

Shell перекрыл и local, и global.

### Шаг 4 — Сбрасываем shell

```bash
pyenv shell --unset
pyenv version
```

```
3.11.7 (set by /tmp/priority-test/.python-version)
```

Без shell снова действует local.

### Шаг 5 — Сбрасываем local

```bash
pyenv local --unset
pyenv version
```

```
3.12.0 (set by /home/user/.pyenv/version)
```

Без local действует global.

### Уборка

```bash
cd ~ && rm -rf /tmp/priority-test
```

## Диагностика: откуда взялась текущая версия

Команда `pyenv version` — главный инструмент диагностики. Она всегда показывает не только номер версии, но и **источник**:

| Вывод `set by ...` | Источник |
|---------------------|----------|
| `set by PYENV_VERSION environment variable` | `pyenv shell` / переменная `PYENV_VERSION` |
| `set by /path/to/.python-version` | `pyenv local` (указан конкретный файл) |
| `set by /home/user/.pyenv/version` | `pyenv global` |

Если вы не понимаете, почему pyenv использует определённую версию, начните с `pyenv version` — ответ будет в строке `set by`.

## Сравнение с альтернативами

### pyenv vs asdf

[asdf](https://asdf-vm.com/) — универсальный менеджер версий (не только для Python, но и для Node.js, Ruby, Go и др.). Его система приоритетов очень похожа на pyenv:

| Аспект | pyenv | asdf |
|--------|-------|------|
| Глобальная версия | `~/.pyenv/version` | `~/.tool-versions` |
| Локальная версия | `.python-version` | `.tool-versions` |
| Сессионная версия | `PYENV_VERSION` | `ASDF_PYTHON_VERSION` |
| Приоритет | shell > local > global > system | Аналогичный |
| Область применения | Только Python | Любые инструменты через плагины |

Если вы работаете только с Python, pyenv — более простой и специализированный инструмент. Если вам нужно управлять версиями нескольких языков, стоит посмотреть на asdf (pyenv-плагин для asdf существует, но в этом курсе мы его не рассматриваем).

## Частые ошибки

### Ошибка 1 — Не понимать, почему `python` показывает не ту версию

Вы установили `pyenv global 3.12.0`, но `python --version` показывает 3.11.7. Скорее всего, в текущей директории (или одной из родительских) есть файл `.python-version`. Проверьте:

```bash
pyenv version
```

Строка `set by` укажет на источник. Если причина в файле `.python-version`, который вам не нужен, удалите его или используйте `pyenv local --unset`.

### Ошибка 2 — Забыть про `PYENV_VERSION` из другого процесса

Некоторые IDE и скрипты устанавливают `PYENV_VERSION` для своих дочерних процессов. Если `pyenv version` показывает `set by PYENV_VERSION environment variable`, но вы не выполняли `pyenv shell`, проверьте:

```bash
echo $PYENV_VERSION
```

Если переменная установлена — сбросьте:

```bash
unset PYENV_VERSION
```

### Ошибка 3 — Ожидать, что приоритеты «суммируются»

Приоритеты не складываются — побеждает **один** источник. Если установлен `pyenv shell 3.13.0`, то не имеет значения, что в директории есть `.python-version` с 3.11.7 — будет использована 3.13.0.

---
← [Назад](../03-pyenv-shell/README.md) | [Оглавление](../../README.md) | [Далее →](../05-test-version-switching/README.md)
