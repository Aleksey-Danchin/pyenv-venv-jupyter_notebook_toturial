# Эталонное решение: python не найден после установки pyenv

## Диагностика

### 1. Проверить, что `~/.pyenv` существует

```bash
ls ~/.pyenv/
```

Директория на месте — pyenv установлен физически.

### 2. Проверить, что версии Python установлены

```bash
ls ~/.pyenv/versions/
```

Версии есть (например, `3.12.0`).

### 3. Проверить `~/.bashrc` на наличие инициализации pyenv

```bash
grep pyenv ~/.bashrc
```

Если вывод пуст — строки инициализации отсутствуют. Это и есть причина: shell не знает о pyenv, shims не добавлены в `PATH`.

## Шаги решения

### 1. Добавить строки инициализации в `~/.bashrc`

```bash
echo '' >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
```

### 2. Перезагрузить shell

```bash
exec "$SHELL"
```

### 3. Проверить результат

```bash
pyenv version
```

```
3.12.0 (set by /home/user/.pyenv/version)
```

```bash
python --version
```

```
Python 3.12.0
```

## Объяснение

pyenv работает через механизм shims[^глоссарий] — прокси-файлы в `~/.pyenv/shims/`, которые перехватывают вызовы `python`, `pip` и др. Чтобы shims оказались в `PATH` раньше системных бинарей, нужна инициализация при запуске shell:

1. `export PYENV_ROOT` — указывает, где установлен pyenv.
2. `export PATH="$PYENV_ROOT/bin:$PATH"` — добавляет команду `pyenv` в PATH.
3. `eval "$(pyenv init - bash)"` — добавляет shims в начало PATH и настраивает автодополнение.

Без этих строк `~/.pyenv` существует, но shell о нём не знает.

[^глоссарий]: [Глоссарий](../../references/glossary.md)

## Откат break.sh

Если нужно вернуть исходное состояние `.bashrc`:

```bash
cp ~/.bashrc.bak.pyenv-debug ~/.bashrc
exec "$SHELL"
```
